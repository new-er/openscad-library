module CableCutoutStraight(cableRadius, cableLength) {
  cylinder(cableLength, cableRadius, cableRadius, $fn = 100);
  translate([0, cableRadius * 0.1, 0])
    cylinder(cableLength, cableRadius, cableRadius, $fn = 100);
}

module CableCutoutsStraight(cableRadius, cableLength, count, padding) {
  cableDiameter = cableRadius * 2;
  for(i = [0:1:count-1]) {
    translate([i * (cableDiameter + padding), 0, 0])
    CableCutoutStraight(cableRadius, cableLength);
  }
}


module CubeWithCableCutoutsStraightCenter(cubeWidth, cubeDepth, cubeHeight, cableCount, cableRadius, padding) {
  cableDiameter = cableRadius * 2;
  difference() {
    cube([cubeWidth, cubeDepth, cubeHeight]);
      rotate([90, 0, 0])
      translate([(cubeWidth / 2) - (((cableDiameter + padding) * cableCount) / 2) + ((cableDiameter + padding) / 2), cubeHeight - cableRadius, -cubeDepth])

      CableCutoutsStraight(cableRadius, cubeDepth, cableCount, padding);
  }
}

// test
CubeWithCableCutoutsStraightCenter(70,30,5, 9, 1.7, 2);
//CableCutoutsStraight(1.7, 35, 5, 1);
