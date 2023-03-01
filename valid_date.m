function valid = valid_date(year, month, day)
if nargin == 3
    if fix(valid_date) && isscalar(valid_date) %integer and is scalar
        if (rem(year,4)==0 || rem(year,400)==0 && rem(year,100)~=0)
            if (month ==1||3||5||7||8||10||12) && (0<day<32)
            valid = true;
            elseif (month==2 && 0<day<30)
            valid = true;
            elseif ((month==4||6||9||11) && 0<day<31)
            valid = true;
            else
            valid = false;
            end
        else
            if (month ==1||3||5||7||8||10||12) && (0<day<32)
            valid = true;
            elseif (month==2 && 0<day<29)
            valid = true;
            elseif ((month==4||6||9||11) && 0<day<31)
            valid = true;
            else
            valid = false;
            end
        end
        else
            valid = false;
    end
else
    error('input three arguments')
end