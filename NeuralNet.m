%Initial weights and bias
iW=2;
iB=2;

%Parameters
input=1;
target=0;
Numepoch=500;
learningRate=0.15;

%Initialization of variables
w=iW;
b=iB;
epoch=linspace(0,500,500);
weight=zeros(1,Numepoch);
bias=zeros(1,Numepoch);
cost=zeros(1,Numepoch);

%Training process using gradient descent
for i=1:Numepoch
    weight(i)=w;
    bias(i)=b;
    z=output(input,w,b);
    s=sigmoid(z);
    Ds=Dsigmoid(z);
    cost(i)=cost_mse(target,s);
    Cw=gradient_mse(s, target,Ds, input);
    Cb=Cw/input;
    w=w-learningRate*Cw;
    b=b-learningRate*Cb;
end

%Plot process
plot(epoch,cost);

function gradientcost=gradient_mse(a, target,derivative, input)
    gradientcost=(a-target)*derivative*input;
end

function cost=cost_mse(target,output)
    cost=(target-output)^2/2;
end

function sprime=Dsigmoid(z)
    sprime=sigmoid(z)*(1-sigmoid(z));
end

function s=sigmoid(z)
    s=1/(1+exp(-z));
end

function z=output(activation, weight, bias)
    z=activation*weight+bias;
end