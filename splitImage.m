clear all
close all
clc
folderName = 'C:\Eye_bv_data\hrf\';
gtfolderName = 'C:\Eye_bv_data\combinedAnnotation\';
outFolderName = 'C:\Eye_bv_data\hrf_splitted_new\';
outgtFolderName = 'C:\Eye_bv_data\hrf_gt_splitted_new\';
files = cell(1);
extn = 'jpg';

files{1} = dir(strcat(       char( folderName ), '*.',extn    )     );

filenameID = 1000;
croplength = 100;

for fileNum = 1:length(files{1,1} )
        
        fileName = files{1,1}( fileNum).name;
        im = imread(strcat(char( folderName ), fileName)) ;
        gtfilename = strrep(fileName,'JPG','mat');
        gtfilename = strrep(gtfilename,'jpg','mat');
        %gtfilename = fileName;
        gtim = load(strcat(char( gtfolderName ), gtfilename)) ;
        [height,width,d] = size(im);
        im = imcrop(im,[croplength,croplength,height- 2 * croplength,width-2 * croplength]);
        gtimcropped = gtim.combinedAnnotation( croplength:height-croplength,croplength:width-croplength);
        filenameID = splithrf(gtimcropped,im,outFolderName,outgtFolderName,filenameID);        
end


