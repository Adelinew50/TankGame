//Adeline Wright| April 1 | TankGame
ArrayList<Rock> rocks = new ArrayList<Rock>();
Timer rockTimer, puTimer;
Tank t1;
Tank t2;
PImage b1;

void setup() {
  size(500, 500);
  t1= new Tank();
  //t2=new Tank();
  b1= loadImage("background.png");
  rockTimer = new Timer(2000);
  rockTimer.start();
}

void draw() {

  image (b1, width/2, height/2, 650, 650) ;
  t1.display();

  //Distribution of Rocks on a Timer
  if (rockTimer.isFinished()) {
    rocks.add(new Rock());
    rockTimer.start();
  }
  //Display of all the rocks
  for (int i = 0; i < rocks.size(); i++) {
    Rock rock = rocks.get(i);
    rock.display();
    rock.move();


    if (t1.intersect(rock)) {
      rocks.remove(rock);
    }

    if (rock.reachedBottom()) {
      rocks.remove(rock);
      i--;
    }
    println("Rocks;"  + rocks.size());
  }
}

void keyPressed() {
  if (key == 'w') {
    t1.move('w');
  } else if (key == 's') {
    t1.move('s');
  } else if (key == 'd') {
    t1.move('d');
  } else if (key == 'a') {
    t1.move('a');
  }
}
