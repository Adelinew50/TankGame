class Tank {
  // Member Variable
  float x, y, w, h, speed, health, ammo;
  PImage iTank, iTankR, iTankL, iTankD;
  char idir;

  // Constructor
  Tank() {
    x=100.0;
    y=100.0;
    w=100.0;
    h=100.0;
    ammo=50;
    speed=5.0;
    health=100;
    idir='u';
    iTank=loadImage("wright_tank.png");
    iTankR=loadImage("wright_tankright.png");
    iTankL=loadImage("wright_tankleft.png");
    iTankD=loadImage("wright_tankdown.png");
  }
  void display() {
    imageMode(CENTER);
    if ( idir == 's') {
      image(iTankD, x, y);
    }else if ( idir == 'd') {
      image(iTankR, x, y);
    }else if ( idir == 'a') {
      image(iTankL, x, y);
    }else if ( idir == 'w') {
      image(iTank, x, y);
  }
  }



  void move(char dir) {
    if (dir == 'w') {
      idir='w';
      y = y - speed;
    } else if (dir == 's') {
      y = y + speed;
      idir='s';
    } else if (dir == 'd') {
      x = x + speed;
      idir='d';
    } else if (dir == 'a') {
      x = x - speed;
      idir='a';
    }
  }

  void fire() {
  }

 boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
