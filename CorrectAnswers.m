function y = CorrectAnswers(x,numofinputs)
[~,col]=size(x);
for i=1:numofinputs
    y(i)=0;
    for j=1:col
        y(i)=xor(y(i),x(i,j));
    end
end