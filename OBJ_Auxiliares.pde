// Objetos auxiliares de pantalla y guardado de frame //

class PAux{
 //**** VARIABLES GLOBALES ****//

 //**** CONSTRUCTOR ****// 
 PAux(){
 }
 //**** FUNCIONES ****//
  //*** Guardar ***//
  void guardar(){
      saveFrame(""+"-######.png");
  }

  //*** Fondo ***//
  void fondo(color col,int alfa){
   fill(col,alfa);
   noStroke();
     rect(0,0,width,height);
   noFill();
  }

  //*** Ref Central ***//
  void centro(int a){
   noFill();
   strokeWeight(a);
     stroke(255,0,0);
       line(0,height/2,width,height/2);
     stroke(0,255,0); 
       line(width/2,0,width/2,height);
   noStroke(); 
  }

  //*** Tercios ***// 
  void tercios(int a){
   float terX=width/3; // tercio del ancho de pantalla
   float terY=height/3; // tercio del largo de pantalla
   noFill();
   strokeWeight(a);
   stroke(255,0,0); 
     // lineas ancho
     line(0, terY, width, terY);
     line(0, terY*2, width, terY*2);
   stroke(0,0,255); 
     //lineas alto
     line(terX, 0, terX, height);
     line(terX*2, 0,terX*2, height);
   noStroke();
  }
}  