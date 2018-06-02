int cant=120;

PTriangulo[] tri=new PTriangulo[cant];
int[][] pos= new int[cant][2];
int[] rot=new int[cant];
int[] ang=new int[cant];

int x,y;

void setup() {
  background(0);
  size(600, 600);
  frameRate(30);
  smooth();
  ellipseMode(CENTER);
  
  for (int i=0;i<cant;i++){
    tri[i]= new PTriangulo((int)random(20,200));
    pos[i][0]=(int)random(width);
    pos[i][1]=(int)random(height);
    if (random(1)<0.5){rot[i]=-1;} else {rot[i]=1;}
    ang[i]=(int)random(360);
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
  for (int i=0;i<cant;i++){
   int dist=(int)random(8);
   pos[i][0]=pos[i][0]+(int)random(-dist,dist);
   pos[i][1]=pos[i][1]+(int)random(-dist,dist);
    
  } 
}
  
  
void figura(float y,int i){ //movimiento en y, i= objeto
   pushMatrix();
     translate(0,-y);
     stroke(i*2,255,i+i);
     strokeWeight(2);
     noFill();
        beginShape();
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