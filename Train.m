clear all; close all; clc;
tic;
NUM_OF_INPUTS=8;
NUM_OF_EPOCHS=100;
NUM_OF_NEURONS_INPUT_LAYER=3;
NUM_OF_NEURONS_HIDDEN_LAYER=6;
NUM_OF_NEURONS_OUTPUT_LAYER=1;

etha=2; %the learning rate

input=Get_inputs();
correct_output=CorrectAnswers(input,NUM_OF_INPUTS);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%training phase
for epoch_num=1:NUM_OF_EPOCHS
%initial epoch

w2=randn(NUM_OF_NEURONS_HIDDEN_LAYER,NUM_OF_NEURONS_INPUT_LAYER);
b2=randn(NUM_OF_NEURONS_HIDDEN_LAYER,1);
w3=randn(NUM_OF_NEURONS_OUTPUT_LAYER,NUM_OF_NEURONS_HIDDEN_LAYER);
b3=randn(NUM_OF_NEURONS_OUTPUT_LAYER,1);

    for iter=1:2000*NUM_OF_INPUTS
        rand_input_inx=ceil(NUM_OF_INPUTS*rand(1));
        [w2,b2,w3,b3]=DeepLearning(input(rand_input_inx,:)',w2,b2,w3,b3,etha,correct_output(rand_input_inx));

    end
Epochs(epoch_num).w2=w2;
Epochs(epoch_num).b2=b2;
Epochs(epoch_num).w3=w3;
Epochs(epoch_num).b3=b3;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%test phase

for epoch_num=1:NUM_OF_EPOCHS
   error=0;
    for i=1:NUM_OF_INPUTS
        error=error+(correct_output(i)-ForwardPropagation(input(i,:),Epochs(epoch_num).w2,Epochs(epoch_num).b2...
            ,Epochs(epoch_num).w3,Epochs(epoch_num).b3))^2;        
    end
    error=error/NUM_OF_INPUTS;
    Epochs(epoch_num).error=error;    
end

toc;
disp('Done !');


for s=1:NUM_OF_EPOCHS
    a(s)=Epochs(s).error;
end
[M,I]=min(a);
BestEpoch=Epochs(I);
%stem(a);
c=mean(100*a.^0.5);

save('BestEpoch.mat','BestEpoch');


