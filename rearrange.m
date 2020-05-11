function mat = rearrange(mat,row,col,m)

%this function checks if the first element of the row is 0, if so it
%shifts underneath rows on top of it and then checks for the first
%element of the new row and so on until it foun a non zero element so
%it breaks the loop

for i=row:(m-1)  % I start rearranging from the row of the candidate pivot and under it
    if(abs(mat(row,col))<0.0001)
        temp=mat(row,:);
        mat=[mat(1:row-1,:);mat(row+1:m,:); temp] ; %shifting to up
        %disply what happenned
        display(['row', num2str(i) , ' is sent at the end and below rows are shidted up']) 
        display('new matrix is')
        display(mat)
        
    else
        break;
    end
end
end


