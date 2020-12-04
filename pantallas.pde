class PantallasJuego {
  PImage inicio, introduccion, victoria, derrota, chicaportada, chicaimagen;
  

  PantallasJuego() {
    inicio= loadImage("portada.jpg");
    chicaportada= loadImage("chica3.png");
    introduccion= loadImage("fondoinstrucciones.jpg");
    chicaimagen= loadImage("chica1.png");
    victoria= loadImage("victoria.jpg");
    derrota= loadImage("derrota.jpg");
  }
  void dibujarinicio(){ //pantalla de inicio
    imageMode(CENTER);
    image (inicio, width/2, height/2, displayWidth, displayHeight);
    image (chicaportada, width/2, height/2);//
  }

  void dibujartutorial() {//pantalla tutorial
    image (introduccion,  width/2, height/2, displayWidth, displayHeight);
    image (chicaimagen, 200, 250);
  }

  void dibujarvictoria() { //pantalla ganaste
    image(victoria,  width/2, height/2, displayWidth, displayHeight);
  }
  void dibujarderrota() {//pantalla perdiste
    image(derrota, width/2, height/2, displayWidth, displayHeight);
  }
}
