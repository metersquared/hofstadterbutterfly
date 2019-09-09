siteLength=10000;
datasquare=zeros(siteLength);
fileName="fluxSquare.mat";
for m=1:siteLength
    for n=1:siteLength
        datasquare(m,n)=fluxdensitySquare(1,1,1,m*0.01,n*0.01;
    end
end
save(fileName);

function fluxDens=fluxdensitySquare(lpd,b,a,x,y)
    fluxDens=0;
    r= [x y];
    for h=-50:50
        for k=-50:50
            index=[h k];
            Qbase=2*pi/a*[1 1];
            Q=Qbase.*index;
            fluxDens=fluxDens+b*exp(1i*dot(Q,r))/(1+(lpd*norm(Q))^2);
        end
    end
end

