//*** Variables ***//
int cant=10; // cantidad de elementos
PTriangulo[] ente= new PTriangulo[cant]; // array de elementos

void setup() {
  background(0);
  size(600, 600);
  frameRate(30);
  for(int i=0;i<cant;i++){
    ente[i]= new PTriangulo(random(20,50),random(360)); // creacion de elementos
    ente[i].P_pos.x=width/2; //posicion inicial X
    ente[i].P_pos.y=height/2; //posicion inicial Y
  }
}

void draw() {
   fondo(0,255);
     stroke(255);
     strokeWeight(1);
   for (int i=0;i<cant;i++){  
     ente[i].vertices();
     ente[i].movimiento();
     ente[i].display();
   }
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
