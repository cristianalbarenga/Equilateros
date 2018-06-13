//*** Variables ***//
PTriangulo ente;

//*** Setup ***//
void setup() {
  background(0);
  size(600, 600);
  frameRate(30);
  ente= new PTriangulo(20);
  
  ente.P_pos.x=width/2;
  ente.P_pos.y=height/2;
}
//*** DRAW ***//
void draw() {
   fondo(0,255);
   ente.size=50;
     stroke(255);
     strokeWeight(1);
   
   ente.vertices();
   ente.movimiento();
   
   ente.display();
}


//*** Guardar ***//
void salvar(){
  saveFrame("entidad0_v0.2-######.png");
}

//*** Ref Central ***//
void centro(){
 noFill();
   stroke(255,0,0);
   line(0,height/2,width,height/2);
   stroke(0,255,0); 
   line(width/2,0,width/2,height);
 noStroke(); 
}

//*** Fondo ***//
void fondo(int gris,int alfa){
 fill(gris,alfa);
 noStroke();
 rect(0,0,width,height);
}
