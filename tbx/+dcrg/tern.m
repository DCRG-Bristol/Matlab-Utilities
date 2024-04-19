function out = tern(statement,if_true,if_false)
    %TERN ternary operator
    if statement
        out = if_true;
    else
        out = if_false;
    end
end

