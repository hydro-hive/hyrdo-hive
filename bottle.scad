module bottle(
        height
        , diameter
        , thickness
        , nossle_height
        , nossle_size
        , filter_diameter
        , filter_height
        ){
    first = nossle_height / 2;
    second = nossle_height / 2;
    rotate_extrude($fn=200)
    polygon(points = [
    [diameter, 0]
    , [diameter, height]
    , [filter_diameter, height + first ]
    , [filter_diameter, height + first + filter_height]
    , [nossle_size, height + first + second + filter_height]
    , [nossle_size + thickness , height + first + second + filter_height]
    , [filter_diameter + thickness , height + first + filter_height]
    , [filter_diameter + thickness , height + first ]
    , [diameter + thickness, height]
    , [diameter + thickness, 0]
    ]
    );
}

cm = 10 ;
mm = 1;


bottle(
    height          = 8 * cm ,
    diameter        = 8 * cm ,
    thickness       = 1 * cm ,
    filter_diameter = 3 * cm ,
    filter_height   = 1 * cm ,
    nossle_size     = 5 * mm ,
    nossle_height   = 5 * cm
);
