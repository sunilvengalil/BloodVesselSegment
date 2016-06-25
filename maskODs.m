% set all the pixels inside the OD region to 1 and others to zero
files = dir('C:\Eye_bv_data\hrfAryaAnnottated\*.jpg');
numFiles = length(files);
for i = 1:numFiles

    fileName = files(i).name;
    im = imread(fullfile('C:\Eye_bv_data\hrfAryaAnnottated\',fileName) );
    imMasked = maskOD(im);
    imwrite(imMasked, fullfile('C:\Eye_bv_data\hrfAryaAnnottated_masked\',fileName),'jpeg');

    clear imMasked;
    clear im;
    
end
