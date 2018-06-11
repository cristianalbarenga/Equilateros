// se le da la forma mateiral a la entidad

class PForm_Entidad0{
  ////// VARIABLES GLOBALES
  PTriangulo tri; 
    
  /////// CONSTRUCTOR
  PForm_Entidad0(){
    tri= new PTriangulo(0);
  }  
  
  //////// FUNCIONES
  //---Display---//
  //muestra en pantalla la forma
  void display(float t){
    tri.lado=t;  // determina el tamaño
    tri.C_Vertices(); // calcula la forma segun el tamaño
    
      stroke(250); //estilo gráfico, color linea, grosor, sin relleno
      strokeWeight(tri.lado/20);
      noFill();

    cuerpo();
    //cola();
    interior();
    
      noStroke();
  }
  
  //--Cuerpo--//
  //triangulo que forma el cuerpo
  void cuerpo(){ 
      
      pushMatrix();
        translate(0,-tri.centro[1]); // desplaza la forma hasta su centro que será el punto pivote
          beginShape();  //crea la forma con los vertices del triangulo
            vertex(tri.vertices[0][0],tri.vertices[0][1]);
            vertex(tri.vertices[1][0],tri.vertices[1][1]);
            vertex(tri.vertices[2][0],tri.vertices[2][1]);
          endShape(CLOSE); // cierra la forma triangular
      popMatrix();
     }
  //---Colita
  void cola(){
      beginShape();
        curveVertex(0,tri.vertices[0][1]); //c1
        curveVertex(0,0);
        for (int i=1;i<5;i++){
          float x=sin(frameCount*i*i)*tri.centro[1];
          float y=-i*tri.lado/2;
          curveVertex(x,y);
          if(i>2 && i<4){ellipse(x,y,10,10);}
        }
      endShape();  
  }
  
  //---Interior
  //forma en el interior del triangulo
  // circulo inscrito
  void interior(){
         ellipse(0,0,tri.RadioInterior()*2,tri.RadioInterior()*2);
  }
}