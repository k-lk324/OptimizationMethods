x1=a+(1-tau)*(b-a);             % computing x values
x2=a+tau*(b-a);
f_x1=f(x1);                     % computing values in x points
f_x2=f(x2);
plot(x1,f_x1,'rx')              % plotting x
plot(x2,f_x2,'rx')
while ((abs(b-a)>epsilon) && (k<iter))
    k=k+1;
    if(f_x1<f_x2)
        b=x2;
        x2=x1;
        x1=a+(1-tau)*(b-a);
        
        f_x1=f(x1);
        f_x2=f(x2);
        
        plot(x1,f_x1,'rx');
    else
        a=x1;
        x1=x2;
        x2=a+tau*(b-a);
        
        f_x1=f(x1);
        f_x2=f(x2);
        
        plot(x2,f_x2,'rx')
    end
    
    k=k+1;
end