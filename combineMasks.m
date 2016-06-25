clear all;
close all;
clc;
odAnnotationDir = 'C:\Eye_bv_data\hrfAryaAnnottated_masked\';
bvAnnotationDir ='C:\Eye_bv_data\hrf_gt\';
outDir = 'C:\Eye_bv_data\combinedAnnotation\';

files = dir(strcat(odAnnotationDir,'*.jpg') );


for i = 1 : length(files)
    
    [p n e] = fileparts(files(i).name);
    odAnnotation = imread(fullfile(odAnnotationDir,files(i).name) );
    odbw = im2bw(odAnnotation,0.5);
    bvAnnotation = imread(fullfile(bvAnnotationDir,strcat(n,'.tif')) );
    bvbw = im2bw(bvAnnotation,0.5);
    combinedAnnotation = 64 * bvbw + 128 * odbw;
    save( fullfile( outDir, strcat(n,'.mat')  ), 'combinedAnnotation' ) ;
end
