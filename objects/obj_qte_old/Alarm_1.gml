for (var i=0; i<point_amount; i++) {
	points[i] = random(width);
}

for (var i=0; i<point_amount; i++) {
	for (var j=0; j<point_amount; j++) {
		if i != j 
			while points[i] < points[j] and points[i] > points[j]+0.2
				points[i] = random(width);
	}
}