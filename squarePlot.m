partNum=1000;
datasquare=zeros(partNum);
for m=1:partNum
    for n=1:partNum
        datasquare(m,n)=fluxdensitySquare(1,1,1,m*0.01,n*0.01);
    end
end