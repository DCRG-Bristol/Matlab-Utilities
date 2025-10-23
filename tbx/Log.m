classdef Log < handle
    properties (Constant)
        instance = Log()
        Symbols = [[".","~","#","#","#","#"]; [" ","-","=","#","#","#"]; [" ",":","-","#","#","#"]];
    end
    properties
        level LogLevel = LogLevel.Trace
        subLevel double = LogSubLevel.Low
    end
    methods(Static)
        function [val,subVal] = getLevel()
            val = Log.instance.level;
            subVal = Log.instance.subLevel;
        end
        function setLevel(level,subLevel)
            arguments
                level (1,1) LogLevel
                subLevel (1,1) LogSubLevel = LogSubLevel.Low
            end
            obj = Log.instance;
            obj.level = level;
            obj.subLevel = subLevel;
        end
        function message(level,message,subLevel,Symbol)
            arguments
                level LogLevel
                message string
                subLevel LogSubLevel = LogSubLevel.Mid
                Symbol string = string.empty
            end
            obj = Log.instance;
            if isempty(Symbol)
                Symbol = Log.Symbols(3-double(subLevel), double(level)/10 + 1);
            end
            if obj.level + obj.subLevel <= level + subLevel
                dcrg.printing.title(message,Symbol=Symbol);
            end
        end
        function trace(message,subLevel,symbol)
            arguments
                message
                subLevel = LogSubLevel.Mid
                symbol = string.empty
            end
            Log.message(LogLevel.Trace,message,subLevel,symbol);
        end
        function debug(message,subLevel,symbol)
            arguments
                message
                subLevel = LogSubLevel.Mid
                symbol = string.empty
            end
            Log.message(LogLevel.Debug,message,subLevel,symbol);
        end
        function info(message,subLevel,symbol)
            arguments
                message
                subLevel = LogSubLevel.Mid
                symbol = string.empty
            end
            Log.message(LogLevel.Info,message,subLevel,symbol);
        end
        function warn(message,subLevel,symbol)
            arguments
                message
                subLevel = LogSubLevel.Mid
                symbol = string.empty
            end
            Log.message(LogLevel.Warn,message,subLevel,symbol);
        end
        function error(message,subLevel,symbol)
            arguments
                message
                subLevel = LogSubLevel.Mid
                symbol = string.empty
            end
            Log.message(LogLevel.Error,message,subLevel,symbol);
        end
        function fatal(message,subLevel,symbol)
            arguments
                message
                subLevel = LogSubLevel.Mid
                symbol = string.empty
            end
            Log.message(LogLevel.Fatal,message,subLevel,symbol);
        end
    end
end