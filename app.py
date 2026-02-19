from flask import Flask,request,redirect,url_for,render_template,flash,jsonify,session,send_file
from flask_session import Session
from otp import genotp
import flask_excel as excel
from cmail import send_mail
from stoken import endata,dndata
from io import BytesIO
import re
from mysql.connector import (connection)
mydb=connection.MySQLConnection(user='flaskuser',host='localhost',password='password',db='flaskdb')
app=Flask(__name__)
excel.init_excel(app)
app.config['SESSION_TYPE']='filesystem'
app.secret_key=b'Z\xc4\xd3\xc8\x88'
Session(app)
@app.route('/')
def home():
    return render_template('welcome.html')
@app.route('/register',methods=['GET','POST'])
def register():
    if request.method=='POST':
        username=request.form['username']
        useremail=request.form['useremail']
        userpassword=request.form['userpassword']
        try:
            cursor=mydb.cursor(buffered=True)
            cursor.execute('select count(*) from userdata where useremail=%s',[useremail])
            email_count=cursor.fetchone() #(1,) or (0,)
            if email_count[0]==0:
                gotp=genotp()
                userdata={'username':username,'useremail':useremail,'userpassword':userpassword,'server_otp':gotp}
                subject='OTP Verification for SNM APP'
                body=f'Use the given otp for verify {gotp}'
                send_mail(to=useremail,subject=subject,body=body)
                flash('OTP has been sent to given email.')
                return redirect(url_for('otpverify',server_data=endata(data=userdata)))
            elif email_count[0]==1:
                flash('user already existed')
                return redirect(url_for('register'))
        except Exception as e:
            print(e)
            flash('Could not verify user email')
            return redirect(url_for('register'))
    return render_template('register.html')
@app.route('/otpverify/<server_data>',methods=['GET','POST'])
def otpverify(server_data):
    if request.method=='POST':
        user_otp=request.form['otp']
        try:
            de_userdata=dndata(server_data) #dict
        except Exception as e:
            print(e)
            flash('Could not verify user details')
            return redirect(url_for('register'))
        else:
            if user_otp==de_userdata['server_otp']:
                try:
                    cursor=mydb.cursor()
                    cursor.execute('insert into userdata(username,useremail,userpassword) values(%s,%s,%s)',[de_userdata['username'],de_userdata['useremail'],de_userdata['userpassword']])
                    mydb.commit()
                    cursor.close()
                except Exception as e:
                    print(e)
                    flash('could not store user details')
                    return redirect(url_for('register'))
                else:
                    flash('User details stored successfully')
                    return 'login'
            else:
                flash('OTP was wrong')
    return render_template('otp.html')
@app.route('/login',methods=['GET','POST'])
def login():
    if request.method=='POST':
        login_useremail=request.form['useremail']
        login_password=request.form['userpassword']
        try:
            cursor=mydb.cursor(buffered=True)
            cursor.execute('select count(*) from userdata where useremail=%s',[login_useremail])
            email_count=cursor.fetchone()
            if email_count[0]==1:
                cursor.execute('select userpassword from userdata where useremail=%s',[login_useremail])
                stored_password=cursor.fetchone()[0] #'123'
                if stored_password==login_password:
                    session['user']=login_useremail
                    return redirect(url_for('dashboard'))
                else: 
                    flash('Invalid password')
                    return redirect(url_for('login'))
            elif email_count[0]==0:
                flash('user not found')
                return redirect(url_for('login'))
        except Exception as e :
            print(e)
            flash('Could not verify user login details')
            return redirect(url_for('login'))
    return render_template('login.html')
@app.route('/dashboard')
def dashboard():
    if session.get('user'):
        return render_template('dashboard.html')
    else:
        flash('to get dashboard pls login')
        return redirect(url_for('login'))
@app.route('/addnotes',methods=['GET','POST'])
def addnotes():
    if session.get('user'):
        if request.method=='POST':
            print(request.get_json())
            notes_title=request.get_json()['title']
            notes_content=request.get_json()['content']
            try:
                cursor=mydb.cursor(buffered=True)
                cursor.execute('select user_id from userdata where useremail=%s',[session.get('user')])
                added_by=cursor.fetchone()[0] #(1,)
                cursor.execute('insert into notesdata(notes_title,notes_content,user_id) values(%s,%s,%s)',[notes_title,notes_content,added_by])
                mydb.commit()
                cursor.close()
            except Exception as e:
                print(e)
                flash('Could not store notes details')
                return redirect(url_for('addnotes'))
            else:
                flash('notes added successfully')
                return 'success'
        return render_template('addnotes.html')
    else:
        flash('pls login first')
        return redirect(url_for('login'))
@app.route('/viewallnotes')
def viewallnotes():
    if session.get('user'):
        try:
            cursor=mydb.cursor(buffered=True)
            cursor.execute('select user_id from userdata where useremail=%s',[session.get('user')])
            added_by=cursor.fetchone()[0]
            cursor.execute('select n_id,notes_title,created_at from notesdata where user_id=%s',[added_by])
            notes=cursor.fetchall()
            cursor.close()
        except Exception as e:
            print(e)
            flash('Could not fetch notes details')
            return redirect(url_for('dashboard'))
        else:
            return render_template('viewallnotes.html',notes=notes) 
    else:
        flash('pls login to viewall notes')
        return redirect(url_for('login'))
@app.route('/viewnotes/<nid>')
def viewnotes(nid):
    if session.get('user'):
        try:
            cursor=mydb.cursor(buffered=True)
            cursor.execute('select user_id from userdata where useremail=%s',[session.get('user')])
            added_by=cursor.fetchone()[0]
            cursor.execute('select n_id,notes_title,notes_content,created_at from notesdata where user_id=%s and n_id=%s',[added_by,nid])
            notesdata=cursor.fetchone()
            cursor.close()
        except Exception as e:
            print(e)
            flash('Could not fetch notes details')
            return redirect(url_for('dashboard'))
        else:
            return render_template('viewnotes.html',notesdata=notesdata) 
    else:
        flash('pls login to viewall notes')
        return redirect(url_for('login'))
@app.route('/deletenotes/<nid>')
def deletenotes(nid):
    if session.get('user'):
        try:
            cursor=mydb.cursor(buffered=True)
            cursor.execute('select user_id from userdata where useremail=%s',[session.get('user')])
            added_by=cursor.fetchone()[0]
            cursor.execute('delete from notesdata where user_id=%s and n_id=%s',[added_by,nid])
            mydb.commit()
            cursor.close()
        except Exception as e:
            print(e)
            flash('Could not delete notes details')
            return redirect(url_for('viewallnotes'))
        else:
            flash('Notes deleted successfully')
            return redirect(url_for('viewallnotes'))
    else:
        flash('pls login to viewall notes')
        return redirect(url_for('login'))
@app.route('/updatenotes/<nid>',methods=['GET','PUT'])
def updatenotes(nid):
    if session.get('user'):
        try:
            cursor=mydb.cursor(buffered=True)
            cursor.execute('select user_id from userdata where useremail=%s',[session.get('user')])
            added_by=cursor.fetchone()[0]
            cursor.execute('select n_id,notes_title,notes_content,created_at from notesdata where user_id=%s and n_id=%s',[added_by,nid])
            notesdata=cursor.fetchone()
            cursor.close()
        except Exception as e:
            print(e)
            flash('Could not fetch notes details')
            return redirect(url_for('dashboard'))
        else:
            if request.method=='PUT':
                print(request.get_json())
                notes_title=request.get_json()['title']
                notes_content=request.get_json()['content']
                try:
                    cursor=mydb.cursor(buffered=True)
                    cursor.execute('select user_id from userdata where useremail=%s',[session.get('user')])
                    added_by=cursor.fetchone()[0] #(1,)
                    cursor.execute('update notesdata set notes_title=%s,notes_content=%s where user_id=%s and n_id=%s',[notes_title,notes_content,added_by,nid])
                    mydb.commit()
                    cursor.close()
                except Exception as e:
                    print(e)
                    flash('Could not update notes details')
                    return redirect(url_for('viewallnotes'))
                else:
                    flash('notes updated successfully')
                    return 'success'
            return render_template('updatenotes.html',notesdata=notesdata,nid=nid) 
    else:
        flash('pls login to viewall notes')
        return redirect(url_for('login'))
@app.route('/fileupload',methods=['GET','POST'])
def fileupload():
    if session.get('user'):
        if request.method=='POST':
            filedata=request.files['file']
            fname=filedata.filename
            fdata=filedata.read()
            try:
                cursor=mydb.cursor(buffered=True)
                cursor.execute('select user_id from userdata where useremail=%s',[session.get('user')])
                added_by=cursor.fetchone()[0]
                cursor.execute('insert into filesdata(filename,filedata,user_id) values(%s,%s,%s)',[fname,fdata,added_by])
                mydb.commit()
                cursor.close()
            except Exception as e:
                print(e)
                flash('Could not store file details')
                return redirect(url_for('fileupload'))
            else:
                flash('file uploaded successfully')
                return redirect(url_for('fileupload'))
        return render_template('fileupload.html') 
    else:
        flash('pls login to upload a file')
        return redirect(url_for('login'))
@app.route('/viewallfiles')
def viewallfiles():
    if session.get('user'):
        try:
            cursor=mydb.cursor(buffered=True)
            cursor.execute('select user_id from userdata where useremail=%s',[session.get('user')])
            added_by=cursor.fetchone()[0]
            cursor.execute('select f_id,filename,created_at from filesdata where user_id=%s',[added_by])
            files=cursor.fetchall()
            print(files)
            cursor.close()
        except Exception as e:
            print(e)
            flash('Could not fetch files details')
            return redirect(url_for('dashboard'))
        else:
            return render_template('viewallfiles.html',files=files) 
    else:
        flash('pls login to viewall notes')
        return redirect(url_for('login'))

@app.route('/viewfile/<fid>')
def viewfile(fid):
    if session.get('user'):
        try:
            cursor=mydb.cursor(buffered=True)
            cursor.execute('select user_id from userdata where useremail=%s',[session.get('user')])
            added_by=cursor.fetchone()[0]
            cursor.execute('select f_id,filename,filedata,created_at from filesdata where user_id=%s and f_id=%s',[added_by,fid])
            filedata=cursor.fetchone()
            cursor.close()
        except Exception as e:
            print(e)
            flash('Could not fetch files details')
            return redirect(url_for('dashboard'))
        else:
            array_data=BytesIO(filedata[2])
            return send_file(array_data,as_attachment=False,download_name=filedata[1])
    else:
        flash('pls login to viewall notes')
        return redirect(url_for('login'))
@app.route('/downloadfile/<fid>')
def downloadfile(fid):
    if session.get('user'):
        try:
            cursor=mydb.cursor(buffered=True)
            cursor.execute('select user_id from userdata where useremail=%s',[session.get('user')])
            added_by=cursor.fetchone()[0]
            cursor.execute('select f_id,filename,filedata,created_at from filesdata where user_id=%s and f_id=%s',[added_by,fid])
            filedata=cursor.fetchone()
            cursor.close()
        except Exception as e:
            print(e)
            flash('Could not fetch files details')
            return redirect(url_for('dashboard'))
        else:
            array_data=BytesIO(filedata[2])
            return send_file(array_data,as_attachment=True,download_name=filedata[1])
    else:
        flash('pls login to viewall notes')
        return redirect(url_for('login'))
@app.route('/deletefile/<fid>')
def deletefile(fid):
    if session.get('user'):
        try:
            cursor=mydb.cursor(buffered=True)
            cursor.execute('select user_id from userdata where useremail=%s',[session.get('user')])
            added_by=cursor.fetchone()[0]
            cursor.execute('delete from filesdata where user_id=%s and f_id=%s',[added_by,fid])
            mydb.commit()
            cursor.close()
        except Exception as e:
            print(e)
            flash('Could not delete file details')
            return redirect(url_for('viewallfiles'))
        else:
            flash('file deleted successfully')
            return redirect(url_for('viewallfiles'))
    else:
        flash('pls login to viewall notes')
        return redirect(url_for('login'))
@app.route('/getexceldata')
def getexceldata():
    if session.get('user'):
        try:
            cursor=mydb.cursor(buffered=True)
            cursor.execute('select user_id from userdata where useremail=%s',[session.get('user')])
            added_by=cursor.fetchone()[0]
            cursor.execute('select n_id,notes_title,notes_content,created_at from notesdata where user_id=%s',[added_by])
            notes=cursor.fetchall() #[(),()]
            cursor.close()
        except Exception as e:
            print(e)
            flash('Could not fetch notes details')
            return redirect(url_for('dashboard'))
        else:
            columns=['Notes_id','Notes_title','Notes_content','Created_at']
            array_data=[list(i) for i in notes] #[[],[]]
            array_data.insert(0,columns)
            return excel.make_response_from_array(array_data,'xlsx',filename='excelfile')
    else:
        flash('pls login to viewall notes')
        return redirect(url_for('login'))
@app.route('/search',methods=["POST"])
def search():
    if session.get('user'):
        search_data=request.form['search_value'] #user search data ''
        strg=['A-Za-z0-9'] #defining a set of characters
        pattern=re.compile(f'^{strg}',re.IGNORECASE) #defines a pattern that consists of above set of characters
        if pattern.match(search_data): #checking the search data matches pattern that means no empty data
            try:
                cursor=mydb.cursor(buffered=True)
                cursor.execute('select user_id from userdata where useremail=%s',[session.get('user')]) # getting userid
                added_by=cursor.fetchone()[0]
                #comparing the pattern with title,content,date using like operator
                cursor.execute('select n_id,notes_title,created_at from notesdata where user_id=%s and (notes_title like %s or notes_content like %s or created_at like %s)',[added_by,search_data+'%',search_data+'%',search_data+'%'])
                #fetching the result and storing in notes
                notes=cursor.fetchall()
                cursor.close()
            except Exception as e:
                print(e)
                flash('Could not fetch notes details')
                return redirect(url_for('dashboard'))
            else:
                #passing the notes data to html.
                return render_template('viewallnotes.html',notes=notes) 
        else:
            flash('invalid search data')
            return redirect(url_for('dashboard'))

    else:
        flash('Pls login to search')
        return redirect(url_for('login'))
@app.route('/logout')
def logout():
    if session.get('user'):
        session.pop('user')
        return redirect(url_for('login'))
    else:
        flash('pls login to logout')
        return redirect(url_for('login'))
@app.route('/forgot',methods=['GET','POST'])
def forgot():
    if request.method=='POST':
        useremail=request.form['Email']       
        try:
            cursor=mydb.cursor(buffered=True)
            cursor.execute('select count(*) from userdata where useremail=%s',[useremail])
            email_count=cursor.fetchone() #(1,) or (0,)
            if email_count[0]==1:
                subject='Resetlink  for SNM APP'
                body=f"Use the given Link for password update {url_for('newpassword',data=endata(useremail),_external=True)}"
                send_mail(to=useremail,subject=subject,body=body)
                flash('Resetlink has been sent to given email.')
                return redirect(url_for('forgot'))
            elif email_count[0]==0:
                flash('No user found')
                return redirect(url_for('forgot'))
        except Exception as e:
            print(e)
            flash('Could not verify user email')
            return redirect(url_for('forgot'))
    return render_template('forgot.html')
@app.route('/newpassword/<data>',methods=['GET',"PUT"])
def newpassword(data):
    if request.method=='PUT':
        npassword=request.get_json()['new_password']
        try:
            useremail=dndata(data)
        except Exception as e:
            print(e)
            flash('could not get the email')
            return redirect(url_for('newpassword',data=data))
        else:
            try:
                cursor=mydb.cursor(buffered=True)
                cursor.execute('select count(*) from userdata where useremail=%s',[useremail])
                email_count=cursor.fetchone() #(1,) or (0,)
                if email_count[0]==1:
                    cursor.execute('update userdata set userpassword=%s where useremail=%s',[npassword,useremail])
                    mydb.commit()
                    cursor.close()
                elif email_count[0]==0:
                    flash('No user found')
                    return redirect(url_for('newpassword',data=data))
            except Exception as e:
                print(e)
                flash('Could not verify user email')
                return redirect(url_for('newpassword',data=data))
            else:
                return jsonify({"message":"ok"})
    return render_template('newpassword.html',data=data)
