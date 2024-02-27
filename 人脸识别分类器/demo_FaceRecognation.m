close all;
clear all;
clc;

% 载入训练集
load ORL_trainset;
[dim,trainnum]=size(train_data); % dim为样本维数，trainnum为训练集样本数
classnum=length(unique(train_label)); % 类别数
trainnum_eachclass=trainnum/classnum; % 每类目标训练样本数


%----------------------------- 训练(学习)分类器 ---------------------------%
%                                                                                                            %
%                                                                                                            %
%                                                                                                            %
%                                                                                                            %
%                                                                                                            %
%                                                                                                            %
%                                                                                                            %
%----------------------------- 训练(学习)分类器 ---------------------------%


% 载入测试集
load ORL_testset;
testnum=size(test_data,2); % 测试集样本数
testnum_eachclass=testnum/classnum; % 每类目标测试样本数

%---------------------------- 测试(将测试集代入训练好的分类器, 输出测试集样本标签)  -------------------------%
%---------------------- 注意: 输出的测试集样本标签是一个向量, 其长度等于测试集样本数 ----------------------%
%                                                                                                                                                                     %
%                                                                                                                                                                     %
%                                                                                                                                                                     %
%                                                                                                                                                                     %
%                                                                                                                                                                     %
%                                                                                                                                                                     %
%                                                                                                                                                                     %
%---------------------------- 测试(将测试集代入训练好的分类器, 输出测试集样本标签)  -------------------------%


% 将分类器输出的测试集样本标签(假设该输出为predict_label)与真实标签对比，得到分类器在测试集上的分类精度
load ORL_testlabel; % label_truth为真实标签
accuracy=calculate_accuracy(predict_label,label_truth);
accuracy=100*accuracy; % 将分类精度以百分数的形式输出
fprintf('所设计分类器在测试集上的分类精度为%.2f%%\n',accuracy);

