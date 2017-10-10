Particle[]particles;
void setup()
{
  size(300, 300);
  particles = new Particle[500];
  for (int i=0; i<particles.length; i++)
  {
     particles[i] = new NormalParticle();
  }
{
    particles[1]= new JumboParticle();
        particles[2]= new JumboParticle();
    particles[3] = new OddballParticle();
    
  } 


}
void draw()
{
  background(0);
  for (int i=0; i<particles.length; i++)
  {
    particles [i].move();
    particles [i].show();
  }
}
public class NormalParticle implements Particle
{
  double myX, myY, mySpeed, myAngle;
  int myColor;
  NormalParticle()
  {
    mySpeed=((Math.random()*2)+1);
    myX=150;
    myY=150;
    myAngle=(Math.random()*(2*Math.PI));
    myColor=color(random(256), random(256), random(256));
  }
  public void move()
  {
    myX=(Math.cos(myAngle)*mySpeed)+myX;
    myY=(Math.sin(myAngle)*mySpeed)+myY;
    if(myX>500||myX<-200||myY>500||myY<-200)
    myX=myY=150;
  }
  public void show()
  { 
    fill(myColor);
    ellipse((int)myX, (int)myY, 5, 5);
  }
}
interface Particle
{
  public void move();
  public void show();
}
class OddballParticle extends NormalParticle
{
  public void move()
  {
    myX++;
    myY++;
    if(myX>500||myX<-200||myY>500||myY<-200)
    myX=myY=0;
  }
  public void show()
  {
  fill(255,0,0);
  rect((float)myX-150,(float)myY-150,30,30);
  }
}
class JumboParticle extends NormalParticle
{
  public void move()
  {
    myX=(Math.cos(myAngle)*mySpeed/2)+myX;
    myY=(Math.sin(myAngle)*mySpeed/2)+myY;
    if(myX>500||myX<-200||myY>500||myY<-200)
    myX=myY=150;
    
  }
  public void show()
  {
    fill(myColor);
    ellipse((int)myX,(int)myY,50,50);
  }
}