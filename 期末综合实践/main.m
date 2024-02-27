close all;
clear all;
clc;
%% 调用导入数据的函数，将数据导入为“data”
%该脚本由matlab自动生成
importxls
%% 设置后面所需的变量
%data有X行，Y列
X=size(data,1);Y=size(data,2);
%% 对数据中的连续值进行离散化

%对satisfaction等距划分为五个等级
for i = 1:X
    if and(data{i,2}>0, data{i,2}<=0.2)
        data{i,2}=1;
    
    elseif and(data{i,2}>0.2, data{i,2}<=0.4)
        data{i,2}=2;
    
    elseif and(data{i,2}>0.4, data{i,2}<=0.6)
        data{i,2}=3;
    
    elseif and(data{i,2}>0.6, data{i,2}<=0.8)
        data{i,2}=4;
    
    elseif and(data{i,2}>0.8, data{i,2}<=1)
        data{i,2}=5;
    end
end

%对average_montly_hours划分为五个等级
for i = 1:X
    if and(data{i,4}>0, data{i,4}<=100)
        data{i,4}=1;
    
    elseif and(data{i,4}>100, data{i,4}<=150)
        data{i,4}=2;
    
    elseif and(data{i,4}>150, data{i,4}<=200)
        data{i,4}=3;
     
    elseif and(data{i,4}>200, data{i,4}<=250)
        data{i,4}=4;

    elseif data{i,4}>250
        data{i,4}=5;
        
    end
end

%对last_evaluation等距划分为五个等级
for i = 1:X
    if and(data{i,5}>0, data{i,5}<=0.2)
        data{i,5}=1;
    
    elseif and(data{i,5}>0.2, data{i,5}<=0.4)
        data{i,5}=2;
    
    elseif and(data{i,5}>0.4, data{i,5}<=0.6)
        data{i,5}=3;
    
    elseif and(data{i,5}>0.6, data{i,5}<=0.8)
        data{i,5}=4;
    
    elseif and(data{i,5}>0.8, data{i,5}<=1)
        data{i,5}=5;
    end
end

%% 对离散化后的数据进行划分测试集与训练集

%先区分是否离职两类数据

data0=[];data1=[];

for i = 1:X
    if data{i,11}==1
        data1=cat(1,data1, data(i,:));
    elseif data{i,11}==0
        data0=cat(1,data0, data(i,:));
    end
end

%随机选取测试集、训练集
%类别为0
data0 = data0(randperm(size(data0,1)),:); %随机划分
ind = round(0.6 * size(data0,1)); %按比例分
tdata0 = data0(1:ind, 1:end); %训练集
edata0 = data0(ind+1:end, 1:end); %测试集
%类别为1
data1 = data1(randperm(size(data1,1)),:); %随机划分
ind = round(0.6 * size(data1,1)); %按比例分
tdata1 = data1(1:ind, 1:end); %训练集
edata1 = data1(ind+1:end, 1:end); %测试集
%连接两类
tdata=cat(1,tdata0,tdata1);
edata=cat(1,edata0,edata1);

%% 贝叶斯分类器
tX0=size(tdata0,1);tX1=size(tdata1,1);
eX0=size(edata0,1);eX1=size(edata1,1);

n_satisfaction_level=[];n_time_spend_company=[];n_average_montly_hours=[];
n_last_evaluation=[];n_work_accident=[];n_number_project=[];
n_promotion_last_5years=[];n_sector=[];n_salary=[];

n1_satisfaction_level=[];n1_time_spend_company=[];n1_average_montly_hours=[];
n1_last_evaluation=[];n1_work_accident=[];n1_number_project=[];
n1_promotion_last_5years=[];n1_sector=[];n1_salary=[];

%计算各后验概率
satisfaction_level = {1,2,3,4,5};
for i =1:5
    n_satisfaction_level(1,i)=length(find([tdata0{:,2}]==satisfaction_level{i}))/tX0;
    n1_satisfaction_level(1,i)=length(find([tdata1{:,2}]==satisfaction_level{i}))/tX1;
end

time_spend_company={2,3,4,5,6,7,8,9,10};
for i =1:9
    n_time_spend_company(1,i)=length(find([tdata0{:,3}]==time_spend_company{i}))/tX0;
    n1_time_spend_company(1,i)=length(find([tdata1{:,3}]==time_spend_company{i}))/tX1;
end

average_montly_hours={1,2,3,4,5};
for i =1:5
    n_average_montly_hours(1,i)=length(find([tdata0{:,4}]==average_montly_hours{i}))/tX0;
    n1_average_montly_hours(1,i)=length(find([tdata1{:,4}]==average_montly_hours{i}))/tX1;
end

last_evaluation={1,2,3,4,5};
for i =1:5
    n_last_evaluation(1,i)=length(find([tdata0{:,5}]==last_evaluation{i}))/tX0;
    n1_last_evaluation(1,i)=length(find([tdata1{:,5}]==last_evaluation{i}))/tX1;
end

work_accident={0,1};
for i =1:2
    n_work_accident(1,i)=length(find([tdata0{:,6}]==work_accident{i}))/tX0;
    n1_work_accident(1,i)=length(find([tdata1{:,6}]==work_accident{i}))/tX1;
end

number_project={2,3,4,5,6,7};
for i =1:6
    n_number_project(1,i)=length(find([tdata0{:,7}]==number_project{i}))/tX0;
    n1_number_project(1,i)=length(find([tdata1{:,7}]==number_project{i}))/tX1;
end

promotion_last_5years={0,1};
for i =1:2
    n_promotion_last_5years(1,i)=length(find([tdata0{:,8}]==promotion_last_5years{i}))/tX0;
    n1_promotion_last_5years(1,i)=length(find([tdata1{:,8}]==promotion_last_5years{i}))/tX1;
end

sector={"accounting","hr","IT","management","marketing","product_mng","RandD","sales","support","technical"};
for i =1:10
    n_sector(1,i)=length(find([tdata0{:,9}]==sector{i}))/tX0;
    n1_sector(1,i)=length(find([tdata1{:,9}]==sector{i}))/tX1;
end

salary={"low","medium","high"};
for i =1:3
    n_salary(1,i)=length(find([tdata0{:,10}]==salary{i}))/tX0;
    n1_salary(1,i)=length(find([tdata1{:,10}]==salary{i}))/tX1;
end
a={satisfaction_level,time_spend_company,average_montly_hours,last_evaluation,work_accident,number_project,promotion_last_5years,sector,salary};
n={n_satisfaction_level,n_time_spend_company,n_average_montly_hours,n_last_evaluation,n_work_accident,n_number_project,n_promotion_last_5years,n_sector,n_salary};
n1={n1_satisfaction_level,n1_time_spend_company,n1_average_montly_hours,n1_last_evaluation,n1_work_accident,n1_number_project,n1_promotion_last_5years,n1_sector,n1_salary};
%% 使用测试集验证正确率
%
sum=0;
p0=1;
p1=1;
leave=0;stay=0;
for k =i:length(edata(:,1))
    for i =1:9
        for j=1:length(n{i})
            if edata{k,i+1}==a{1,i}{1,j}
                p0=p0*n{1,i}(1,j);
            end
        end
    end

    for i =1:9
        for j=1:length(n1{i})
            if edata{k,i+1}==a{1,i}{1,j}
                p1=p1*n1{1,i}(1,j);
            end
        end
    end
    if p0<p1
        result=1;
        stay=stay+1;
    else
        result=0;
        leave=leave+1;
    end
    if result ==edata{k,11}
        sum=sum+1;
    end
end

right_rate=sum/size(edata,1)
