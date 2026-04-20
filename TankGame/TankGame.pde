//Adeline Wright| April 1 | TankGame
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
Timer rockTimer, puTimer;
int score, rocksMissed, x, y, h, w;
Tank t1;
Tank t2;
boolean play;
PImage b1;

void setup() {
  size(500, 500);
  t1= new Tank();
  b1= loadImage("background.png");
  rockTimer = new Timer(2000);
  rockTimer.start();
  score=0;
  rocksMissed=0;
  play=false;
}


void draw() {
  imageMode(CENTER);
  image (b1, width/2, height/2, 650, 650) ;

  // Display the lasers and detect collison
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    for (int j = 0; j < rocks.size(); j++) {
      Rock r = rocks.get(j);
      if (p.intersect(r)) {
        score = score + 10;
        projectiles.remove(i);
        rocks.remove(j);
      }
    }
    p.display();
    p.move();
  }
  t1.display();
  // }
  // }


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
      score+=rock.diam;
    }

    if (rock.reachedBottom()) {
      rocksMissed = rocksMissed +1;
      rocks.remove(rock);
      i--;
    }
    println("Rocks;"  + rocks.size());
  }
  infoPanel();
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

void mousePressed() {
  float dx=mouseX - t1.x;
  float dy = mouseY -t1.y;
  float mag = sqrt(dx*dx+dy*dy);

  if (mag > 0) {
    dx /= mag;
    dy /= mag;

    float speed = 5;
    projectiles.add(new Projectile(t1.x, t1.y, dx * speed, dy * speed));
  }
}

void infoPanel() {
  rectMode(CENTER);
  fill(127, 127);
  noStroke();
  rect(width/2, height-25, width, 50);
  fill(255);
  textSize(15);
  text("Score:" + score, 20, width-20);
  textSize(15);
  text("Rocks Missed:" + rocksMissed, width -400, width-20);
  textSize(15);
}
