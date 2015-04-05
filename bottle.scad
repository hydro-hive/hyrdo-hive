module skirt_element(h1=1, h2=1, h3=1, w1=1, w2=1, height=1)
{
    linear_extrude(height=height) {
        polygon(points = [
                [0, 0],
                [h1, 0],
                [h1, w1],
                [h1+h2, w1],
                [h1+h2, 0],
                [h1+h2+h3,0],
                [h1+h2+h3,w1+w2],
                [0,w1+w2]
        ]);
    }
}

module skirtGuide(
    nossle_radius,
    skirt_start_height,
    skirt_height,
    skirt_width)
{
    translate([10,nossle_radius,skirt_start_height])
        rotate([0,-90,0])
        skirt_element(
                h2=skirt_height, 
                w1=skirt_width, 
                height=20);

    translate([10,-nossle_radius,skirt_start_height+2+skirt_height])
        rotate([0, 90,180])
        skirt_element(
                h2=skirt_height, 
                w1=skirt_width, 
                height=20);

    
}

module bottle(
        height
        , diameter
        , thickness
        , nossle_height
        , nossle_diameter
        , filter_diameter
        , filter_height
	, skirt_height=2
	, skirt_width=5
    ){
	radius = diameter/2;
	filter_radius = filter_diameter/2;
	nossle_radius = nossle_diameter/2;
	first = nossle_height / 2;
	second = nossle_height / 2;
	rotate_extrude($fn=200)
	polygon(points = [
		[radius, 0]
		, [radius, height]
		, [filter_radius, height + first ]
		, [filter_radius, height + first + filter_height]
		, [nossle_radius, height + first + second + filter_height]
		, [nossle_radius + thickness , height + first + second + filter_height]
		, [filter_radius + thickness , height + first + filter_height]
		, [filter_radius + thickness , height + first ]
		, [radius + thickness, height]
		, [radius + thickness, 0]
	    ]
	);
	skirt_start_height = height+nossle_height+filter_height-1;
	skirt_guide(nossle_radius, skirt_start_height, skirt_height, skirt_width);

    }



//bottle(
     //height          = 20,
     //diameter        = 60,
     //thickness       = 3,
     //filter_diameter = 50,
     //filter_height   = 4,
     //nossle_diameter     = 5,
     //nossle_height   = 20
 //);
