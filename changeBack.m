function mat = changeBack(mat,row,col)

%this function backword elliminates one colomn of the matrix using one pivot

pivot=mat(row,col);
for i=row-1:-1:1 %start looping fromthe upper row of the pivot until the first row
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

