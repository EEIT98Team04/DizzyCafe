package minghui.utils;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtils {
	 private static Properties mailServerProperties = null ;
	 
	 
	 public static void generateAndSendEmail(String to,String subject,String html) throws AddressException, MessagingException {
	 
	 if(mailServerProperties==null){
	 // Step1
//	 System.out.println("\n 1st ===> setup Mail Server Properties..");
	 mailServerProperties = System.getProperties();
	 mailServerProperties.put("mail.smtp.port", "587");
	 mailServerProperties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	 mailServerProperties.put("mail.smtp.auth", "true");
	 mailServerProperties.put("mail.smtp.starttls.enable", "true");
//	 System.out.println("Mail Server Properties have been setup successfully..");
	 
	 }
	 // Step2
//	 System.out.println("\n\n 2nd ===> get Mail Session..");
	 Session getMailSession = Session.getDefaultInstance(mailServerProperties, null);
	 MimeMessage generateMailMessage = new MimeMessage(getMailSession);
	 generateMailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	 //generateMailMessage.addRecipient(Message.RecipientType.CC, new InternetAddress("test2@crunchify.com"));
	 generateMailMessage.setSubject(subject);
	 String emailBody = html;
	 generateMailMessage.setContent(emailBody, "text/html; charset=UTF-8");
//	 System.out.println("Mail Session has been created successfully..");
	 
	 // Step3
//	 System.out.println("\n\n 3rd ===> Get Session and Send mail");
	 Transport transport = getMailSession.getTransport("smtp");
	 
	 // Enter your correct gmail UserID and Password
	 // if you have 2FA enabled then provide App Specific Password
	 transport.connect("smtp.gmail.com",587, "todoenilTest@gmail.com", "JK5566778899KJ");
	 transport.sendMessage(generateMailMessage, generateMailMessage.getAllRecipients());
	 transport.close();
	 }
	}