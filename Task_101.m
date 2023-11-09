clc,clearvars,close All

x1=input('Enter the number of rows of first Matrix: ');
y1=input('Enter the number of columns of first Matrix : ');
for r=1:x1
    for c=1:y1
        fprintf('Enter the value in row %d column %d\n',r,c);
        A(r,c)=input('');
    end
end

A=reshape(A,x1,y1);

x2=input('Enter the number of rows of second Matrix: ');
y2=input('Enter the number of columns of second Matrix : ');
for r=1:x2
    for c=1:y2
        fprintf('Enter the value in row %d column %d\n',r,c);
        B(r,c)=input('');
    end
end

M2=reshape(B,x2,y2);
  if y1~=x2
    fprintf('Error! The matrix multiplication is not possible\n');
  else
    fprintf('The matrix multiplication is :\n');
    C=A*B;
    disp(C);
 end

 fprintf('The max value of matrix A is: ');
 max_value_A = max(A(:));
 disp(max_value_A);









