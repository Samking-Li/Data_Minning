max_con=0.2;b={{},{},{},{},{},{},{},{},{}};

    for i =1:9
        for j=1:length(n1{i})
            if n1{1,i}(1,j)>max_con
                b{1,i}=cat(1,b{1,i},a{1,i}{1,j});
            end
        end
    end
