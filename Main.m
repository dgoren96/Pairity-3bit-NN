load('BestEpoch.mat')


input=[1 0 1];
%inputs: 000/001/010/011/
%        100/101/110/111

res=round(ForwardPropagation(input,BestEpoch.w2,BestEpoch.b2,BestEpoch.w3,BestEpoch.b3))