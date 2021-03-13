function human(x) {
        if (x<1024) {return x} else {x/=1024}
        s="kMGTEPZY";
        while (x>=1024 && length(s)>1)
            {x/=1024; s=substr(s,2)}
        return int(x+0.5) substr(s,1,1)
    }
    {sub(/^[0-9]+/, human($1 * 1024)); print}