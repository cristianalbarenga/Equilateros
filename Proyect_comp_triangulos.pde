int cant=120;

PTriangulo[] tri=new PTriangulo[cant];
int[][] pos= new int[cant][2];
int[] rot=new int[cant];
int[] ang=new int[cant];

void setup() {
  background(0);
  size(600, 600);
  frameRate(30);
  smooth();
  ellipseMode(CENTER);
  
  for (int i=0;i<cant;i++){
    tri[i]= new PTriangulo((int)random(20,50)); // crea objeto y define el tamaño 
    pos[i][0]=width/2; // posicion de cada objeto
    pos[i][1]=height/2;
    if (random(1)<0.5){rot[i]=-1;} else {rot[i]=1;} // sentido de giro
    ang[i]=(int)random(360); // angulo de arranque (orientacion)
  }
}

void draw() {
   fondo();
  //ref_Cent(); 
  for (int i=0;i<cant;i++){
    tri[i].C_Vertices(); 
    pushMatrix();
      translate(pos[i][0],pos[i][1]);
      rotate(radians((frameCount+ang[i])*rot[i]));
        figura(tri[i].centro[1],i); // punto de rotacion, objeto
    popMatrix();
  }
 
  for (int i=0;i<cant;i++){  // actualiza la posicion
   float s=tri[i].lado/2;
   float dist=map(mouseY,0,height,0,s);
   pos[i][0]=pos[i][0]+(int)random(-dist,dist);
   pos[i][1]=pos[i][1]+(int)random(-dist,dist);
   }
}
  
  
// figura que se dibuja en pantalla  
void figura(float y,int i){ //desplazamiento en y, i= numero de objeto
   pushMatrix();
   
     translate(0,-y); // se desplaza sobre el eje y
      float choice=random(1);
      color c;
      if(choice<0.5){ c= color(0); }
        else{ c= color(255);}
      float alfa=map(mouseX,0,width,0,255);
      stroke(255,alfa);
      strokeWeight(2);
      noFill();
        beginShape(); // dibujo de la forma
          vertex(tri[i].vertices[0][0],tri[i].vertices[0][1]);
          vertex(tri[i].vertices[1][0],tri[i].vertices[1][1]);
          vertex(tri[i].vertices[2][0],tri[i].vertices[2][1]);
        endShape(CLOSE); 
  popMatrix();
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
