function [w2,b2,w3,b3]=DeepLearning(input,w2,b2,w3,b3,etha,correct_output)
%%%%%%%%%%%%%training part

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%feed Forward
z2=w2*input+b2;
a2=Sigmoid(z2);

z3=w3*a2+b3;
a3=Sigmoid(z3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Output Error

delta_sigma_3=a3.*(1-a3);
delta3 = (a3-correct_output).*delta_sigma_3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Backpropogate the error

delta_sigma_2=a2.*(1-a2);
delta2 = (w3'*delta3).*delta_sigma_2; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Gradient Descent

w3=w3-etha*delta3*a2';
b3=b3-etha*delta3;

w2=w2-etha*delta2*input';
b2=b2-etha*delta2;

end