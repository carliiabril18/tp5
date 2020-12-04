class Boton {
  String click;
  int pos1, pos2, ancho1, alto1;

  Boton(int pos1_, int pos2_, int ancho1_, int alto1_, String click_) {
    pos1= pos1_;
    pos2= pos2_;
    ancho1= ancho1_;
    alto1= alto1_;
    click= click_;
  }

  void dibujar() {
    rectMode(CENTER);
    if ( botonPress(pos1, pos2, ancho1, alto1, click) ) {
      fill(0);
    } else {
      fill(255);
    }
    rect(pos1, pos2, ancho1, alto1 );//  
    textAlign(CENTER);
    textSize(18);
    text(click, pos1, pos2, ancho1, alto1);
  }
  boolean botonPress(int pos1_, int pos2_, int ancho1_, int alto1_, String click_) {
    pos1= pos1_;
    pos2= pos2_;
    ancho1= ancho1_;
    alto1= alto1_;
    click=click_;
    boolean presionado = mouseX>pos1 && mouseX<pos1+ancho1 && mouseY>pos2 && mouseY<pos2+alto1/2 == true;
    return presionado;
  }
}
