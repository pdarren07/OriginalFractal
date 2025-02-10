int fracSize = 300;
boolean L, R = false;
public void setup() {
  size(750,750);
  background(255);
}
public void draw() {
  background(50 + (180 * mouseX/750), 190 + (65 * mouseX/750), 90 + (140 * mouseY/750));
  //background(152, 255, 152);
  fractal(mouseX, mouseY, fracSize);
  if(L)
    fracSize -= 5;
  if(R)
    fracSize += 5;
  if(fracSize >= 600)
    fracSize = 110;
  if(fracSize <= 100)
    fracSize = 600;
}
public void keyPressed() {
  if(keyCode == LEFT)
    L = true;
  if(keyCode == RIGHT)
    R = true;
  if(key == ' ')
    fracSize = 300;
}
public void keyReleased() {
  if(keyCode == LEFT)
    L = false;
  if(keyCode == RIGHT)
    R = false;
}
public void fractal(int x, int y, float length) {
  if (length < 20)  {
    fill(255, 210, 220);
    ellipse(x,y,length,length);
  }
  else {
    stroke(255);
    fill(255,182 - (52 * length/500),193 - (4 * length/500));
    ellipse(x-length/4,y,length/2,length/2);
    ellipse(x-length*(float)Math.sqrt(2)/8,y-length*(float)Math.sqrt(2)/8,length/2,length/2);
    ellipse(x,y-length/4,length/2,length/2);
    ellipse(x+length*(float)Math.sqrt(2)/8,y-length*(float)Math.sqrt(2)/8,length/2,length/2);
    ellipse(x+length/4,y,length/2,length/2);
    ellipse(x+length*(float)Math.sqrt(2)/8,y+length*(float)Math.sqrt(2)/8,length/2,length/2);
    ellipse(x,y+length/4, length/2, length/2);
    ellipse(x-length*(float)Math.sqrt(2)/8,y+length*(float)Math.sqrt(2)/8,length/2,length/2);
    fractal(x,y,length/1.5);
  }
}
