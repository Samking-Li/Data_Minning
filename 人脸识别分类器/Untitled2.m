close all;
clear all;
clc;

% 载入训练集
load ORL_trainset;
[dim,trainnum]=size(train_data); % dim为样本维数，trainnum为训练集样本数
classnum=length(unique(train_label)); % 类别数
trainnum_eachclass=trainnum/classnum; % 每类目标训练样本数


%----------------------------- 训练(学习)分类器 ---------------------------%
train_data = train_data';
train_label = train_label';

x1=train_data(train_label==1,:);
x2=train_data(train_label==2,:);
x3=train_data(train_label==3,:);
x4=train_data(train_label==4,:);
x5=train_data(train_label==5,:);
x6=train_data(train_label==6,:);
x7=train_data(train_label==7,:);
x8=train_data(train_label==8,:);
x9=train_data(train_label==9,:);
x10=train_data(train_label==10,:);
x11=train_data(train_label==11,:);
x12=train_data(train_label==12,:);
x13=train_data(train_label==13,:);
x14=train_data(train_label==14,:);
x15=train_data(train_label==15,:);
x16=train_data(train_label==16,:);
x17=train_data(train_label==17,:);
x18=train_data(train_label==18,:);
x19=train_data(train_label==19,:);
x20=train_data(train_label==20,:);
x21=train_data(train_label==21,:);
x22=train_data(train_label==22,:);
x23=train_data(train_label==23,:);
x24=train_data(train_label==24,:);
x25=train_data(train_label==25,:);
x26=train_data(train_label==26,:);
x27=train_data(train_label==27,:);
x28=train_data(train_label==28,:);
x29=train_data(train_label==29,:);
x30=train_data(train_label==30,:);
x31=train_data(train_label==31,:);
x32=train_data(train_label==32,:);
x33=train_data(train_label==33,:);
x34=train_data(train_label==34,:);
x35=train_data(train_label==35,:);
x36=train_data(train_label==36,:);
x37=train_data(train_label==37,:);
x38=train_data(train_label==38,:);
x39=train_data(train_label==39,:);
x40=train_data(train_label==40,:);

u1=mean(x1);u2=mean(x2);u3=mean(x3);u4=mean(x4);u5=mean(x5);u6=mean(x6);u7=mean(x7);u8=mean(x8);u9=mean(x9);u10=mean(x10);   
u11=mean(x11);u12=mean(x12);u13=mean(x13);u14=mean(x14);u15=mean(x15);u16=mean(x16);u17=mean(x17);u18=mean(x18);u19=mean(x19);u20=mean(x20); 
u21=mean(x21);u22=mean(x22);u23=mean(x23);u24=mean(x24);u25=mean(x25);u26=mean(x26);u27=mean(x27);u28=mean(x28);u29=mean(x29);u30=mean(x30);
u31=mean(x31);u32=mean(x32);u33=mean(x33);u34=mean(x34);u35=mean(x35);u36=mean(x36);u37=mean(x37);u38=mean(x38);u39=mean(x39);u40=mean(x40); 

c1=cov(x1);c2=cov(x2);c3=cov(x3);c4=cov(x4);c5=cov(x5);c6=cov(x6);c7=cov(x7);c8=cov(x8);c9=cov(x9);c10=cov(x10);
c11=cov(x11);c12=cov(x12);c13=cov(x13);c14=cov(x14);c15=cov(x15);c16=cov(x16);c17=cov(x17);c18=cov(x18);c19=cov(x19);c20=cov(x20);
c21=cov(x21);c22=cov(x22);c23=cov(x23);c24=cov(x24);c25=cov(x25);c26=cov(x26);c27=cov(x27);c28=cov(x28);c29=cov(x29);c30=cov(x30);
c31=cov(x31);c32=cov(x32);c33=cov(x33);c34=cov(x34);c35=cov(x35);c36=cov(x36);c37=cov(x37);c38=cov(x38);c39=cov(x39);c40=cov(x40);

t1=diag(c1);t2=diag(c2);t3=diag(c3);t4=diag(c4);t5=diag(c5);t6=diag(c6);t7=diag(c7);t8=diag(c8);t9=diag(c9);t10=diag(c10);
t11=diag(c11);t12=diag(c12);t13=diag(c13);t14=diag(c14);t15=diag(c15);t16=diag(c16);t17=diag(c17);t18=diag(c18);t19=diag(c19);t20=diag(c20);
t21=diag(c21);t22=diag(c22);t23=diag(c23);t24=diag(c24);t25=diag(c25);t26=diag(c26);t27=diag(c27);t28=diag(c28);t29=diag(c29);t30=diag(c30);
t31=diag(c31);t32=diag(c32);t33=diag(c33);t34=diag(c34);t35=diag(c35);t36=diag(c36);t37=diag(c37);t38=diag(c38);t39=diag(c39);t40=diag(c40);

c1=diag(t1);c2=diag(t2);c3=diag(t3);c4=diag(t4);c5=diag(t5);c6=diag(t6);c7=diag(t7);c8=diag(t8);c9=diag(t9);c10=diag(t10);
c11=diag(t11);c12=diag(t12);c13=diag(t13);c14=diag(t14);c15=diag(t15);c16=diag(t16);c17=diag(t17);c18=diag(t18);c19=diag(t19);c20=diag(t20);
c21=diag(t21);c22=diag(t22);c23=diag(t23);c24=diag(t24);c25=diag(t25);c26=diag(t26);c27=diag(t27);c28=diag(t28);c29=diag(t29);c30=diag(t30);
c31=diag(t31);c32=diag(t32);c33=diag(t33);c34=diag(t34);c35=diag(t35);c36=diag(t36);c37=diag(t37);c38=diag(t38);c39=diag(t39);c40=diag(t40);

inv_c1=inv(c1);inv_c2=inv(c2);inv_c3=inv(c3);inv_c4=inv(c4);inv_c5=inv(c5);inv_c6=inv(c6); inv_c7=inv(c7);inv_c8=inv(c8); inv_c9=inv(c9);inv_c10=inv(c10);
inv_c11=inv(c11);inv_c12=inv(c12);inv_c13=inv(c13);inv_c14=inv(c14);inv_c15=inv(c15);inv_c16=inv(c16); inv_c17=inv(c17);inv_c18=inv(c18); inv_c19=inv(c19);inv_c20=inv(c20);
inv_c21=inv(c21);inv_c22=inv(c22);inv_c23=inv(c23);inv_c24=inv(c24);inv_c25=inv(c25);inv_c26=inv(c26); inv_c27=inv(c27);inv_c28=inv(c28); inv_c29=inv(c29);inv_c30=inv(c30);
inv_c31=inv(c31);inv_c32=inv(c32);inv_c33=inv(c33);inv_c34=inv(c34);inv_c35=inv(c35);inv_c36=inv(c36); inv_c37=inv(c37);inv_c38=inv(c38); inv_c39=inv(c39);inv_c40=inv(c40);

d1=det(c1);d2=det(c2);d3=det(c3);d4=det(c4);d5=det(c5);d6=det(c6);d7=det(c7);d8=det(c8);d9=det(c9);d10=det(c10);
d11=det(c11);d12=det(c12);d13=det(c13);d14=det(c14);d15=det(c15);d16=det(c16);d17=det(c17);d18=det(c18);d19=det(c19);d20=det(c20);
d21=det(c21);d22=det(c22);d23=det(c23);d24=det(c24);d25=det(c25);d26=det(c26);d27=det(c27);d28=det(c28);d29=det(c29);d30=det(c30);
d31=det(c31);d32=det(c32);d33=det(c33);d34=det(c34);d35=det(c35);d36=det(c36);d37=det(c37);d38=det(c38);d39=det(c39);d40=det(c40);
                                                                                                           %
%----------------------------- 训练(学习)分类器 ---------------------------%


% 载入测试集
load ORL_testset;
testnum=size(test_data,2); % 测试集样本数
testnum_eachclass=testnum/classnum; % 每类目标测试样本数

%---------------------------- 测试(将测试集代入训练好的分类器, 输出测试集样本标签)  -------------------------%
%---------------------- 注意: 输出的测试集样本标签是一个向量, 其长度等于测试集样本数 ----------------------%
test_data = test_data';
predict_lablel = [];
for k = 1:testnum
    p1=-0.5*(test_data(k,:)-u1)*inv_c1*(test_data(k,:)-u1)'-0.5*log(d1);
    p2=-0.5*(test_data(k,:)-u2)*inv_c2*(test_data(k,:)-u2)'-0.5*log(d2);
    p3=-0.5*(test_data(k,:)-u3)*inv_c3*(test_data(k,:)-u3)'-0.5*log(d3);
    p4=-0.5*(test_data(k,:)-u4)*inv_c4*(test_data(k,:)-u4)'-0.5*log(d4);
    p5=-0.5*(test_data(k,:)-u5)*inv_c5*(test_data(k,:)-u5)'-0.5*log(d5);
    p6=-0.5*(test_data(k,:)-u6)*inv_c6*(test_data(k,:)-u6)'-0.5*log(d6);
    p7=-0.5*(test_data(k,:)-u7)*inv_c7*(test_data(k,:)-u7)'-0.5*log(d7);
    p8=-0.5*(test_data(k,:)-u8)*inv_c8*(test_data(k,:)-u8)'-0.5*log(d8);
    p9=-0.5*(test_data(k,:)-u9)*inv_c9*(test_data(k,:)-u9)'-0.5*log(d9);
    p10=-0.5*(test_data(k,:)-u10)*inv_c10*(test_data(k,:)-u10)'-0.5*log(d10);
    p11=-0.5*(test_data(k,:)-u11)*inv_c11*(test_data(k,:)-u11)'-0.5*log(d11);
    p12=-0.5*(test_data(k,:)-u12)*inv_c12*(test_data(k,:)-u12)'-0.5*log(d12);
    p13=-0.5*(test_data(k,:)-u13)*inv_c13*(test_data(k,:)-u13)'-0.5*log(d13);
    p14=-0.5*(test_data(k,:)-u14)*inv_c14*(test_data(k,:)-u14)'-0.5*log(d14);
    p15=-0.5*(test_data(k,:)-u15)*inv_c15*(test_data(k,:)-u15)'-0.5*log(d15);
    p16=-0.5*(test_data(k,:)-u16)*inv_c16*(test_data(k,:)-u16)'-0.5*log(d16);
    p17=-0.5*(test_data(k,:)-u17)*inv_c17*(test_data(k,:)-u17)'-0.5*log(d17);
    p18=-0.5*(test_data(k,:)-u18)*inv_c18*(test_data(k,:)-u18)'-0.5*log(d18);
    p19=-0.5*(test_data(k,:)-u19)*inv_c19*(test_data(k,:)-u19)'-0.5*log(d19);
    p20=-0.5*(test_data(k,:)-u20)*inv_c20*(test_data(k,:)-u20)'-0.5*log(d20);
    p21=-0.5*(test_data(k,:)-u21)*inv_c21*(test_data(k,:)-u21)'-0.5*log(d21);
    p22=-0.5*(test_data(k,:)-u22)*inv_c22*(test_data(k,:)-u22)'-0.5*log(d22);
    p23=-0.5*(test_data(k,:)-u23)*inv_c23*(test_data(k,:)-u23)'-0.5*log(d23);
    p24=-0.5*(test_data(k,:)-u24)*inv_c24*(test_data(k,:)-u24)'-0.5*log(d24);
    p25=-0.5*(test_data(k,:)-u25)*inv_c25*(test_data(k,:)-u25)'-0.5*log(d25);
    p26=-0.5*(test_data(k,:)-u26)*inv_c26*(test_data(k,:)-u26)'-0.5*log(d26);
    p27=-0.5*(test_data(k,:)-u27)*inv_c27*(test_data(k,:)-u27)'-0.5*log(d27);
    p28=-0.5*(test_data(k,:)-u28)*inv_c28*(test_data(k,:)-u28)'-0.5*log(d28);
    p29=-0.5*(test_data(k,:)-u29)*inv_c29*(test_data(k,:)-u29)'-0.5*log(d29);
    p30=-0.5*(test_data(k,:)-u30)*inv_c30*(test_data(k,:)-u30)'-0.5*log(d30);
    p31=-0.5*(test_data(k,:)-u31)*inv_c31*(test_data(k,:)-u31)'-0.5*log(d31);
    p32=-0.5*(test_data(k,:)-u32)*inv_c32*(test_data(k,:)-u32)'-0.5*log(d32);
    p33=-0.5*(test_data(k,:)-u33)*inv_c33*(test_data(k,:)-u33)'-0.5*log(d33);
    p34=-0.5*(test_data(k,:)-u34)*inv_c34*(test_data(k,:)-u34)'-0.5*log(d34);
    p35=-0.5*(test_data(k,:)-u35)*inv_c35*(test_data(k,:)-u35)'-0.5*log(d35);
    p36=-0.5*(test_data(k,:)-u36)*inv_c36*(test_data(k,:)-u36)'-0.5*log(d36);
    p37=-0.5*(test_data(k,:)-u37)*inv_c37*(test_data(k,:)-u37)'-0.5*log(d37);
    p38=-0.5*(test_data(k,:)-u38)*inv_c38*(test_data(k,:)-u38)'-0.5*log(d38);
    p39=-0.5*(test_data(k,:)-u39)*inv_c39*(test_data(k,:)-u39)'-0.5*log(d39);
    p40=-0.5*(test_data(k,:)-u40)*inv_c40*(test_data(k,:)-u40)'-0.5*log(d40);
    [~,predict_label(k)]=max([p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,p21,p22,p23,p24,p25,p26,p27,p28,p29,p30,p31,p32,p33,p34,p35,p36,p37,p38,p39,p40]);
end
    
    


%---------------------------- 测试(将测试集代入训练好的分类器, 输出测试集样本标签)  -------------------------%


% 将分类器输出的测试集样本标签(假设该输出为predict_label)与真实标签对比，得到分类器在测试集上的分类精度
load ORL_testlabel; % label_truth为真实标签
accuracy=calculate_accuracy(predict_label,label_truth);
accuracy=100*accuracy; % 将分类精度以百分数的形式输出
fprintf('所设计分类器在测试集上的分类精度为%.2f%%\n',accuracy);
