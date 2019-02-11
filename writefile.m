

function final = writefile(var,name)

fileID = fopen(name, 'w' );
fwrite(fileID,var,'single');
fclose(fileID);
final = fprintf("Done");

end






























