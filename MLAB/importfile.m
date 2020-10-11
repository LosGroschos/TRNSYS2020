function Aufgabe2 = importfile(workbookFile, sheetName, dataLines)
%IMPORTFILE Import data from a spreadsheet
%  AUFGABE2 = IMPORTFILE(FILE) reads data from the first worksheet in
%  the Microsoft Excel spreadsheet file named FILE.  Returns the data as
%  a table.
%
%  AUFGABE2 = IMPORTFILE(FILE, SHEET) reads from the specified worksheet.
%
%  AUFGABE2 = IMPORTFILE(FILE, SHEET, DATALINES) reads from the
%  specified worksheet for the specified row interval(s). Specify
%  DATALINES as a positive scalar integer or a N-by-2 array of positive
%  scalar integers for dis-contiguous row intervals.
%
%  Example:
%  Aufgabe2 = importfile("C:\Users\Marvin\Documents\TRNSYS2020\DATA\Aufgabe2.2.xlsx", "Tabelle1", [2, 37]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 09-Oct-2020 15:02:53

%% Input handling

% If no sheet is specified, read first sheet
if nargin == 1 || isempty(sheetName)
    sheetName = 1;
end

% If row start and end points are not specified, define defaults
if nargin <= 2
    dataLines = [2, 37];
end

%% Setup the Import Options
opts = spreadsheetImportOptions("NumVariables", 6);

% Specify sheet and range
opts.Sheet = sheetName;
opts.DataRange = "B" + dataLines(1, 1) + ":G" + dataLines(1, 2);

% Specify column names and types
opts.VariableNames = ["FSOL_IN", "F_SOL_OUT", "Q_BEDARF", "Q_BEDARF_INKLSP", "TSP", "TAMB"];
opts.SelectedVariableNames = ["FSOL_IN", "F_SOL_OUT", "Q_BEDARF", "Q_BEDARF_INKLSP", "TSP", "TAMB"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double"];

% Import the data
Aufgabe2 = readtable(workbookFile, opts, "UseExcel", false);

for idx = 2:size(dataLines, 1)
    opts.DataRange = "B" + dataLines(idx, 1) + ":G" + dataLines(idx, 2);
    tb = readtable(workbookFile, opts, "UseExcel", false);
    Aufgabe2 = [Aufgabe2; tb]; %#ok<AGROW>
end

end