function Aufgabe2 = importfile2(workbookFile, sheetName, dataLines)
%IMPORTFILE2 Import data from a spreadsheet
%  AUFGABE2 = IMPORTFILE2(FILE) reads data from the first worksheet in
%  the Microsoft Excel spreadsheet file named FILE.  Returns the data as
%  a table.
%
%  AUFGABE2 = IMPORTFILE2(FILE, SHEET) reads from the specified
%  worksheet.
%
%  AUFGABE2 = IMPORTFILE2(FILE, SHEET, DATALINES) reads from the
%  specified worksheet for the specified row interval(s). Specify
%  DATALINES as a positive scalar integer or a N-by-2 array of positive
%  scalar integers for dis-contiguous row intervals.
%
%  Example:
%  Aufgabe2 = importfile2("C:\Users\Marvin\Documents\TRNSYS2020\DATA\Aufgabe2.3.xlsx", "Tabelle1", [2, 25]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 12-Oct-2020 20:45:34

%% Input handling

% If no sheet is specified, read first sheet
if nargin == 1 || isempty(sheetName)
    sheetName = 1;
end

% If row start and end points are not specified, define defaults
if nargin <= 2
    dataLines = [2, 25];
end

%% Setup the Import Options
opts = spreadsheetImportOptions("NumVariables", 8);

% Specify sheet and range
opts.Sheet = sheetName;
opts.DataRange = "A" + dataLines(1, 1) + ":H" + dataLines(1, 2);

% Specify column names and types
opts.VariableNames = ["VarName1", "F_SOL_IN", "F_SOL_OUT", "Q_BEDARF", "Q_BEDARF_INKLSP", "R", "d", "lambda"];
opts.SelectedVariableNames = ["VarName1", "F_SOL_IN", "F_SOL_OUT", "Q_BEDARF", "Q_BEDARF_INKLSP", "R", "d", "lambda"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double"];

% Import the data
Aufgabe2 = readtable(workbookFile, opts, "UseExcel", false);

for idx = 2:size(dataLines, 1)
    opts.DataRange = "A" + dataLines(idx, 1) + ":H" + dataLines(idx, 2);
    tb = readtable(workbookFile, opts, "UseExcel", false);
    Aufgabe2 = [Aufgabe2; tb]; %#ok<AGROW>
end

end