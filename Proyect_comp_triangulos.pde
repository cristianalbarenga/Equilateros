//*** Variables ***//
int cant=10; // cantidad de elementos
PTriangulo[] ente= new PTriangulo[cant]; // array de elementos
PAux aux= new PAux();

void setup() {
  background(0);
  size(600, 600);
  frameRate(30);
  for(int i=0;i<cant;i++){
    ente[i]= new PTriangulo(random(20,50),random(360));
    ente[i].P_pos.x=width/2;
    ente[i].P_pos.y=height/2;
  }
}

void draw() {
   aux.fondo(0,80);
     stroke(255);
     strokeWeight(1);
   for (int i=0;i<cant;i++){  
     ente[i].vertices();
     ente[i].movimiento();
     ente[i].display();
   }
}
