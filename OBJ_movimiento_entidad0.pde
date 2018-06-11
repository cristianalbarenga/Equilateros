// se le asignan los movimientos a la entidad material

class PMov_Entidad0{
 //VARIABLES GLOBALES
 PForm_Entidad0 ente;
 float tam;
 PVector locacion=new PVector();  // posicion de la entidad
 PVector velocidad= new PVector(0,2);
 PVector aceleracion=new PVector(0,0.05);
 float ang; 
 
 //CONSTRUCTOR
 PMov_Entidad0(float t){
   ente=new PForm_Entidad0();
   tam=t;
   
   locacion.x=width/2;
   locacion.y=height/2;  
 }
  
 //FUNCIONES
 //--- SER
 void update(){
   locacion.add(velocidad);
   velocidad.add(aceleracion);
 
   if((locacion.y<0)||(locacion.y>height)){
      velocidad.y *= -1;
      aceleracion.y *= -1;
   }
  if((locacion.x<0)||(locacion.x>width)){
      velocidad.x *= -1; 
   }   
 }
  
 //---Posicion
 // se le asigna la posicion en la pantalla
 void display(){
       pushMatrix();
            translate(locacion.x,locacion.y);
            ente.display(tam); 
       popMatrix();
 }
  
}