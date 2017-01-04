// Country labels //
#place[class='country'][zoom>=2][zoom<=10] {
  text-name: '[name_en]';
  text-face-name: @sans_bold;
  text-placement: point;
  text-size: 10;
  text-fill: @text;
  text-halo-fill: @land;
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-wrap-width: 20;
  text-wrap-before: true;
  text-line-spacing: -3;
  [rank=1] {
    [zoom=3]  { text-size: 12; text-wrap-width: 60; }
    [zoom=4]  { text-size: 14; text-wrap-width: 90; }
    [zoom=5]  { text-size: 20; text-wrap-width: 120; }
    [zoom>=6] { text-size: 20; text-wrap-width: 120; }
  }
  [rank=2] {
    [zoom=2]  { text-name: [code]; }
    [zoom=3]  { text-size: 11; }
    [zoom=4]  { text-size: 13; }
    [zoom=5]  { text-size: 17; }
    [zoom>=6] { text-size: 20; }
  }
  [rank=3] {
    [zoom=3]  { text-name: [code]; }
    [zoom=4]  { text-size: 11; }
    [zoom=5]  { text-size: 15; }
    [zoom=6]  { text-size: 17; }
    [zoom=7]  { text-size: 18; text-wrap-width: 60; }
    [zoom>=8] { text-size: 20; text-wrap-width: 120; }
  }
  [rank=4] {
    [zoom=5] { text-size: 13; }
    [zoom=6] { text-size: 15; text-wrap-width: 60  }
    [zoom=7] { text-size: 16; text-wrap-width: 90; }
    [zoom=8] { text-size: 18; text-wrap-width: 120; }
    [zoom>=9] { text-size: 20; text-wrap-width: 120; }
  }
  [rank=5] {
    [zoom=5] { text-size: 11; }
    [zoom=6] { text-size: 13; }
    [zoom=7] { text-size: 14; text-wrap-width: 60; }
    [zoom=8] { text-size: 16; text-wrap-width: 90; }
    [zoom>=9] { text-size: 18; text-wrap-width: 120; }
  }
  [rank>=6] {
    [zoom=7] { text-size: 12; }
    [zoom=8] { text-size: 14; }
    [zoom>=9] { text-size: 16; }
  }
}

// State labels //
#place[class='state'][zoom>=4][zoom<=10] {
  text-name: [name_en];
  text-face-name: @sans;
  text-placement: point;
  text-fill: @fill2;
  text-halo-fill: @land;
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-size: 10;

  [zoom>=5][zoom<=6] {
    [area>10000] { text-size: 12; }
    [area>50000] { text-size: 14; }
    text-wrap-width: 40;
  }
  [zoom>=7][zoom<=8] {
    text-size: 14;
    [area>50000] { text-size: 16; text-character-spacing: 1; }
    [area>100000] { text-size: 18; text-character-spacing: 3; }
    text-wrap-width: 60;
  }
  [zoom>=9][zoom<=10] {
    text-halo-radius: 2;
    text-size: 16;
    text-character-spacing: 2;
    [area>50000] { text-size: 18; text-character-spacing: 2; }
    text-wrap-width: 100;
  }
}

// Display capital cities alongside stars.
#place::capitals[class='city'][capital=2][zoom<9] { 
  shield-file: url("star.svg");
  shield-name: '[name_en]';
  shield-face-name: @sans;
  shield-size: 12;
  shield-fill: @text;
  shield-halo-fill: @land;
  shield-halo-radius: 1;
  shield-unlock-image: true;
  shield-wrap-width: 80;
  shield-line-spacing: -2;

  [zoom>=6] { shield-size: 16; } 
}

// Display low zoom cities alongside points.
#place[class='city'][rank<=4][zoom>=4][zoom<9] {
  shield-name: '[name_en]';
  shield-face-name: @sans;
  shield-size: 12;
  shield-fill: @text;
  shield-halo-fill: @land;
  shield-halo-radius: 1;
  shield-unlock-image: true;
  shield-file: url("dot.svg");
  shield-wrap-width: 80;
  shield-line-spacing: -2;

  [zoom>=6] { shield-size: 14; }

  // Emphasize major cities.
  [rank<=6] { shield-size: 14; }
  [zoom>=6][rank<=6] { shield-size: 16; } 
}

// Gradually replace shields with regular text labels.
#place[class='city'][rank<=4][zoom>=9] {
  text-name: '[name_en]';
  text-face-name: @sans;
  text-size: 14;
  text-fill: @text;
  text-halo-fill: @land;
  text-halo-radius: 1;
  text-min-distance: 4;
  text-wrap-width: 80;
  [rank<=3] { 
    text-fill: @text;
    text-size: 20;
  } 
}

// Mid priority place labels //
#place[class='town'][rank<=15][zoom>=10],
#place[class='village'][rank<=15][zoom>=12],
#place[class='hamlet'][rank<=15][zoom>=13],
#place[class='town'][rank<=15][zoom>=14],
#place[class='village'][rank<=15][zoom>=14],
#place[class='hamlet'][rank<=15][zoom>=14] { 
  text-name: '[name_en]';
  text-face-name: @sans;
  text-size: 13;
  text-fill: @text;
  text-halo-fill: @land;
  text-halo-radius: 2;
  text-min-distance: 4;
  text-wrap-width: 80;
  [zoom>=12] { 
    text-size: 16;
    text-fill: @text;
  }
}

// Low priority place labels //
#place[class='suburb'][rank<=15][zoom>=12],
#place[class='neighbourhood'][rank<=15][zoom>=13],
#place[class='suburb'][rank<=15][zoom>=14],
#place[class='neighbourhood'][rank<=15][zoom>=15] { 
  text-name: @name;
  text-face-name: @sans;
  text-size: 14;
  text-fill: @text;
  text-halo-fill: @land;
  text-halo-radius: 2;
  text-min-distance: 4;
  text-wrap-width: 60;
}

// Road labels
#road_label[len>2000][zoom>=12],
#road_label[len>1000][zoom>=15] { 
  text-placement: line;
  text-transform: uppercase;
  text-face-name: @sans;
  text-name: @name;
  text-size: 9;
  text-min-distance: 100;
  text-halo-fill: @land;
  text-halo-radius: 1;
  text-fill: @text;
  [zoom>=17] { text-size: 11;}
}


#water_label {
  [zoom<=13],
  [zoom>=14][area>500000],
  [zoom>=16][area>10000],
  [zoom>=17] {
    text-name: @name;
    text-face-name: @sans_bold;
    text-fill: @text;
    text-size: 12;
    text-halo-fill: @water;
    text-halo-radius: 1;
    text-wrap-width: 60;
    text-wrap-before: true;
    text-avoid-edges: true;
  }
}

#waterway[class='river'][name!=null][zoom>=13],
#waterway[class='canal'][name!=null][zoom>=14],
#waterway[class='stream'][name!=null][zoom>=15] { 
  text-name: @name;
  text-face-name: @sans_bold;
  text-fill: @text;
  text-min-distance: 60;
  text-size: 10;
  text-halo-fill: @water;
  text-halo-radius: 1;
  text-wrap-before: true;
  text-avoid-edges: true;
  text-placement: line;
}

// Place labels
#poi[class='park'][rank<=2],
#poi[class='airport'][rank<=2],
#poi[class='airfield'][rank<=2],
#poi[class='rail'][rank<=2],
#poi[class='school'][rank<=2],
#poi[class='hospital'][rank<=2] { 
  text-face-name: @sans_bold;
  text-allow-overlap: false;
  text-name: @name;
  text-size: 9;
  text-line-spacing: -2;
  text-min-distance: 50;
  text-wrap-width: 60;
  text-halo-fill: @land;
  text-halo-radius: 1;
  text-fill: @text;
}
