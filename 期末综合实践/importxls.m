%% 导入电子表格中的数据
% 用于从以下电子表格导入数据的脚本:
%
%    工作簿: H:\MATLAB\dat\期末综合实践\data\员工离职数据_预处理.xls
%    工作表: 员工离职数据
%
% 由 MATLAB 于 2022-06-22 00:00:40 自动生成

%% 设置导入选项
opts = spreadsheetImportOptions("NumVariables", 11);

% 指定工作表和范围
opts.Sheet = "员工离职数据";
opts.DataRange = "A2:K14989";

% 指定列名称和类型
opts.VariableNames = ["ID", "satisfaction_level", "time_spend_company", "average_montly_hours", "last_evaluation", "work_accident", "number_project", "promotion_last_5years", "sector", "salary", "left"];
opts.VariableTypes = ["string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string"];
opts = setvaropts(opts, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "WhitespaceRule", "preserve");
opts = setvaropts(opts, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "EmptyFieldRule", "auto");

% 导入数据
data = readtable("H:\MATLAB\dat\期末综合实践\data\员工离职数据_预处理.xls", opts, "UseExcel", false);

%% 转换为输出类型
data = table2cell(data);
numIdx = cellfun(@(x) ~isnan(str2double(x)), data);
data(numIdx) = cellfun(@(x) {str2double(x)}, data(numIdx));

%% 清除临时变量
clear  opts