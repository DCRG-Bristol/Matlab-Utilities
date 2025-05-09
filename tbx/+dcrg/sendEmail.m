function sendEmail(subject,body,to,attachments) 
arguments
    subject string
    body string
    to string = ""
    attachments string = string.empty
end
%Sends email using MS Outlook. The format of the function is  
%Similar to the SENDMAIL command. 

% Create connection. 
h = actxserver('outlook.Application'); 

% get delivery address
if isscalar(to) && to == ""
    % no address specified, use the address of the first account logged in
    acc = h.Session.Accounts.Item(1);        % get Account object
    to = string(acc.SmtpAddress);                   % read its SMTP address :contentReference[oaicite:0]{index=0}
end

% create mail object
mail = h.CreateItem('olMailItem'); 
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


% release connection
h.release;