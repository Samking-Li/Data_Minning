%% 导入电子表格中的数据
% 用于从以下电子表格导入数据的脚本:
%
%    工作簿: H:\MATLAB\dat\期末综合实践\data\员工离职数据_预处理.xls
%    工作表: 员工离职数据
%
% 由 MATLAB 于 2022-06-21 23:28:59 自动生成

%% 设置导入选项
opts = spreadsheetImportOptions("NumVariables", 11);

% 指定工作表和范围
opts.Sheet = "员工离职数据";
opts.DataRange = "A2:K14989";

% 指定列名称和类型
opts.VariableNames = ["ID", "satisfaction_level", "time_spend_company", "average_montly_hours", "last_evaluation", "work_accident", "number_project", "promotion_last_5years", "sector", "salary", "left"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "categorical", "categorical", "double"];
opts = setvaropts(opts, [9, 10], "EmptyFieldRule", "auto");

% 导入数据
Untitled = readtable("H:\MATLAB\dat\期末综合实践\data\员工离职数据_预处理.xls", opts, "UseExcel", false);


%% 清除临时变量
clear opts