import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import processing.sound.*;

SoundFile file;
Fecha primera;
Fecha segunda;
Fecha tercera;
Fecha cuarta;
Fecha quinta;
PImage Fondo;
long tiempo = 0;
long t_actualizado = 0;
long t_retardo = 33000 ; // retardo de 33 segundos



void setup(){
  size(500,375);
  file = new SoundFile(this,"bomb.wav");
 
  
  PVector posInicial = new PVector(width/2, height/2);
  primera = new Fecha(posInicial, 100, color(255,141,51,50));
  
  PVector posInicial2 = new PVector(width/2, height/2);
  segunda = new Fecha(posInicial2, 100, color(25,34,255,50));
  
   PVector posInicial3 = new PVector(width/2, height/2);
  tercera = new Fecha(posInicial3, 100, color(134,255,51,50));
  
   PVector posInicial4 = new PVector(width/2, height/2);
  cuarta = new Fecha(posInicial4, 100, color(255,255,51,50));
  
   PVector posInicial5 = new PVector(width/2, height/2);
 quinta = new Fecha(posInicial5, 100, color(184,51,255,50));
   
}

void draw(){
  tiempo = millis();
  Fondo =loadImage("sicmundus.jpg");
  image (Fondo,0,0);
  primera.mover();
  segunda.mover();
  tercera.mover();
  cuarta.mover();
  quinta.mover();
  
 if (primera.ColisionoConOtro(segunda)){
   primera.tono = color(255,141,51,50);
   segunda.tono = color(25,34,255);
   textSize(30);
   fill(255);
   text("1921-1954", 40, 40);
  }
  
  if (primera.ColisionoConOtro(tercera)){
    primera.tono = color(255,141,51,50);
    tercera.tono = color(134,255,51);
    textSize(30);
   fill(255);
   text("1921-1987", 40, 80);
   
  }
   if (primera.ColisionoConOtro(quinta)){ 
    primera.tono = color(255,141,51,50);
    quinta.tono = color(184,51,255);
     textSize(30);
   fill(255);
   text("1921-2053", 40, 120);
  }
 
  if (segunda.ColisionoConOtro(cuarta)){
   segunda.tono = color(25,34,255,50);
   cuarta.tono = color(255,255,51);
    textSize(30);
   fill(255);
   text("1954-2020", 40, 160);
  }
  
  if (tercera.ColisionoConOtro(quinta)){
   tercera.tono = color(134,255,51,50);
   quinta.tono = color(184,51,255);
    textSize(30);
   fill(255);
   text("1987-2053", 40, 200);
  }
  
   if (cuarta.ColisionoConOtro(tercera)){
   cuarta.tono = color(255,255,51,50);
   tercera.tono = color(134,255,51);
    textSize(30);
   fill(255);
   text("2020-1987", 40, 240);
  }
  
  if (quinta.ColisionoConOtro(cuarta)){
    quinta.tono = color(184,51,255,50);
    cuarta.tono = color(255,255,51);
     textSize(30);
   fill(255);
   text("2053-2020", 40, 280);
  }
  
  if( tiempo > t_actualizado + t_retardo) {
  t_actualizado = tiempo;
  file.play();
  background(0);
  }
  

  primera.mostrar(); 
  segunda.mostrar();
  tercera.mostrar();
  cuarta.mostrar();
  quinta.mostrar();
}


class Fecha{
PVector pos, vel;
int radio;
color tono;


Fecha(PVector P_pos, int P_radio, color P_tono){
pos = P_pos;
radio = P_radio;
vel = new PVector (random(-7,7),random(-7,7));
tono = P_tono;
}

void mostrar(){
 noStroke();
  fill(tono);
  ellipseMode(RADIUS);
  ellipse (pos.x, pos.y, radio, radio);
  
  
}

void mover(){
  pos.add(vel);
  
  if(pos.x < 0 || pos.x>width){
    pos.x -= vel.x;
    vel.x *=-1;
  }
  if(pos.y < 0 || pos.y>height){
    pos.y -= vel.y;
    vel.y *=-1;
  }
 
 
}

boolean ColisionoConOtro(Fecha otro){
  float sumaRadios = radio + otro.radio;
  float dist = dist(pos.x, pos.y, otro.pos.x, otro.pos.y);
  
  if (dist > sumaRadios) return false;
  else return true;

}
  
  boolean ColisionoConOtra(Fecha otra){
  float sumaRadios = radio + otra.radio;
  float dist = dist(pos.x, pos.y, otra.pos.x, otra.pos.y);
  
  if (dist > sumaRadios) return false;
  else return true;
  
  }
  
  boolean ColisionoConOtra2(Fecha otra2){
  float sumaRadios = radio + otra2.radio;
  float dist = dist(pos.x, pos.y, otra2.pos.x, otra2.pos.y);
  
  if (dist > sumaRadios) return false;
  else return true;
  
  }
  
  boolean ColisionoConOtra3(Fecha otra3){
  float sumaRadios = radio + otra3.radio;
  float dist = dist(pos.x, pos.y, otra3.pos.x, otra3.pos.y);
  
  if (dist > sumaRadios) return false;
  else return true;
  
  }
  
  boolean ColisionoConOtra4(Fecha otra4){
  float sumaRadios = radio + otra4.radio;
  float dist = dist(pos.x, pos.y, otra4.pos.x, otra4.pos.y);
  
  if (dist > sumaRadios) return false;
  else return true;
  
  }
  
}
