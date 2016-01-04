class Bucket {

  int wid;
  int hei;
  Bucket() {
    wid= 180;
    hei= 45;
  }
  void display() {
    fill(139, 69, 19);
    rect(mouse.x-wid/2, height-50, wid, hei);
  }
}