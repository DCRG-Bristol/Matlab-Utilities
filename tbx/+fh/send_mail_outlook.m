function send_mail_outlook(to,subject,body,attachments) 
arguments
    to string
    subject string
    body string
    attachments string = string.empty
end
%Sends email using MS Outlook. The format of the function is  
%Similar to the SENDMAIL command. 
 
% Create object and set parameters. 
h = actxserver('outlook.Application'); 
mail = h.CreateItem('olMail'); 
mail.Subject = subject; 
 
% multiple recipients 
if length(to) > 1 
      to = strjoin(to,';');  
end
mail.To = to; 
 
mail.BodyFormat = 'olFormatHTML'; 
mail.HTMLBody = body; 
 
% Add attachments, if specified. 
for i = 1:length(attachments) 
    mail.attachments.Add(attachments{i}); 
end 
 
% Send message and release object. 
mail.Send; 
h.release; 