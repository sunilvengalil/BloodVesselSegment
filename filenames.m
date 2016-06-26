clear all
close all
clc
folderName = 'C:\Eye_bv_data\hrf_splitted_new\';
originalFolderName = '/media/srinivas/c390c763-4783-4f07-aca1-ed8b3751d8b1/SRINIVAS/sunil/hrf_splitted_new/';
annotatedForlderName = '/media/srinivas/c390c763-4783-4f07-aca1-ed8b3751d8b1/SRINIVAS/sunil/hrf_gtcombined_splitted/';

files = cell(1);

files{1} = dir(strcat(       char( folderName ), '*.jpg'    )     );

fid = fopen('C:\Eye_bv_data\hrfcombinedfilenames.txt','w');
for fileNum = 1:length(files{1,1} )
        fileName = files{1,1}( fileNum).name;
        [path,name,ext] = fileparts(fileName);
     
       % annottatedfilename = strrep(fileName,'test','manual2');
        annottatedfilename = strrep(fileName,'.JPG','.png');
        annottatedfilename = strrep(annottatedfilename,'.jpg','.png');
        %fileName = strrep(fileName,'.JPG','.png');
        fprintf( fid,'%s%s %s%s\r\n',originalFolderName,fileName,annotatedForlderName,annottatedfilename);
        
%         fprintf( fid,'%s%s %s%s\r\n',strrep(originalFolderName,'OriginalResized','RGBJitteredB20mResized'),fileName,annotatedForlderName,strcat(name,'_a',ext));
%         fprintf( fid,'%s%s %s%s\r\n',strrep(originalFolderName,'OriginalResized','RGBJitteredB20Resized'),fileName,annotatedForlderName,strcat(name,'_a',ext));
%         fprintf( fid,'%s%s %s%s\r\n',strrep(originalFolderName,'OriginalResized','RGBJitteredG20mResized'),fileName,annotatedForlderName,strcat(name,'_a',ext));
%         fprintf( fid,'%s%s %s%s\r\n',strrep(originalFolderName,'OriginalResized','RGBJitteredG20Resized'),fileName,annotatedForlderName,strcat(name,'_a',ext));
%         fprintf( fid,'%s%s %s%s\r\n',strrep(originalFolderName,'OriginalResized','RGBJitteredR20mResized'),fileName,annotatedForlderName,strcat(name,'_a',ext));
%         fprintf( fid,'%s%s %s%s\r\n',strrep(originalFolderName,'OriginalResized','RGBJitteredR20Resized'),fileName,annotatedForlderName,strcat(name,'_a',ext));
%         
               
end
fclose(fid);


