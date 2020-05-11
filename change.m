function mat = change(mat,row,col,m)

%this function forward elliminates one colomn of the matrix using one pivot

if (mat(row,col)~=0) %if non zero so it's a pivot
    pivot=mat(row,col); 
    for i=row+1:m  %start loping from the next row to the pivot until end
        if(abs(mat(i,col))>=0.0001)
            factor=mat(i,col)/pivot;
            mat(i,:)= mat(i,:) + mat(row,:)*(-1)*factor; %ellimination
           %disply what happenned
            display(['row', num2str(i) , ' = row' , num2str(i) ,' + row' ,num2str(row),' * ',num2str((-1)*factor)]) 
            display('new matrix is')
            display(mat)
        end
    end
end
end

