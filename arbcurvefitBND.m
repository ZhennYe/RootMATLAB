function pout = arbcurvefitBND(x,y,pstart,plow,phigh,expression)
%  arbcurvefit  Finds best BOUNDED fit parameters for an abitrary 1D curve using
%  provided sample data and fminsearch
%
%  Synopsis:
%     pout = curvefit(x,y,pstart,expression)
%
%  Input:
%     x = Independant variable data. (required)
%     y = Dependant variable data. (required)
%     pstart = array of initial starting parameter values. (required)
%     plow = lower parameter bounds (required)
%     phigh = upper parameter bounds (required)
%     expression = A string that contains the equation defining the
%     curve. Should be in the following form: 'f = some function of x
%     and p;' (required)
%
%
%  Output:
%     pout = the determined best fit parameter values.
%
%  Example:
%  x = 0:.1:1;
%  y = 3*x + rand(1,length(x)) - .5;
%  pstart = [3,1];
%  expression = 'f = p(1)*x + p(2);';
%  pout = arbcurvefit(x,y,pstart,[-inf, -inf],[inf, inf]expression);


p = fminsearch(@(p) funcerror(x,y,p,plow,phigh,expression),pstart);
ynew = expressfunc(x,p,expression);
%figure(133)
%hold on
%plot(x,y,'ok',x,ynew,'--k')
pout = p;

    function yout = expressfunc(x,p,expression)
        f = 0;
        if isequal(expression(end),';')
            eval(expression);
        else
            eval(strcat(expression,';'));
        end
        yout = f;
    end
    function err = funcerror(x,y,p,plow,phigh,expression)
        ob = false; %check if parameter is out of bounds
        for i=1:length(p)
            ob = ob||(p(i)<plow(i))||(p(i)>phigh(i));
        end
        if ob
            err = realmax;
        else
            ycurve = expressfunc(x,p,expression);
            err = sum((ycurve-y).^2);
        end
    end

end