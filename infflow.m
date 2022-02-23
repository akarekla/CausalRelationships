% Generate two time series based on dx = Ax + B * dw


opts = delimitedTextImportOptions("NumVariables", 11);

% Specify range and delimiter
opts.DataLines = [3, 441];
opts.Delimiter = ";";

% Specify column names and types
opts.VariableNames = ["Date", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11"];
opts.SelectedVariableNames = "Date";
opts.VariableTypes = ["datetime", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11"], "EmptyFieldRule", "auto");
opts = setvaropts(opts, "Date", "InputFormat", "yyyy-MM-dd");

a= readtable("C:\Users\anast\Desktop\ΔΙΠΛΩΜΑΤΙΚΗ\SoDa_MERRA2.csv", opts);
x=SoDaMERRA2.Date;
y=SoDaMERRA2.RelativeHumidity;
z=SoDaMERRA2.Rainfall;
b=readtable("C:\Users\anast\Desktop\ΔΙΠΛΩΜΑΤΙΚΗ\nao.data", opts)
figure()
plot(z)
%%

    dt = 1;
    
    T21 = causal_est(y,b, 1);
    T21=T21/dt;
    T12 = causal_est(b, y, 1);
    T12=T12/dt;


    figure(1)
    histogram(T21)
    xlabel('T21')
    title('Histogram of T21 for 100 time series')
    figure (2)
    histogram(T12)
    xlabel('T12')
    title('Histogram of T12 for 100 time series')

