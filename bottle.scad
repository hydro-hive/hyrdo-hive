

module bottle_two(
        height     
        , size            
        , thickness 
        , nossle_height
        , nossle_size
        , filter_size
        , filter_height
        ){
    first = nossle_height / 2;
    second = nossle_height / 2; 
    rotate_extrude()
    rotate([90, 0, 0])
    polygon(points = [
    [size, 0]
    , [size, height]
    , [filter_size, height + first ]
    , [filter_size, height + first + filter_height]
    , [nossle_size, height + first + second + filter_height]
    , [nossle_size + thickness , height + first + second + filter_height]
    , [filter_size + thickness , height + first + filter_height]
    , [filter_size + thickness , height + first ]
    , [size + thickness, height]
    , [size + thickness, 0]
    ]
    );
}

cm = 1 ; 
mm = .1;


bottle_two(
height        = 5 * cm ,
size          = 8 * cm ,
thickness     = 1 * cm ,
filter_size   = 3 * cm ,
filter_height = 1 * cm ,
nossle_size   = 5 * mm ,
nossle_height = 5 * cm 
);




