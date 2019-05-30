path='resimler\';
type='.jpg';
content = dir([path,'*',type]);
imgnum=size(content,1); % Dosyanýn içindeki resim sayýsý
A=zeros(3600,imgnum);
for k=1:imgnum
    string=[path,content(k,1).name];
    Image=imread(string);
    Image=im2bw(Image);
    Image=imresize(Image,[60 60]);
    Image=double(Image);
    Image=reshape(Image,3600,1);
    A(:,k)=Image;
end
target=eye(k);
input=[A];
[R,Q]=size(input);
[S2,O]=size(target);
S1=55;
%Scaled conjugate gradient backpropagation:
%Trainscg, ölçekli eþlenik gradyan yöntemine göre aðýrlýk ve 
%bias deðerlerini güncelleyen bir að eðitim iþlevi.
net=newff(minmax(input),[S1 S2],{'logsig' 'logsig'},'trainscg');
net.trainParam.perf='sse';
net.trainParam.epochs=1000;
net.trainParam.goal=1e-5;
net=train(net,input,target);

%trainlm:Levenberg-Marquardt backpropagation
%Trainlm, Levenberg-Marquardt optimizasyonuna göre aðýrlýk ve 
%bias deðerlerini güncelleyen bir að eðitim iþlevi.

%trainbr:Bayesian regularization(Düzenlilik) backpropagation
%Trainbr,Bayesian regularization.

%trainrp:Resilient(Esnek) backpropagation
%Trainrp, esnek geri yayýlým algoritmasýna göre aðýrlýk ve 
%bias deðerlerini güncelleyen bir að eðitim iþlevi
