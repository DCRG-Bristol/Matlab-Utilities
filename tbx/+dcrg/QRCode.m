function QRCode(data, opt)
    arguments
        data (1,:) char
        opt.Name string = "qrcode"
        opt.Type string{mustBeMember(opt.Type, ["png", "svg"])} = "png"
    end
    % generateQRCodeAPI - Generate QR code using online API (no Java required)
    %
    % Syntax:
    %   generateQRCodeAPI(data)
    %   generateQRCodeAPI(data, Name="my_qr", Type="svg")
    %
    % Parameters:
    %   - data (char): The data to be encoded in the QR code
    %   - opt.Name (string): Output filename without extension (default: "qrcode")
    %   - opt.Type (string): File format "png" or "svg" (default: "png")
    %
    % Examples:
    %   generateQRCodeAPI('https://i2sc.fintanhealy.co.uk')
    %   generateQRCodeAPI('Hello World', Name="my_qr", Type="svg")
    %   generateQRCodeAPI('mailto:test@email.com', Name="contact", Type="png")

    % Build filename from Name and Type
    filename = sprintf('%s.%s', opt.Name, opt.Type);
    
    try
        % URL encode the data
        encoded_data = urlencode(data);
        
        % Build API URL based on file type
        if opt.Type == "svg"
            api_url = sprintf('https://api.qrserver.com/v1/create-qr-code/?size=300x300&format=svg&data=%s', encoded_data);
        else
            api_url = sprintf('https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=%s', encoded_data);
        end
        
        % Download the QR code
        fprintf('Generating QR code for: %s\n', data);
        fprintf('Downloading %s file...\n', upper(opt.Type));
        
        websave(filename, api_url);
        
        fprintf('QR code generated successfully!\n');
        fprintf('Saved as: %s\n', filename);
        
    catch ME
        error('Error generating QR code: %s', ME.message);
    end
end