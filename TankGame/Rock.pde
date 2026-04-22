class Rock {
  // Member Variables
  int x, y, diam, speed, w, h ;
  PImage rock1;
   char dir;
  
  Rock() {
    x=int (random(width));
    y=-100;
    diam=int(random(75, 100));
    speed =int(random(1, 3));
      rock1=loadImage("rock.png");
    
  }
  // Member Methods
  void display() {
    imageMode(CENTER); 
    //rock1.resize(diam, diam);
    image(rock1, x, y);
  }

  void move() {
    y = y + speed;
  }

  boolean reachedBottom() {
    if (y>height + 100) {
      return true;
    } else {
      return false;
    }
  }
  
}
