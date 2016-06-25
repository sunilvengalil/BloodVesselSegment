fileName ='01_h.jpg';
im = imread(fullfile('C:\Eye_bv_data\hrfAryaAnnottated\',fileName) );
    imMasked = maskOD(im);
    imshow(imMasked);