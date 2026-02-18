import smtplib
from email.message import EmailMessage
app_password='mppc nbqg euul ltnk'
def send_mail(to,body,subject):
    server=smtplib.SMTP_SSL('smtp.gmail.com',465)
    server.login('anusha@codegnan.com',app_password)
    msg=EmailMessage()
    msg['FROM']='anusha@codegnan.com'
    msg['TO']=to
    msg['SUBJECT']=subject
    msg.set_content(body)
    server.send_message(msg)
    server.close()
    