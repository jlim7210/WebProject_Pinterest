package com.mp.email;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Component;

@Component
public class Entry {
    static final String FROM = "tndus7210@gmail.com";
    static final String FROMNAME = "Jaejoon's Pinterest";
    public StringBuffer TO = new StringBuffer();
    static final String SMTP_USERNAME = "tndus7210@gmail.com";
    static final String SMTP_PASSWORD = "granethan17";
    
    static final String HOST = "smtp.gmail.com";
    static final int PORT = 587;
    
    public StringBuffer SUBJECT = new StringBuffer();
    
    public String BODY;
    
	public void send_email(/* String[] args */) throws Exception {
        Properties props = System.getProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.port", PORT); 
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
        Session session = Session.getDefaultInstance(props);
        MimeMessage msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(FROM, FROMNAME));
        msg.setRecipient(Message.RecipientType.TO, new InternetAddress(TO.toString()));
        msg.setSubject(SUBJECT.toString());
        msg.setContent(BODY, "text/html;charset=euc-kr");
        
        Transport transport = session.getTransport();
        try {
            System.out.println("Sending...");
            
            transport.connect(HOST, SMTP_USERNAME, SMTP_PASSWORD);
            transport.sendMessage(msg, msg.getAllRecipients());
            System.out.println("Email sent!");
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            transport.close();
        }
    }
	
	public void close_entry() {
		setSUBJECT(null);
		setTO(null);
		setBODY(0);
	}

	public StringBuffer getTO() {
		return TO;
	}

	public void setTO(String tO) {
		TO.append(tO);
	}

	public StringBuffer getSUBJECT() {
		return SUBJECT;
	}

	public void setSUBJECT(String sUBJECT) {
		SUBJECT.append(sUBJECT);
	}

	public String getBODY() {
		return BODY;
	}

	public void setBODY(int code) {
		BODY = String.join(
    	        System.getProperty("line.separator"),
    	        "<h1>Hi, we are Joon's Pinterest</h1>",
    	        "<p>We value our visitors' security the most.</p>.",
    	        "<p>Even it may seem inconvenient, your email verification helps our anti-hacking system and password finding.</p>.",
    	        "<p>Please remember and input this code below at our website</p>.",
    	        "<b style='font-size:150%;'>"+code+"</b>."
    	    );
	}
}
