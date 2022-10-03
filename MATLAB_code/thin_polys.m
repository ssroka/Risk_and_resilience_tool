function [s_out] = thin_polys(s_in)

s_out = s_in;


for i = 1:size(s_out,1)
    x = s_out(i).X;
    y = s_out(i).Y;

    ids = isnan(x)|isnan(y)|isinf(x)|isinf(y);

    x(ids) = [];
    y(ids) = [];

    k = boundary(x',y',0.9);
    s_out(i).X = x(k);
    s_out(i).Y = y(k);
end





end