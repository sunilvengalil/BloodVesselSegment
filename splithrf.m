function [lastFileID] =    splithrf(gtim,  im,folderName,gtfolderName,fileID )

%threshold
%  [w,h] = size(im);
%  im1 = zeros(w,h);
%  im1(im >=1) = 255;

%im1 = im;

%resize to 513
[w,h,d] = size(im);
w
h
rows = 3;
cols =4;

fromc = 1; 
fromr = 1;
for r = 1:rows
    for c = 1:cols  
        fromr;  
        fromc;
        impatch = im(fromr:fromr+512,fromc:fromc+512,:);
        
        gtimpatch = gtim(fromr:fromr+512,fromc:fromc+512,:);
        outfileName = strcat(num2str(fileID),'.jpg');
        gtoutfileName = strcat(num2str(fileID),'.png');
        
        imwrite( impatch,strcat(folderName,outfileName)  ,'jpg'  );
        imwrite( gtimpatch,strcat(gtfolderName,gtoutfileName)  ,'png'  );
        fileID = fileID + 1;
        fromc = fromc +  513; 
    end
    fromr = fromr + 513;
    fromc=1;
end
lastFileID = fileID;
                                                                                                                                                                        
%imwrite(im,strcat(folderName,fileName),'png');
end

