import org.openkinect.processing.*;

Kinect kinect;

PImage img;
PImage dImg =kinect.getDepthImage();
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
  float sumX=0;
  float sumY=0;
  float totalPixels=0;
  
 
  for (int i=0;i<kinect.width;i++)
  {
    for(int j=0;j<kinect.height;j++)
    {
      int offset=i+j*kinect.width;
      int d=depth[offset];
      if(d>200&&d<600){
      img.pixels[offset]=color(255,0,150);
      sumX +=i;
      sumY +=j;
      totalPixels++;
      
      
      }
      else{
          img.pixels[offset]=dImg.pixels[offset];
      }
     
    }
  }
  img.updatePixels();
  image(img,0,0);
  float avgX=sumX/totalPixels;
  float avgY=sumY/totalPixels;
  fill(150,150,150);
  ellipse(avgX,avgY,20,20);
  
}
