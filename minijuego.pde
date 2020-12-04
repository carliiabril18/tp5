class Juego {

  int vidas;
  int puntos;
  PImage Escenario;
  Boton boton1, boton2, boton3, boton4;
  Obstaculos [] stars;
  Obstaculos [] hates;
  int cant_stars, cant_hates;
  PantallasJuego pantallas;
  String estado;

  Juego() {
    Escenario= loadImage("stage_game.jpg");
    puntos= 0;
    vidas= 5;
    cant_stars= 10;
    cant_hates= 10;

    pantallas= new PantallasJuego();

    stars = new Obstaculos[cant_stars];
    for (int e=0; e<cant_stars; e++ ) {
      stars[e] = new Obstaculos();
    }
    hates= new Obstaculos[cant_hates];
    for (int o=0; o<cant_hates; o++) {
      hates[o] = new Obstaculos();
    }

    boton1= new Boton(width/2, 650, 160, 40, "¿Como Jugar?");
    boton2= new Boton(width/2, 650, 160, 40, "Empezar a Jugar");
    boton3= new Boton(800, 800, 160, 40, "Ir al Inicio");
    boton4= new Boton(800, 800, 160, 40, "Volver a Jugar");

    estado="inicio";
  }

  void dibujo_estados() {
    if (estado.equals("inicio")) {
      pantallas.dibujarinicio();
      boton1.dibujar();
    }
    if (estado.equals("tutorial")) {
      pantallas.dibujartutorial();
      boton2.dibujar();
    }
    if (estado.equals("juego")) {
      JuegoDibujo();
    }
    if (estado.equals("ganaste")) {
      pantallas.dibujarvictoria();
    }
    if (estado.equals("perdiste")) {
      pantallas.dibujarderrota();
    }
    if (puntos==10 || puntos>10 && estado.equals("juego")) {
      estado="ganaste";
    }
    if (vidas==0 || vidas<0 && estado.equals("juego")) {
      estado="perdiste";
    }
  }
  void JuegoDibujo() {
    for (int e=0; e<cant_stars; e++) {
      stars[e].dibujarEstrella();
    }
    for (int o=0; o<cant_hates; o++) {
      hates[o].dibujarEmoji();
    }
    VidaMenos();
    SumaPuntos();

    fill(0);
    textSize(30);
    text("Puntaje: "+ puntos, 100, 40);
    text ("Vidas: " + vidas, 100, 100);
  }
  void SumaPuntos(){
    for(int s=0; s<cant_stars; s++){
      boolean toque= mouseX>stars[s].posx && mouseX<stars[s].posx+stars[s].ft &&
      mouseY>stars[s].posy && mouseY<stars[s].posy+stars[s].ft/2;
      if (toque){
        puntos++;
        stars[s].reventar();
      }
    }
  }
  void VidaMenos(){
    for(int h=0; h<cant_hates; h++){
      boolean toque= mouseX>hates[h].vel && mouseX<hates[h].vel+hates[h].ft &&
      mouseY>hates[h].posy && mouseY<hates[h].posy+hates[h].ft/2;
      if(toque){
        vidas--;
        hates[h].reventar();
      }
    }
  }
  void cambiarEstado(){
    if (boton1.botonPress(width/2, 650, 160, 40, "¿Como Jugar?")&& estado.equals("inicio")) {
      estado= "tutorial";
    } else if (boton2.botonPress(width/2, 650, 160, 40, "Empezar a Jugar")&& estado.equals("tutorial")) {
      estado="juego";
    } else if (boton3.botonPress(width/2, 650, 160, 40, "Ir al Inicio")&& estado.equals("ganaste")) {
      estado="inicio";
    } else if (boton4.botonPress(width/2, 650, 160, 40, "Volver a Jugar")&& estado.equals("perdiste")) {
      juego= new Juego();
    }
  }
}
