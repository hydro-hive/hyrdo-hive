module bottle(
        height
        , diameter
        , thickness
        , nossle_height
        , nossle_diameter
        , filter_diameter
        , filter_height
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
    }
