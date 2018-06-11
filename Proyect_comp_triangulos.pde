PMov_Entidad0 ente;

///------------------ setup
void setup() {
  background(0);
  size(600, 600);
  frameRate(30);
  ente= new PMov_Entidad0(50);
}
///----------------- dibujo
void draw() {
  fondo();
  ente.display();
  ente.update();
}
////-----------------guardar
void salvar(){
  saveFrame("line-######.png");
}

///----------------- lineas que marcan el centro
void ref_Cent(){
 noFill();
   stroke(255,0,0);
   line(0,height/2,width,height/2);
   stroke(0,255,0); 
   line(width/2,0,width/2,height);
 noStroke(); 
}

///---------------- fondo
void fondo(){
 fill(0);
 noStroke();
 rect(0,0,width,height);
}
