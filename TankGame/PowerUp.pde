class PowerUp {
  // Member Variables
  float x, y, w, h, speed;
  float diam=100;
  char type;
  color c1;
  //Consturctor
  PowerUp(float x, float y) {
    this.y=y;
    this.x=x;
    //this.w=w;
    //this.h=h;
    speed =int(random(1, 5));


    if (random(10)>7) {
      //rock1=loadImage("ammo.png");
      type = 'A'; //This is AMMO
      c1 = color(255, 0, 0);
    } else if (random(10)>5) {
      //rock1=loadImage("health.png");
      type = 'H'; //This is Health
      c1 = color(0, 255, 0);
    }
  }
  // Member Methods
  void display() {
    fill(c1);
    ellipse(x, y, diam, diam);
    fill(255);
    textAlign(CENTER);
    text(type, x, y);
    //imageMode(CENTER);
    //c1.resize(w,w);
    //image(c1, x, y);
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

  boolean intersect(Tank t1) {
    float d = dist(x, y, t1.x, t1.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
