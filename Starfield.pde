Particle[] pGroup;
void setup()
{
  size(900,900);
  pGroup = new Particle[1000];
  for (int i = 0; i<pGroup.length; i++)
  {
    pGroup[i] = new NormalParticle();
  }
  pGroup[0] = new OddballParticle();
  pGroup[1] = new JumboParticle();
}
void draw()
{
  background(30,30,30);
  for (int i = 0; i<pGroup.length; i++)
  {
    pGroup[i].show();
    pGroup[i].move();
  }
}
class NormalParticle implements Particle
{
  double mX, mY, mTheta, mSpeed;
  NormalParticle()
  {
    mX = 450;
    mY = 450;
    mTheta = Math.random()*10+15;
    mSpeed = Math.PI*6*Math.random()+1;
  }
  void show()
  {
    fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
    ellipse ((int)mX, (int)mY, 11, 11);
  }
  void move()
  {
    mTheta += 0.01;
    mX += Math.cos(mTheta)*mSpeed;
    mY += Math.sin(mTheta)*mSpeed;
  }
}
interface Particle
{
  public void show();
  public void move();
}
class OddballParticle implements Particle 
{
  double mX, mY, mTheta, mSpeed;
  OddballParticle()
  {
    mX = Math.random()*400+200;
    mY = Math.random()*400+200;
    mTheta = Math.random()*10;
    mSpeed = Math.PI*5*Math.random();
  }
  public void show()//UFO
  {
    fill(0,255,0);
    ellipse((int)mX, (int)mY, 50, 50);
    fill(170, 172, 175);
    ellipse((int)mX, (int)mY+15, 100, 30);
  }
  public void move()
  {
    mTheta += 0.5;
    mX += Math.cos(mTheta)*mSpeed;
    mX += 1;
    if (mX>800)
    {
      mX=Math.random()*800;
    }
    mY += Math.sin(mTheta)*mSpeed;
    mY += 1;
    if (mY>800)
    {
      mY=Math.random()*800;
    }
  }
}
class JumboParticle extends NormalParticle
{
  public void show()//circle
  {
    fill(255,0,0);
    ellipse((int)mX, (int)mY, 100, 100);
    fill(132, 35, 35);
    ellipse((int)mX, (int)mY, 90, 90);
  }
}
