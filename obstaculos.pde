class Obstaculos {
  PImage star, hate;
  float posx, posy, direccion, vel; 
  float t, ft;
  boolean vida;

  Obstaculos() {
    t = 90;
    ft = 90;
    vel = random(t/2, width-t/2);
    posx = random(t/2, width-t/2);
    posy = random(-height/4, -t/2);
    direccion = random(2, 5);
    vida = false;
    star=loadImage("star1.png");
    hate=loadImage("hate.png");
  }  

  void dibujarEstrella() {
    if (!vida) {
      image(star, posx, posy, t, t);
    } else {
      posy = height;
      direccion = 0;
    }
  }

  void dibujarEmoji() {
    if (!vida) {
      image(hate, vel, posy, t, t);
    } else {
      posy = height; 
      direccion = 0;
    }
  }

  void mover() {
    if (posy>height) {   
      posy = random(-height/4, -t/2);
    }
    posy+= direccion;
  }

  void reventar() {
    vida = true;
  }
}
