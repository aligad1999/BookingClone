
import java.io.IOException;
import java.security.SecureRandom;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;

//https://myaccount.google.com/lesssecureapps?pli=1&rapt=AEjHL4PEQ-5_3_kxZesMxAiKJo0Vv6tSq1TA90Kadzhyxi0_MDdJgGM3IftOvuttcOZMHsHwlYHKjiBkw5R8tDDqdGPLiOaW-w
//https://accounts.google.com/DisplayUnlockCaptcha
public class SendEmail {


    public static void sendPasswordEmail(String mail,String pass) throws IOException {

        final String username = "hotelsys1999@gmail.com";
        final String password = "hotelsys123456";

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS

        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {
            String generatedPassword = generatePassword(8);
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("hotelsys2021@gmail.com"));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(mail)
            );
            message.setSubject("Get Your Password!");
            message.setText("Dear " + mail +","
                    + "\n\nPlaase Copy and Paste that Password\n\nYour Password is: " + pass);

            Transport.send(message);

            System.out.println("Done");
        } catch (MessagingException e) {
            JOptionPane.showMessageDialog(null, "MessagingException "+ e);
        }
    
    }
    

    public static String generatePassword(int length) {
                // ASCII range - alphanumeric (0-9, a-z, A-Z)
        final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
 
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder();
 
        // each iteration of loop choose a character randomly from the given ASCII range
        // and append it to StringBuilder instance
 
        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(chars.length());
            sb.append(chars.charAt(randomIndex));
        }
 
        return sb.toString();
    }

    
    
    
    
    public static void sendNotifyofCancel(String mail){
      final String username = "hotelsys1999@gmail.com";
        final String password = "hotelsys123456";

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS

        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("hotelsys2021@gmail.com"));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(mail)
            );
            message.setSubject("Get Your Password!");
            message.setText("Dear " + mail +","
                    + "\n\nyour reservation is canceled\nWe have cancelled ur servation!!");

            Transport.send(message);

            System.out.println("Done");
        } catch (MessagingException e) {
            JOptionPane.showMessageDialog(null, "MessagingException "+ e);
        }
    }
}
