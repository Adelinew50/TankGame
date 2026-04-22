class Projectile {
  // Member Variables
  float x, y, w, h, speed;
  float vx, vy;
  char dir;


  //Constructor
  Projectile(float x, float y, float vx, float vy) {
    this.x = x;
    this.y = y;
    w =10;
    h=10;
    this.vx = vx;
    this.vy = vy;
    speed = 10;
    dir='u';
  }

  // Member Methods
  void display() {
    fill(255, 0, 0);
    rect(x, y, w, h);
  }

  void move() {
    x += vx;
    y+= vy;
    //y = y - speed;
  }

  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<100) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachedBottom() {
    if (y>height + 100) {
      return true;
    } else {
      return false;
    }
  }
  
    boolean reachedEdge() {
    if (x>width || x < -101 || y>height || y<0) {
      return true;
    } else {
      return false;
    }
  }
}
