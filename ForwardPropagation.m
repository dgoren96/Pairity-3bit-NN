function y=ForwardPropagation(input,w2,b2,w3,b3)
    y=Sigmoid(w3*(Sigmoid(w2*input'+b2))+b3);
end