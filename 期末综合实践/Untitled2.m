%% ������ӱ���е�����
% ���ڴ����µ��ӱ�������ݵĽű�:
%
%    ������: H:\MATLAB\dat\��ĩ�ۺ�ʵ��\data\Ա����ְ����_Ԥ����.xls
%    ������: Ա����ְ����
%
% �� MATLAB �� 2022-06-21 23:28:59 �Զ�����

%% ���õ���ѡ��
opts = spreadsheetImportOptions("NumVariables", 11);

% ָ��������ͷ�Χ
opts.Sheet = "Ա����ְ����";
opts.DataRange = "A2:K14989";

% ָ�������ƺ�����
opts.VariableNames = ["ID", "satisfaction_level", "time_spend_company", "average_montly_hours", "last_evaluation", "work_accident", "number_project", "promotion_last_5years", "sector", "salary", "left"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "categorical", "categorical", "double"];
opts = setvaropts(opts, [9, 10], "EmptyFieldRule", "auto");

% ��������
Untitled = readtable("H:\MATLAB\dat\��ĩ�ۺ�ʵ��\data\Ա����ְ����_Ԥ����.xls", opts, "UseExcel", false);


%% �����ʱ����
clear opts