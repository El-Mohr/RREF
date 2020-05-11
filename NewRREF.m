function mat=NewRREF(mat)

%this function takes any matrix of any size and returns its reduced row
%echlon form


display ('original matrix is')
display (mat)

[m,n]=size(mat);

pivots=zeros(m,2);
h=0;

%to get echolon form first

%first candidate pivot
row=1;
col=1;

for k=1:n %looping by the number of coloumns as the maximum number for the loop unless break happens
    mat=rearrange(mat,row,col,m); % call the rearrange function passing current candidate pivot
    if(abs(mat(row,col))>=0.0001) %if it's a real pivot
        h=h+1;
        pivots(h,:)=[row,col];
        %disply what happenned
        display(['element (', num2str(row) , ' , ' , num2str(col) ,' ) is a pivot'])
        
        mat=change(mat,row,col,m); %elliminates
        row=row+1; %update next candidate pivot row
        col=col+1; %update next candidate pivot column
    else
        col=col+1; % if it's not a pivot we only increment the coloumn and keep the row as dimensions for the new candidate pivot
    end
    if(row>m || col>n) %in this case we would reached the last pivot or the one before the last and no need to continue looping
        break;
    end
end

%disply what happenned
display('forward ellimination is finished the echlon form of the matrix is')
display(mat)

%to reduce echolon form

for x=h:-1:1 %looping pivots matrix starting from the end to pop pivots
    
    %poping pivot
    row=pivots(x,1);
    col=pivots(x,2);
    
    %disply what happenned
    display(['backward elliminating taking pivot  (', num2str(row) , ' , ' , num2str(col),' )'])
    
    mat = changeBack(mat,row,col); %backword ellimination
    
    factor=mat(row,col);
    if (factor~=1)
        mat(row,:)=mat(row,:)/factor; %reduction by dividing the row by the pivot
        
        %disply what happenned
        display(['row', num2str(row) , ' is reduced' ])
        display(['row', num2str(row) , ' = row' , num2str(row) ,' / ' ,num2str(factor)])
        display('new matrix is')
        display(mat)
        
    end
end

%disply what happenned
display('backward ellimination is finished the reduced echlon form of the matrix is')
display(mat)
end
