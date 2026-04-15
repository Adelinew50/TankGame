class Projectile {
  // Member Variables
  float x,y,w,h,speed;
  
  
  //Constructor
  Projectile(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    speed = 10;
  }
  
  // Member Methods
  void display() {
    fill(255,0,0);
    rect(x,y,w,h);
  }

  void move() {
    y = y - speed;
  }


  boolean reachedBottom() {
    if (y>height + 100) {
      return true;
    } else {
      return false;
    }
  }
}
