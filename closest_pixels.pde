import org.openkinect.processing.*;

Kinect kinect;

PImage img;

void setup()
{
  size(512,424);
  kinect=new Kinect(this);
  kinect.initDepth();
  img=createImage(kinect.width,kinect.height,RGB );
  
}

void draw() {
  
  background(0);
  
 
  img.loadPixels();
  int[] depth =kinect.getRawDepth();
 
  
 int closest=2000;
 int rx=0;
 int ry=0;
  for (int i=0;i<kinect.width;i++)
  {
    for(int j=0;j<kinect.height;j++)
    {
      int offset=i+j*kinect.width;
      int d=depth[offset];
      if(d>100 && d<600){
      img.pixels[offset]=color(255,0,150);
      
      if(d<closest){
      closest=d;
      rx=i;ry=j;
      }
      
      }
      else{
          img.pixels[offset]=color(0);
      }
     
    }
  }
  img.updatePixels();
  image(img,0,0);
  fill(255);
  ellipse(rx,ry,10,10);
  println(closest);

  
}
