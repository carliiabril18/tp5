//Castellanos Carla Abril - TP5 Videojuego con Objetos
//Legajo 79555/8 - Tecnologia Multimedial 1
//Comision 3 - Prof David Bedoian
import processing.sound.*;
Juego juego;
SoundFile musicajuego;

void setup() {
  size (displayWidth, displayHeight);
  surface.setResizable(true);
  musicajuego= new SoundFile(this, "music_fondo.mp3");
  musicajuego.loop();
  juego= new Juego();
}
void draw() {
  juego.dibujo_estados();
}

void mousePressed() {
  juego.cambiarEstado();
  juego.JuegoDibujo();
}
