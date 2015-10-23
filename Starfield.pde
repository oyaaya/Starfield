Particle [] bro;
void setup()
{
	size(500,600);
	bro = new Particle[1200];
	for (int i = 0; i<bro.length; i++) {
		bro[i] = new NormalParticle();
		if (i%125==0) {
			bro[i] = new JumboParticle();
		}
	}
	bro[0] = new OddballParticle();
}
void draw()
{
	background(0);
	for (int i = 0; i<bro.length; i++) {
	bro[i].move();
	bro[i].show();
	}
}
class NormalParticle implements Particle
{
	//your code here
	double x,y,speed,angle;
	int rColor, gColor,bColor;
	NormalParticle() {
		x = 250;
		y = 250;
		speed = Math.random()*4+1;
		angle = Math.random()*2*Math.PI;
		rColor = (int)(Math.random()*256);
		gColor = (int)(Math.random()*256);
		bColor = (int)(Math.random()*256);
	}
	public void move() {
		x = (Math.cos(angle) * speed) + x;
		y = (Math.sin(angle) * speed) + y;
		if (x<=0 || x>=500 || y<=0 || y>=500) {
			x = 250;
			y = 250;
			speed = Math.random()*2+1;
			angle = Math.random()*2*Math.PI;
		}
	}
	public void show() {
		fill(rColor,gColor,bColor);
		ellipse((float)x, (float)y, 5, 5);
	}
}
interface Particle
{
	public void move();
	public void show();
}
class OddballParticle implements Particle
{
	double x,y;
	OddballParticle() {
		x = Math.random()*600;
		y = Math.random()*600;
	}
	public void move() {
		x = x + Math.random()*3-1;
		y = y + Math.random()*3-1; 
	}
	public void show() {
		fill(255);
		ellipse((float)x, (float)y, 20, 20);
	}
}
class JumboParticle extends NormalParticle
{
	public void show() {
		ellipse((float)x, (float)y, 25, 25);
	}

}



