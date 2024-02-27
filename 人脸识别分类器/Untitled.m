close all;
clear all;
clc;

% ����ѵ����
load ORL_trainset;
[dim,trainnum]=size(train_data); % dimΪ����ά����trainnumΪѵ����������
classnum=length(unique(train_label)); % �����
trainnum_eachclass=trainnum/classnum; % ÿ��Ŀ��ѵ��������


%----------------------------- ѵ��(ѧϰ)������ ---------------------------%
train_data = train_data';
train_label = train_label';
x={};u={};c={};t={};inv_c={};
n=1;
for i=1:40
    x{i}=train_data(train_label==i,:);
    n=n+1;
end

for i=1:40
    u{i}=mean(x{i});
    c{i}=cov(x{i});
    t{i}=diag(c{i});
    c{i}=diag(t{i});
    inv_c{i}=inv(c{i});
end
                                                                                                           %
%----------------------------- ѵ��(ѧϰ)������ ---------------------------%


% ������Լ�
load ORL_testset;
testnum=size(test_data,2); % ���Լ�������
testnum_eachclass=testnum/classnum; % ÿ��Ŀ�����������

%---------------------------- ����(�����Լ�����ѵ���õķ�����, ������Լ�������ǩ)  -------------------------%
%---------------------- ע��: ����Ĳ��Լ�������ǩ��һ������, �䳤�ȵ��ڲ��Լ������� ----------------------%
test_data = test_data';
predict_lablel = [];
for k = 1:testnum
    for i=1:40
        p{i}=-0.5*(test_data(k,:)-u{i})*inv_c{i}*(test_data(k,:)-u{i})';
    end
    [~,predict_label(k)]=max(cell2mat(p));
end
    
    


%---------------------------- ����(�����Լ�����ѵ���õķ�����, ������Լ�������ǩ)  -------------------------%


% ������������Ĳ��Լ�������ǩ(��������Ϊpredict_label)����ʵ��ǩ�Աȣ��õ��������ڲ��Լ��ϵķ��ྫ��
load ORL_testlabel; % label_truthΪ��ʵ��ǩ
accuracy=calculate_accuracy(predict_label,label_truth);
accuracy=100*accuracy; % �����ྫ���԰ٷ�������ʽ���
fprintf('����Ʒ������ڲ��Լ��ϵķ��ྫ��Ϊ%.2f%%\n',accuracy);
