
// import the TUIO library
import TUIO.*;
import processing.video.*; 

// declare a TuioProcessing client
TuioProcessing tuioClient;
//Movie movie; 

boolean verbose = false; // print console debug messages
boolean callback = true; // updates only after callbacks
PImage img0;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
PImage img10;
PImage img11;
PImage img12;
int offset;

void setup()
{
  img0 = loadImage("data/img0.png");
  img1 = loadImage("data/img1.png");
  img2 = loadImage("data/img2.png");
  img3 = loadImage("data/img3.png");
  img4 = loadImage("data/img4.png");
  img5 = loadImage("data/img5.png");
  img6 = loadImage("data/img6.png");
  img7 = loadImage("data/img7.png");
  img8 = loadImage("data/img8.png");
  img9 = loadImage("data/img9.png");
  img10 = loadImage("data/img10.png");
  img11 = loadImage("data/img11.png");
  img12 = loadImage("data/img12.png");
  //movie = new Movie(this, "citybase.mp4"); 
  //movie.loop();
  
  // GUI setup
  noCursor();
  size(displayWidth, displayHeight);
  noStroke();
  fill(0);

  if (!callback) {
    frameRate(60);
    loop();
  } else noLoop(); // or callback updates 

  tuioClient  = new TuioProcessing(this);
}

//void movieEvent(Movie movie) {  
//  movie.read();
//}

void draw()
{
  background(255);
 
    
  ArrayList<TuioObject> tuioObjectList = tuioClient.getTuioObjectList();
  for (int i=0; i<tuioObjectList.size(); i++) {
    TuioObject tobj = tuioObjectList.get(i);
    noStroke();
    fill(255, 0, 0);
    //image(movie,0,0,width, height);
    pushMatrix();
    translate(tobj.getScreenX(width), tobj.getScreenY(height));
    rotate(tobj.getAngle());
    popMatrix();
    fill(255);
    //image(movie,0,0,width,height);
    text(""+tobj.getSymbolID(), tobj.getScreenX(width), tobj.getScreenY(height));
    
              if(tobj.getSymbolID()==12){      
    image(img12,tobj.getScreenX(width)-400,tobj.getScreenY(height)-300-offset);    
    }
    
    if(tobj.getSymbolID()==0){ 
    image(img0,tobj.getScreenX(width),tobj.getScreenY(height)-420-offset);    
    }
    
    if(tobj.getSymbolID()==1){      
    image(img1,tobj.getScreenX(width),tobj.getScreenY(height)-50-offset);    
    }
    
        if(tobj.getSymbolID()==2){      
    image(img2,tobj.getScreenX(width),tobj.getScreenY(height)-85-offset);    
    }
    
        if(tobj.getSymbolID()==3){      
    image(img3,tobj.getScreenX(width),tobj.getScreenY(height)-70-offset);    
    }
    
        if(tobj.getSymbolID()==4){      
    image(img4,tobj.getScreenX(width),tobj.getScreenY(height)-35-offset);    
    }
    
        if(tobj.getSymbolID()==5){      
    image(img5,tobj.getScreenX(width),tobj.getScreenY(height)-190-offset);    
    }
    
        if(tobj.getSymbolID()==6){      
    image(img6,tobj.getScreenX(width),tobj.getScreenY(height)-70);    
    }
    
        if(tobj.getSymbolID()==7){      
    image(img7,tobj.getScreenX(width),tobj.getScreenY(height)-78);    
    }
    
        if(tobj.getSymbolID()==8){      
    image(img8,tobj.getScreenX(width),tobj.getScreenY(height)-182-offset);    
    }
    
        if(tobj.getSymbolID()==9){      
    image(img9,tobj.getScreenX(width),tobj.getScreenY(height)-80-offset);    
    }
    
        if(tobj.getSymbolID()==10){      
    image(img10,tobj.getScreenX(width),tobj.getScreenY(height)-102-offset);    
    }
    
        if(tobj.getSymbolID()==11){      
    image(img11,tobj.getScreenX(width),tobj.getScreenY(height)-72-offset);    
    }
      
  }
  
}



void addTuioObject(TuioObject tobj) {
  if (verbose) println("add obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle());
}

// called when an object is moved
void updateTuioObject (TuioObject tobj) {
  if (verbose) println("set obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle()
    +" "+tobj.getMotionSpeed()+" "+tobj.getRotationSpeed()+" "+tobj.getMotionAccel()+" "+tobj.getRotationAccel());
}

// called when an object is removed from the scene
void removeTuioObject(TuioObject tobj) {
  if (verbose) println("del obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+")");
}
// called at the end of each TUIO frame
void refresh(TuioTime frameTime) {
  if (verbose) println("frame #"+frameTime.getFrameID()+" ("+frameTime.getTotalMilliseconds()+")");
  if (callback) redraw();
}


// --------------------------------------------------------------//
