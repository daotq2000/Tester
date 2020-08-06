package Mailer;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
@Service("mailer")
public class Mailer {

@Autowired
JavaMailSender mailer;
public void sendMail(String from, String to, String title,String subject) throws MessagingException {
	try {
		MimeMessage mail = mailer.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mail,true,"UTF-8");
		helper.setFrom(from,from);
		helper.setTo(to);
		helper.setReplyTo(from,from);
		helper.setSubject(title);
		helper.setText(subject,true);
		mailer.send(mail);
	} catch (Exception e) {
		e.printStackTrace();
	}

	
	
}
}
