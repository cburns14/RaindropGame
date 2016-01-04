class Raindrop {
  float gravity =0.2;
  int diam;
  PVector loc, vel;
  Raindrop(float tx, float ty) {
    loc = new PVector();
    loc.set(tx, ty);
    diam = 30;
    vel = new PVector();
    vel.set(random(-3, 3), random(-3, 3));
  }

  void fall() {

    vel.y += gravity;
    loc.add(vel);
  }
  void display() {
    fill(255);
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
    triangle(loc.x-diam/2, loc.y-3, loc.x+diam/2, loc.y-3, loc.x, loc.y-diam);
  }
  boolean isInContactWith(PVector direction) {
    if (loc.x>direction.x-bucket.wid/2&&loc.x<direction.x+bucket.wid/2&&loc.y+diam>height-50) {
      return true;
    }
    return false;
  }
}