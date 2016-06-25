function [ maskedIm ] = maskOD( im )
% set all the pixels inside the OD region to 1 and others to zero
    croplength= 350;
    greythroshold = 10;

    img = rgb2gray(im);

    [height,width] = size(img);


    toppad = zeros(croplength-1,width);
    bottompad = zeros(croplength,width);
    leftpad = zeros(height-2 * croplength + 1,croplength - 1);
    rightpad = zeros(height-2 * croplength + 1,croplength );
    
    imgcropped = img(croplength:height-croplength,croplength:width-croplength);
    indices = (imgcropped <greythroshold);

    [x,y] = find(imgcropped < greythroshold );


    xcenter =min(x) + ( (max(x) - min(x)) /2 );
    ycenter =min(y) + ( (max(y) - min(y)) /2 );

    imMasked = imfill(indices,[floor(xcenter), floor(ycenter) ]);


    imh =imhist(imMasked);
    if imh(2) > imh(1)
          imMasked = ~imMasked;  
    end
    
    imMasked = [leftpad imMasked rightpad];
    maskedIm = [toppad;imMasked;bottompad];
    

end

