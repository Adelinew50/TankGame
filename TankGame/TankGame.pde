//Adeline Wright| April 1 | TankGame
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
Timer rockTimer, puTimer;
float score, rocksMissed, health, projectileCount, x, y, h, w, ammo;
Tank t1;
boolean play;
PImage b1;
//

void setup() {
  size(500, 500);
  t1= new Tank();
  puTimer = new Timer(5000);
  puTimer.start();
  b1= loadImage("background.png");
  rockTimer = new Timer(2000);
  rockTimer.start();
  score=0;
  health=100;
  ammo=50;
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
    if (p.reachedEdge()) {
      projectiles.remove(i);
    }
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
      rocks.remove(i);
      t1.health-=20;
      i--;
    }

    if (rock.reachedBottom()) {
      rocksMissed = rocksMissed +1;
      rocks.remove(rock);
      i--;
    }
    println("Rocks;"  + rocks.size());
  }
  infoPanel();


  //Distribution of PowerUps on a Timer
  if (puTimer.isFinished()) {
    powerups.add(new PowerUp(random(width),-50));
    puTimer.start();
  }
  //Display and Move Powerups
  for (int i = 0; i<powerups.size(); i++) {
    PowerUp pu = powerups.get(i);
    pu.display();
    pu.move();
    if(pu.reachedBottom()) {
      powerups.remove(i);
    }
    //check bottom
    
    if (pu.intersect(t1)) {
      //remove
      powerups.remove(pu);
      if (pu.type=='H') {
        t1.health+=10;
        //Ammo
      } else if (pu.type == 'A') {
        
       t1.ammo+=10;
      }
      //powerups.remove(i);
      //i--;
    }
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

void mousePressed() {
  if (t1.ammo>0){
  float dx=mouseX - t1.x;
  float dy = mouseY -t1.y;
  float mag = sqrt(dx*dx+dy*dy);

  if (mag > 0) {
    dx /= mag;
    dy /= mag;

    float speed = 5;
    projectiles.add(new Projectile(t1.x, t1.y, dx * speed, dy * speed));
    
    t1.ammo-=1;
  }
   //if (t1.fire()) {
   // projectiles.add(new Projectile(t1.x, t1.y));
    //t1.projectileCount--;
  }
  }



void infoPanel() {
  rectMode(CENTER);
  textAlign(LEFT);
  fill(127, 127);
  noStroke();
  rect(width/2, height-25, width, 50);
  fill(255);
  textSize(15);
  text("Score:" + score, 20, width-20);
  textSize(15);
  text("Rocks Missed:" + rocksMissed, width -350, width-20);
  textSize(15);
  text("Health:" + t1.health, width-200, height-20);
  textSize(15);
  text("Ammo:" + t1.ammo, 20, height-6);
  textSize(15);
}
