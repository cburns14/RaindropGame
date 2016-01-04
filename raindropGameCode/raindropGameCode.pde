PVector mouse;   //declare a P
Raindrop r; //declare a new Raindrop called r
int count = 1;
int score = 0;
int difficulty = 0;
Bucket bucket;
ArrayList<Raindrop> drops = new ArrayList<Raindrop>();
// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test
void setup() {
  size(1200, 800);
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}

  drops.add(new Raindrop(random(width), 0));   //Initialize r. The parameters used are the initial x and y positions

  bucket = new Bucket();
}

void draw() {
 if(frameCount%20 == 0){
  drops.add(new Raindrop(random(width), 0));
 }
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  //image(rain,0,0,width,height);
  background(0);
  fill(255);
  textSize(30);
  text("score: "+score, 100, 100);
  text("RAINDROP GAME", 500, 100);
  bucket.display();
  scoring();
  for (int i = 0; i<drops.size(); i++) {
    Raindrop r = drops.get(i);
    r.fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    r.display();      //display the raindrop
    if (r.isInContactWith(mouse)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      drops.remove(i); 
      score++;
      difficulty++;//if it is, reset the raindrop
    }
    if (r.loc.y > height + r.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      drops.remove(i);                           //if it does, reset the raindrop
      score--;
      difficulty--;
    }
    if (r.loc.x<=0||r.loc.x>=width) {
      drops.remove(i);
    }
  }
}

void scoring() {
  if (difficulty>10) {
    drops.add(new Raindrop(random(width), 0));
    difficulty=difficulty-10;
  }
  if (difficulty<0) {
    if (drops.size()>0) {
      drops.remove(0);
    } else {
      textSize(80);
      fill(255);
      rect(100, 300, 930, 250);
      fill(0);
      text("You lose!", 400, 400);
      text("Click here to retry", 200, 500);
    }
    if (mouseX<1030&&mouseX>100&&mouseY<550&&mouseY>300) {
      fill(200);
      rect(100, 300, 930, 250);
      fill(0);
      text("You lose!", 400, 400);
      text("Click here to retry", 200, 500);
      if (mousePressed) {
        difficulty = 0;
        score = 0;
        drops.add(new Raindrop(random(width), 0));
      }
    }
  }
} 