for f in *.jl; 
    do echo "DAY $f"; 
    julia $f; 
done