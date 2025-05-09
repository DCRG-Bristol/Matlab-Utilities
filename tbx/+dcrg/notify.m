function notify(Status,message)
arguments
    Status string {mustBeMember(Status,{'Complete','Error','Info'})}
    message string = "";
    
end
switch Status
    case 'Complete'
        send_mail_outlook('fintan.healy@bristol.ac.uk','MATLAB: JOB Complete',message);
    case 'Error'
        send_mail_outlook('fintan.healy@bristol.ac.uk','MATLAB: JOB Error',message);
    case 'Info'
        send_mail_outlook('fintan.healy@bristol.ac.uk','MATLAB: JOB Information',message);
end
end

