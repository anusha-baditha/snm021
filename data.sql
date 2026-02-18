-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: snmdb
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `filesdata`
--

DROP TABLE IF EXISTS `filesdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filesdata` (
  `f_id` int unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `filedata` longblob,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`f_id`),
  UNIQUE KEY `filename` (`filename`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `filesdata_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userdata` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filesdata`
--

LOCK TABLES `filesdata` WRITE;
/*!40000 ALTER TABLE `filesdata` DISABLE KEYS */;
INSERT INTO `filesdata` VALUES (3,'download (3).webp',_binary 'RIFF,\0\0WEBPVP8  \0\0À\0*88?1‚·T®¨%1-—\Ì2 &	G_q\"p¯\à\ÃM\ñ\ä\ãT\êş_Ã«·-ş7»§ø¬ÿ\÷[û\'ü\\\Ã\Ò\óy0\åhø\õüúıûÿo4)°Jf©§š\Ì2œ¤–›\í·\'¤XUGG„ùƒ´Ÿ\ÇSï‹“D‰JØ\ôN,Æ…yã®¡i\ß_\Î\Z±³tN7TZ$\ìoYW\r\Ì»r\Ô\Æx³‚l\ğ‹z1}~@\ö\ÒøÁ–|‰NQK™\ñÑ¤<H\Ò6b	¾\×- É™Á/\Ì\îp\Ø\ä¨r×’[«$ £6e]`\Æ\Ğ\ëy\Ù\Ø\\Ÿ\èê©‰…^™®|Ğ’¨\ÉAlgluq{\È5_\È\"\Ç+\ä[\Â)\ZtV-\Şz=½p5F¿\å\áŠ\åz\Å\á¦RJJ¸\ÇjŒúe(\ÒvQ\Å\ÛLo³\ì¯$’üp9\Äª…¢–S®€ÿ}+\'›\'•ø8™–û\áJ¢¶4y]Ü 1ú\nÃ‰\Ú\åR\Ú<A\÷a®\05\Z€szc±§\'o‹jc6\ä’Sj´Ì³ŸtÉªŠ\"\ã¹w\n¹Y\×\Şw–±û\ÂB\É,\Ã¼,B*Ip=Š–{´‚\'\ô\á\ï—T™¿ úş\Î\ì^\Ù0O·?§Guœ,+\Èo[-ø´’Ú˜KƒŒ[2h\ËVAáµ¤²‡\âbWvwu>#°jj.Š@ªºÍN`ÿ²Pü\ÖÌ˜\ê˜p´z\ö\Ó\\\ò¿\Şw`Bùa/\Å\÷¸ùM}Q†\Ğ#P|OÆ›\Î\ò\Í\Ç-+\à£;µz%\Ê\å\Â<\Ø\ØVÅû\ó™\ËZ\Şı\íuaÓ‹¶)2t1Ì–˜&‡J\ÑÙ³\é3#3\ó8Hx\Æ:ªb§\ç\òPm\èw1¿Ü¯\È\ëy\Âx\ãNŸKYJ\Êa\È\ì™Ò¹$…\ÕQOO\Í)Ì³qûs§³\Ï{† ç£ƒ\\Te”™P\Éc\ğ\ß\r­Af.2K.`\Â\Ï+\È\İS<.ƒë°·\"n£\']\Â\r\Î7\é\Äª\ó›¿|?h±L‚’Ey{\á\0\áLº–n+0\Ùí—¡¯x\æC\ğ3™\Z«Ê¨4ı\î×‰\r\âOE!\Ê9Iı³¼\ï\"r	\Îti,\í£=Ÿx‹²ÁÜ¹346´5e\ä\õw®\'tKZ¥ş\ÙYû¿½\Î\'2±\İ“L£«B\æ~AA1n\'.\÷»]\Ã\ÜÎºÀ[†úH…­Q&Ÿ¸\á»¼i\à¥^vf´k¤®‘B‹\ë·X«MÛ›¶Ä“*qŸ\n\Õ\Ú\Ã\"Œ3UvÃ¹Å…¡\òB‡\ñ\r\Ï\Ç&BP™\"@u£P0X´_\Ôû9\İ_^U•Q’\İYqN\à:&|Ì”E\ÜØ•¾\È[B“\ï\æŠ[¡dL}\îşùy\Ğ\Å\ØX˜\\u\ÓD„gÚ§\Ö\íN‚\ì²Rx¨¬\×u®\Ñ_nn¢Wa(Ø—b\÷P _>œbP\ëH‰ƒ>Œ«\ç\êq¦L«9\ÙNu«+*Œ\Z\Äa\ËX.a]¸\İ.z\0_\÷`%UÛ³„‡\ß\ÖjL\î,Í£»i»¯¶\é0%Š$Z„‘\Ö8û\ã\â»F¯M4;£c~¿6—3¹\ÃXüu‡\Æ\Òkq+j\ğ0À5„È–v_\è\Ú\Èı \ô¤ı	<£½p3Dg¬¼\Ü-´‚E-¶\Ğq\ÑJ\Ô\ÓlÇ’\î’b«¥\Í Q¿KÀIÁ}\ä›\Å\ä¹2\æ7og\è\ãÛ˜\rg\Î\Æ6Cy\Ød‡,©UX\í„\\\ÍX \ôß•ew<\ôw6jxu¿by•†Å”\×EÕ•[ª\ô/ûG\'¿.iŸ`hZß—ºDÈ‰¢—\Û\à£K\Æ\Ğ>\\H©ÿûT.$Tg‡YDú.:˜”\0.zQ¬\Ï\öÂ›\éX\ä>j?ª‚²\é\Ü!\ïA\éT\æĞ»jUB{È†¸©$Ÿ\ØÏ¤aaÅ§:ZJ6\öd\î\í\ì]^¤ ˆ=H”4\ÏQ\ñ@\rKÆ–·\Íş7Ÿª™·qP\år\õ¡)\ös©\î\Ò‡\ó726ŒR\ß_EÎ´=dS\Í%:„\é2\òB·Á\0\÷\ëº\äA\Ù`€œª_\éÁ\Éú“¦80\Ğ\Ç\ê<\Ô\òÖ¯°2\ìùO\ÖŒa–ª\èBY¢N[l-\ç\án0³rû\ÇuG\É\äµ\Ø\0\0ş\Üa«¸o\îGbˆ0\Ü°ß‡¢k8·z&C¡×€\Ş£Œ\á5\à\ÏÎ˜Cs\Ì³aXê©dr\çm¡m–\ïWOc(½\Ëfs©>HCø\Ï\Õ\ò\ì¦~¿]\Üjqu©\0\ğ?°\àu…\Âh)\Åã½–\ér\ã’0\\´2\'Ó¡xqo\á\Û_o\ô:T‰û©Jq\Â5œ-Â \Æ\"ŞµH\à\ğµr–\áÿ\ÈS`4˜k4ú\n­\é\Ë\Û3IŠ…3\ä‰#„¹ª‹!!\ïQ[œ8:¤ø¢ü\n\"\×`7(\Ç\Ì\ó1¹w™DVyA\Í!¢\î\n#\Ö]‹	øıJ\ñ\á˜Qü\Şÿ¶s^R\çµû\n\n-ş\Öm\ÒO\å\ê\ô$.-˜¢§‹\í\İ8{rû]\è•‹T<Ó¸d¸¯\Ø \Ô$\ï\ZK—o,\İ\ëP¼\×C’w—­\ŞsS\è#×„	¥\ë{¾l½z‰\ä\õO\ö\ã\×ù\è\\\Ãr%:%¨\Ï6\Ôv$PŒ	Cœ¬ü\ê\Å=../_Do\nf\íh\åD—5 ü?©Y\0N\äû\Õx#Ÿ\à27a8rZi\Î\"±†@XJ`%o™rkŸ±\İD\İHA\ëh·\09Y\ó\ãù]=‚x-„Í¬•\Z©\êùÓšø2a‰Öªƒ‡m\È1(.+p¢;«Ëº\ì[b¦gÁ¦¢\ÊŞ—¡dV,J\Ò\Å`\Ò\á\Ñ\Ø¶YkT¾®³\Ñù„Š\Çø²j62¿tRc53\ğú%F¦±\àø¡ÿ\õ1|\Ş\Ä\ö\Är[¶\\\n†‹\æ*\Ò%ş`20™v¨œ]\ä·EEÈ‘n\äúµ*{\Ó\'\ö³mŠ‘\à\Ğ3lY>¡‚\Ò/2ˆj…\"F&\Éj\îe2‹\åv¾\0Œ\0Ã€‹üm;+B™ÄŒ„Õ©\r·”5_\÷7~\Ê\ß\ì/|\Ëy¡\Ü\ÆH\÷:£¢V:A*i¢Ns¿V\ä‘zf\è#lA\Å\ì\ã\Ïwc!%³B<„¬\×û0|Á\Ş\æÓ›Á\É3¸„)”\ÖĞ¤^+“#%\í\ç1\"¤\íƒbÿ´Bü>/™w˜}h\ÃÎ“eGkª\0a¸Q\ñb\à\å‹º_H\íkš½5\İ#=Z\"CV¾†\ÇV«\è¡ï‹‚w]\âÔ_1\çÁt\×\æ|=üDÀ—9Ñ–¯ÿ\á3j\â\â‘a\Ş9Y\à“c\ËMª5\ÑKH‹\ê¸n¯L¼µ’YŒPu53F\Ò\"h°[ühDº®­c‘‚\çšCn²:I7\'\Ø\0\Ö\ì <\\Ÿ§k\î\íı\İ,\'ı\Z€R¾\ÒÔ¾m\Õ¸‚if¤§\Z‹\\Î‡µªGÿxŒ9\ÖF\ô¢\Éhµ&y2&G‹‹.sÒ‡0M\îY1É“ŸR/ù[\ì-vYß´\0\çHd\Z?Më¨«*Q\Õ(ÿš/v\\|la`\áU§yı/\ÅÁ^\Û\ÓU¡\Õ_·…•±\Ñ\Z7¾\ÃÃ‹\ÍRš\õ+[¿d¤a—“ÿk\ç\ÂÙ˜ß‰i\0\Z°´$\è;w2ü\âŠ\Ëi\Ò\ÄJ3•y[­¹ª\ö$i8\ÊqVas„[D\ÔBŒv\Ù\á\nWÉš\Ú˜~hb-6CS-Dym\Ú\îW¹™\Í@Ò™¤*©wÉŠ	o\àR\ğ†\ĞË’§\ÈK•\â¥VRl˜Ma«ü«\é*]¡\0.\n‘³‘K\õcË½a4|\ÛoÄ¬›Iq\éšÀ\ğ0…›\îÊyW\ïÚ”J1+\Û~ù\é\ÙT³\ëš\Êˆ\nø&\Ä\Ô&§ÚŸ8_l—†ü2\×\ñC~›}Q¼\rW\ÒT«‹CuYy uUh´wZÿ\ì\õ–¡n\í\Õım¬<\ÙV€›†ú¯¦\Õ,\õ‘\Ò\ĞvM+¾·8dp¾Ã®E]Q“—\äSµ[*3I-r|y ˜-ƒ­@P~xJ—Š\ĞXnnª^;­¶¸\ãa©‚RS\óqpº	zz\ò\í\àhı&\Ìrƒy\ÇK\Ïı4\ê73‹©›“O\ÑR\Ì¿	B\ÄIL{L\æv¤•Y\Õ\'\æ\è!WDa¹\"\"\ö‹e©’“–\\\ó£©`s…w\Î25¬|\í\ËkBš¯q\ác\r\Ä\ËJ‹\èqû\İ:ıŒE\â\ñC\ñE)”n~_N’½À ~4«\03ˆ\ĞùN!œ¾0Š¹\è2\Â@`\æ·%f¤j·aúÇ¬\ğ\ïM[B\È\æ\r”\Ó\ìl%s%d\×Z]\ZVb\àû¤an¡:B.r™¯“\0,ú·y¡CÂ½5n†?\Ë\ÑbøZ^\ß&+\öw\ÖJ=«¯MS\àD$Ü²9¡7\"h«\×ç ‹²œ.\æÀ†s³«1\ÔúÓ¯­~”\à“ªL’»\ä0²	%Ş¶B\'¥‘š\ôa\Ì\\8ƒ+\òŒTû .=j4UÇœ¥BP¤«–…ş\Ğ\Ø=\ô!ºHL-e\à\Í,²(œü\æ\Æ8\Ê\Æ\â\n¥~¨¸?šƒ\ğ#üµ˜BƒY… z\æ\É%*|N\Í\í\Í\îş¶J5_Œ¾&X“–jCƒ\Ñ_·%\ñ:)½B–¤\ï\Â(Np´ıwgp2\à˜º”®ª/$JŠ\rY¨\Ò:¡½[—\Å\Ü(ú¢yM\óµV\ë\á\ŞM¯´\ã?g|H!$_}\Ç(m\Ë4¸qÚr}\'?\î\r\Ì\äP¼—J»\ÎWscj®¬U¾wY\\ƒZ<‚Aş\\\ò\ßE\æ\Å\àrcş\à\İ\î.>~_4³tİŠ€\õæ‘•˜t\Åı!F9„\Ø\0g„\Ãi›Kºo\ÊÉš\á\ó.\ÛC\ÇW¤†\Ö;@=z\Ä³”›\×}²D/\Ó\ëIThN³FZ\ê¾Bù”	pC\ö¥\Ş[_w{3I\ß\ç‹\æ\ö^\å†Ài’§<iü\Û)%\ïx›\ò_Iøt²Ÿú¿\Ù\ğ¡	\ó%­p¸°r\Ü\ÂC\Ş¯EBK®m\èŸUX<\âSªN=`f \ëÀ1B\Ã\é0­ƒ\è\Ş\ímMlu\İ\ğ3\'\Ú\ï|\â\é\î\Ö\å\Zl¦lšÊµ\ÏO`j\îB»˜4ø\Ë\İhf\ğ\É\0µq¡d\\¨Ve\ãi¸\×Ø¼Eır³Ğš\ä^\É\İT\Ù\õ”iš\ÚŒ)j*z\'‚\ÎYÂ¨T´2\óp\Ò\ÅARGU\èûU\Ñ=x]\ç[\æ—C3\Ç%Y—\æ\ô\'\ÖR](aœs¥„	O{‰n\Ú\Ñt l!5Áƒ–¾P\ÈXSpSª\â\ÜE\éÂ—¢…´w4¨Gb\Õ’y•\Ôq_\öwª6Œ„‰!´Ÿ( \â¹ı\ñ10-„\ç’œ\êL€Á¬{7i\Õd\r5b‰\áA–•rwI F–\Ò!F[\÷s¡—Œ\ô\ó˜‹W\×/À\áy;6qE\é\Ûyø}Ã\êD\×\èLQ’\ÇAaš½š-¿¬–\Æp(“kO\î«4“g+A®È£ÿ4PuI•i˜#\Æ/˜4Ş¯MƒB^2\ëGzK¤\÷ÒŸ\ÌyR²\å<\å\Ã\é\âb\êA+¤ Xi\Èu\òª\ñ½š\ÆV\àR¤TşeBŠ+Â³\'\"\"ÁÔŠg\ã\ÍÓ¨« \ó\Ëx0´ıq;\ñ	E¹?—–ª \Ä)U‹P_‘xD\Ùv´Å­{µR²š\ÎT<\âkGºı’2¥u8n˜1»\Ô>\Û^Á\Ûü°\é\ÖE~©-R\îv\æ©<r\í5\Ê\Å ‘\Ø#‹„;­Œƒ¡M$f€¾\ïŒ\ğx\åhK\ñk˜¤	\áI\ÆlARøbPuf$ƒ‚Š\Û|\ïµ!\Îı\ñ¾PGD\ÜûµM\ÙSŸ*€5\Ú\ë•Y\'Ê˜»\ğŸ¾\Æ\ä8¸S¬rOD\ò\ê­\Îá„œsvM4\×Ì‚«jy³b\ïMN\å“=\÷\á\é\÷k*\n:\õrm\Æu*¨\èv)\ö(˜[\Ù”f‘$\ãn\ãü^€¢P\'\'\âi§=(\ë|Ep|lhùu5‹ŸG±H\Æûk×”3®\êùi[Ü¾\Èb[Z85m\à@P&\Ç\í#ş¬´ƒ€\é8\î¿Û\ß=»¢”«\Z¶¼\\=úúŒ\ô6<z6¥«\î\É\à)@\ãÕ¿–6W\'™¾i¢\'\ÈKr*¤m%&’l\ÔT¸7›\'6\ë\è§n\ÉTm£8Py˜\õ\Ë:\É0L‚Á\Æû\Û\Î\r—×¿b™‹W§—JV\ğ\Å_¶©£i\rü(@¨ª\õ®\ÆSpz_«PC\æ¹ûA²´\ğ«¾±\îmmş\İ\ónd”YaŸf½a×ˆ\É\ÑZvÒ«OE\ïÉ¹•Vûq&\Ã\â`\\\ŞÏ²•P†Á%UD.v¥\çD‰\Ş\0¶W˜v´£ıç¸»\ê\é€¦Š\ê\İo×–Ø®5C›–\0)˜v“İ”$\Úxf;¥\ãv\Ìcøºz\Ï\Í\êUÚ™\æ\r~v5\ÂÍ»H4‚/ÅŠ“B¾fdáŸ‚.9\Ö_/ÀC½=¦2MUsT$Õ\×Ê¨£j\ïPü\ìÏšœ­:€7ı&»-D=\Ù\ò§N\÷zP\à–Ú˜\ìYı\0¬z\äº|a©2\Z²Ñ¥¸\Õ?ı,Œ?/$‘V˜œ¹}iƒ\÷Á£Å£µˆ\â\\\ó¸X	‘\ç[\Î\äs\ï\èL©\'gzU¸O\0^Œ\Ô„41L\Z%£\õq\è[o\âÉ’M{8+¯G‘D£\ì\ÊüR¬Hs=\Ì4\ã*w9b\Â\ğ,~\È2\çşp’‹›w\ÎÆ›\Âş\Ñle\ÉS›@\ö»bX…¿\Æ\\“úD\Õ6s¡MÀ¶¤­#Ò…„­oH,±\ß\00fÌ³\ô\Ş\í\Ö\Ó\ë¤\İÅ¾aq\ã3„AŸ\à_†a›|\Ì2c\ôe«¤¾¾Õ°Ã¹\÷\rJú\Å-\É|\ñÓ\Ñ&º¢\n€a\'\ä\Ï\ĞUµù|Qr­geOIÛµ	\rFz\Û>:©	e^\õ¾aü\ó\Øk-\Ãmd\â,y~´9º\'›Û©“\Ñe«\ÙAº\ò\ó µ <,¦f\\N,\Ä\á3cE\å[Ñ»\Ş^iLº‰¢.K\å„s9vx›3¨\ÄU)—t7¸¡†üzPgh¸ƒû[\ëb\ÏSBø$C\ÈV×¾3\ërÓ³´3ÿ•K\Ä/\Ú\ìA…\Òøz\ñ]H¬h,Öº\ì-5¯EJ«ıüW\öJˆ;¹\Î\Åz\Æ*Y\Æ\É\àC\ï\r\ò—6Ò·ıú\È\Üı\Åj\Õi\ëø\'Ì³ú›Nir\İF}\È6Sbã‘’\òDa•\óH‰‰\à<m7º¸*n\ì;Ì„K\Êh§¬§rºÆªa\ã¸\à\Û1•\æÎš\ÅF7´\÷µ¦\à\és¢/\Ó\ãwøùT!\é_ †<€>Wb}R B`\ÄXlF\ë\Ü\÷=¸z\Ï(cù’€’S\Ú+\Ùv\Î\Æ@N3\ê¤h§³ÀQ+1\ÌCGG¦\Ã\õ²A!\"\éº9ı&È²fZ´,z\ëhœ•Ê¦\Üû\İ \åkd6.(§!\ç‰\ö¾4Pf\Ø\Õ\Ö	üh¡‰4»²­\î\á\Í\ß\Î)Q&\ë9a$\ô—ø!\éU+%\àI4Ù‘‡Œ#…‚ui96e\ë\å¿\ä\ôA®™\Ş_º\àP¸²€\Õÿ\ß${!HAP\õ9q\Ó\Îä±¡\Z\ß\ÔrŠ•T\ïD•jø1 ·4¯°d\ğ\ëÇ”şœ\Ó\à¾Otn†O¶\ß\Åÿ·A\ğ\ÈKb¤P\Û\ïp¦\Û\õ¹Šs ´pÇ’°\Å ¡§[\Ø~\Şu`{\Õ;ü\ë¢Ã\Õı·QŠ\ÅVatéi¥†	)»¶z\èy?+Fµh“»\'\É8.\r>ø»h}À¯\İ\ğ\Ù\Z\Î\ğT‰ş¦HC>F4‡¹Gqu¸G\ÑH?c$Z\ç}^NSx6bùÄ¬C\Å‹ÆqB\å0´¯§.o	\ß\Úÿ°\ñÜœ´\ñ\Ğr¹/\Æa|<\âa2”Ÿ—¨Ğ®j\r\ÔOvi›\òş\Ø7ri(¦}D\á¤Sª±œ\ÓQ.!®À+s\ò‚¬!ŸP5>‚\à?(\èwªºşY‹d‘\İ6#\÷\Ì\â\ån¯¡vª§(·®„U\Æúª) ¬z\Í>\õ\Õ*b“\ÔÉˆ\nÔ¦¤FH™fYƒ\ê1. \r&\Øo´C]ˆq\"\ó «M–Aèš`À,z\Øù\rÎ– \æşu=«¸0{\"Ok_ šl¨€£3,r\áZ.³‡’^\é\ÍœA\ÄÃˆmu cc—4šMp\Â@ Hb)QG\Èc=\è\á\÷AUs\"[Á\ï\õ\ãà¡›…Q,€±\ò©h8¾\å0Su\è\ßo·UøM,Sü\Ê\Z\Ï\Â\É\ØyS:À†\í4\é¢§A\Ú\áTo&H*lD\óÑ4œ^,¥¿1b`\ïH`>­\Ô|¥š0¼Fk==\ì?_ûú>{6zzr\ôF­J·\ê\\#£\Õu\ğ\÷;€o\Òy¡Ä·q\ñt#´\é%-M« w@\Z\õŒ©5\ô™\ÖÀ:ƒ\ïË½«„\ìJh€C²\Õ#Êš>(:ƒ;3i\Úı9Tÿs)\î,3\Ù[‡	—Â‚q©Rfj\õ¹ä‡†ÿ”†&o•\ÑC\ğÅ“®{§8½tJ\èŠ22\0øĞQ\çZY‰;¸~\ß\ã	[\Ğİš5l:YÑ“›øi8 \Ù\í\ğ\\¿×Œˆ@\ÜD\è0w\ì=N\ô„;=Ë¢=\ã¬–ıÚ±g_p‰æ¿\rj\áPˆÁa¥\ó‘\×\Z“\ç\óİzş\ÂÌƒ:´C¡pr\á\ğ\Û¶\Ô\Ç\Õ\ÃuJ«63\ò±.¥\è \ó~7\Ôo¤ƒÎ£{˜R\'¸O\"\ñ´t‘36ÀveÄ¾«Ç‹¼\Ïl§§TU\Ò_\ör\İøù\Íl¡v \Ê\é9=DYklú\nÁ2Ÿ¼8t²\Ñ#Bf5iß)ÀE\Ó\Ü{¶S£„§!KoˆOK\à7\ï\Ô\én\ìA17üsÏ˜Ä‘ D#oıiM_`\ğQ.f\ÇcË‹\áBY?T6q\ó&v\î.j1¢	w·ıd}\ÉÚ¹\Ê\r,g{WI\ôe\Ö$…½ùƒk‚)tÂ\é®g\İ\ç¨1¡S`\÷‡oÀ\ñeºQ_2q*Š\ïU\r>˜Iz!\Û5v\ã\ÖWa;V“\È\Î}Dıü\õÀ\Â m\æeF\ÚD\Î;“\÷:q™úÙ‰¯h1³!\ä±(«súm&\ÑJŒp,\ß3ùIF3\Ëÿƒ¸°m\ñ\ê`I…Ò¼QÌ’½+—e\ÙH^¾´Å­$n·\Ö\"ƒ…\Ú3ü\ğ¾\ÃWEÌ½=X\0ºNxƒbo\Ì\Õr—›\â\å\â\Ô|CÒ°˜\Ú\r,ƒ\0X\r\áG\rW\ÏoQˆh{!2K\Ï!ş-<\õR\ö\Îş“Ï¬v\ö„¶ˆ\â”`I\é\î^\æ™\îbÓ hÎ—¸ùf\è+-pa…\Ô\å#ˆ`°bp\Ï\n¼L!dÌ¸E\'ªh\Ès±šMRû\ÙE-*5a«\ğŸ_K	\òi\Ö[ÿÁ\rdˆ^,d\ÏZ\è\Óf\Ç%\ôq¬\ì€O…Tu­¹¼š\Å\'\çÍ³Ò¥ø¹\î\Æ\á%\÷\â.r¼N`	LI¨c(rw\Ö\ç\ì\âS’‹\â\Ô”¬00!»œÿŠ²jB†£|o±‘¨„\îQs°­‘L\Ä.¡\Çd[e4¥³\ôl\ó¦d\÷š\ö(c	-À\ß\õEg­{üJA04\ó\é†8¬\0V\ó\àd(t_\÷C	,\á\Ú\ä\ñ_HıaªL\Ûk\Ï}a;\Î\äf‘O™!tŒIn\Æ\õû)´L\ó&a\ŞŠ¼\ó\İ\í\ãD\î^ùR½?š\ÖC#\ÙZ{/–™ı\Ù\Ú\÷	ş¤\0{›\Ñ4\ã¾v\î*³ÕŸL\Äp!sYS31½?y\ß\Ä8ÿc:€Zùä¥­¡»\Õ,dC»l\n}\í\èG&\Ñ\ô\á¦\í‡ù\ö\Âf’4şŒJ‚}0) Nª£Buª()HD£1\æe\ÎyC»XûHL¡Cƒ°UQYL]]_\İr\Ù\ÅvsµƒŠŸz3pŞ‰¸\\\Ûy’şú?=Ss­ûf\rqS\â¼\0\0C_Z	}«VFR\äaL\Òıq,ªŞŠ\n´\Ø}0\á	g0qg–\017o¶·­,»\Zg\ë3¿”+¢‡‹\ÏDã„j!’¹\âxH?»\Û9=z\ÑÇ©\"N—d\âŒ\ö¤Q5„K!VMÿ”\÷p“\Æ\ç?Ğ§°atB9\É\ÇLE\æ“$±\ìØŠ¼š\'·\âµc.Cl ˜s§\\cSJÁQª\ç\ß0¿\ö¹›ÚŠ\ØP¹\Çq»£; Gm\àÇµV¨¦B~¹\çObWÒ˜ÿº–­f–	¦n.€+:0S\"«Åœ|-˜ƒ„¨=Ş•Jd‡2LC\Ñn\ÈcR\ğ¿j-»\"OÙ—«4Yv\ì—ø’\ì\İ\0\ê¶fX\ì\ã\İÚKv4ÿŸ5t\ö/DpZ\ç?\Âş\'\ô«\Æ\á\çß¨\Ş\r9\Ã\ê;LYR\ä\÷\ÇLf\Ív x£19º\Ù\Ë{\áD\Ë\Æ`)\åe’\È4\Z9/2\"Ïw§+N—A)gÈ„ e\È\\\Ü\áùb©a	_k\Ô\é!\ç‡,#<\İt\Ñ\\u\Ú\Ù\î\Æ\\XønZ\ó\Û\äĞ¨\ËoŒ|vŒ\Èœod ù(¿\0\0¦&±-»ßp Œ.\á\Ï}¿z‹0yÃ²=\ÃC\Şø«‡\Â\0\0\0','2026-02-16 11:06:20',1);
/*!40000 ALTER TABLE `filesdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notesdata`
--

DROP TABLE IF EXISTS `notesdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notesdata` (
  `n_id` int unsigned NOT NULL AUTO_INCREMENT,
  `notes_title` varchar(255) NOT NULL,
  `notes_content` longtext,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`n_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `notesdata_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userdata` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notesdata`
--

LOCK TABLES `notesdata` WRITE;
/*!40000 ALTER TABLE `notesdata` DISABLE KEYS */;
INSERT INTO `notesdata` VALUES (9,'baditha','anusha','2026-02-13 11:06:04',1),(11,'mysql','asdfghjkl','2026-02-16 11:56:53',1),(12,'asdfghjkl;','qwertyuip[','2026-02-16 11:57:07',1),(13,'asdfghjkl;','qwertyuip[','2026-02-16 11:57:07',1);
/*!40000 ALTER TABLE `notesdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdata`
--

DROP TABLE IF EXISTS `userdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userdata` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `useremail` varchar(50) NOT NULL,
  `userpassword` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `useremail` (`useremail`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdata`
--

LOCK TABLES `userdata` WRITE;
/*!40000 ALTER TABLE `userdata` DISABLE KEYS */;
INSERT INTO `userdata` VALUES (1,'anusha','anusha@codegnan.com','Anusha@123');
/*!40000 ALTER TABLE `userdata` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 11:45:14
