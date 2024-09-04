module CableCutoutStraight(cableDiameter, cableLength) {
  cylinder(cableLength, cableDiameter, cableDiameter, $fn = 100);
  translate([0, cableDiameter * 0.1, 0])
    cylinder(cableLength, cableDiameter, cableDiameter, $fn = 100);
}

module CableCutoutsStraight(cableDiameter, cableLength, count, padding) {
  for(i = [0:1:count-1]) {
    translate([i * (cableDiameter * 2 + padding), 0, 0])
    CableCutoutStraight(cableDiameter, cableLength);
  }
}


module CubeWithCableCutoutsStraight(cubeWidth, cubeDepth, cubeHeight, cableCount, cableDiameter, padding) {
  difference() {
    cube([cubeWidth, cubeDepth, cubeHeight]);
      rotate([90, 0, 0])
      translate([(cubeWidth / 2) - (((cableCount - 1) * (cableDiameter + padding))), cubeHeight - cableDiameter, -cubeDepth])
      CableCutoutsStraight(cableDiameter, cubeDepth, cableCount, padding);
  }
}

// test
CubeWithCableCutoutsStraight(15,30,5, 3, 1.7, 0);
//CableCutoutsStraight(1.7, 35, 5, 1);
