%% ������ӱ���е�����
% ���ڴ����µ��ӱ�������ݵĽű�:
%
%    ������: H:\MATLAB\dat\��ĩ�ۺ�ʵ��\data\Ա����ְ����_Ԥ����.xls
%    ������: Ա����ְ����
%
% �� MATLAB �� 2022-06-22 00:00:40 �Զ�����

%% ���õ���ѡ��
opts = spreadsheetImportOptions("NumVariables", 11);

% ָ��������ͷ�Χ
opts.Sheet = "Ա����ְ����";
opts.DataRange = "A2:K14989";

% ָ�������ƺ�����
opts.VariableNames = ["ID", "satisfaction_level", "time_spend_company", "average_montly_hours", "last_evaluation", "work_accident", "number_project", "promotion_last_5years", "sector", "salary", "left"];
opts.VariableTypes = ["string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string"];
opts = setvaropts(opts, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "WhitespaceRule", "preserve");
opts = setvaropts(opts, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "EmptyFieldRule", "auto");

% ��������
data = readtable("H:\MATLAB\dat\��ĩ�ۺ�ʵ��\data\Ա����ְ����_Ԥ����.xls", opts, "UseExcel", false);

%% ת��Ϊ�������
data = table2cell(data);
numIdx = cellfun(@(x) ~isnan(str2double(x)), data);
data(numIdx) = cellfun(@(x) {str2double(x)}, data(numIdx));

%% �����ʱ����
clear  opts