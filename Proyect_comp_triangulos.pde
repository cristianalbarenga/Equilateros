//*** Variables ***//
int cant=30; // cantidad de elementos
PTriangulo[] ente= new PTriangulo[cant]; // array de elementos
PAux aux=new PAux();
PVector fuerza=new PVector(3,0);

void setup() {
  background(0);
  size(600, 600);
  frameRate(30);
  for(int i=0;i<cant;i++){
    ente[i]= new PTriangulo(30,random(360));
    ente[i].P_pos.x=random(width);//2;
    ente[i].P_pos.y=random(height);//2;
    
  }
}

void draw() {
    aux.fondo(0,500);
     //noStroke();
     //fill(random(255),10);
    stroke(255);
     strokeWeight(2);
     
   
   for (int i=0;i<cant;i++){  
       ente[i].vertices();  // calculo de los vertices que lo conforman
       ente[i].direccion(); // se calcula para donde debe avanzar el ente
             
       ente[i].movimiento();  

       ente[i].aplyFuerza(ente[i].orientacion); // se le da una fuerza para adelante al ente
 
     if(mousePressed){   // si se presiona el mouse se aplica la fuerza
           ente[i].aplyFuerza(fuerza);
     }
       
       ente[i].display();
      
       ente[i].limitesPantalla();
   }
}
