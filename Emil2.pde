import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture wc;
OpenCV opencv;

void setup() {
  size(640, 480);
  wc = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  wc.start();
}

void draw() {
  scale(2);
  opencv.loadImage(wc);

  image(wc, 0, 0 );

  noFill();
  stroke(random(0,255), random(0,255), random(0,255));
  strokeWeight(1);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    circulo(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
}

void circulo(float x_, float y_, float w_, float h_){
  noFill();
  ellipseMode(CENTER);
  ellipse(x_,y_,w_,h_);
  if(w_>10){
    circulo(x_+w_/2, y_, w_/2, h_/2);
    circulo(x_-w_/2, y_, w_/2, h_/2);
    circulo(x_, y_+w_/2, w_/2, h_/2);
    circulo(x_, y_-w_/2, w_/2, h_/2);
  }
  
}

void captureEvent(Capture c) {
  c.read();
}