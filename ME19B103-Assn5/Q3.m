clear all

Data = fopen('mydata.dat');
n_line = fskipl(Data,Inf);
frewind(Data);

for i=1:n_line
  lines{i} = fgetl(Data);
endfor 

fclose('all');
for i=1:n_line
  lines{1,i} 
endfor 