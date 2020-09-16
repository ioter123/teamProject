package com.weather.proj.member.util;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
   
    public class EmailSend  {
         
        @Autowired
        private JavaMailSender  mailSender;
        
        private MimeMessage message;
        private MimeMessageHelper messageHelper;
        public void SendEmail(Email email) throws Exception {
        	message = mailSender.createMimeMessage();
            messageHelper = new MimeMessageHelper(message, true, "UTF-8");

            try {
            	messageHelper.setSubject(email.getSubject());
            	messageHelper.setText(email.getContent(), true);
            	messageHelper.setFrom("snfndwl8250@gmail.com", "JESUS admin");
            	messageHelper.setTo(email.getReceiver());
               
            }catch(MessagingException e) {
                System.out.println("MessagingException");
                e.printStackTrace();
            }
            try {
                mailSender.send(message);
            }catch(MailException e) {
                System.out.println("MailException");
                e.printStackTrace();
            }
        }
}


