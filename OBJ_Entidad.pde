class PTriangulo{
 //**** VARIABLES GLOBALES ****//
 float size; // tamaño lado del triangulo 
 
 PVector P_sup= new PVector();  // vertice superior : siempre será el frente
 PVector P_izq= new PVector();  // vertice izquierdo
 PVector P_der= new PVector();  // vertice derecho
 
 PVector P_cero= new PVector(0,0); // vector nulo
 PVector direccion= new PVector(); // copia de direccion del vertice sup
  
 PVector P_pos= new PVector(); //posicion del centro del triangulo
 PVector velocidad= new PVector();
 PVector aceleracion= new PVector(0.17,0.13);
 
 int vel_Max= 10; // velocidad maxima que adquiere la entidad
 
 //**** CONSTRUCTOR ****// 
  PTriangulo(float t){
    size = t;
  }  
  
  //**** FUNCIONES ****//
  //--vertices--//
  /* se calculan los vertices del triangulo equilatero 
     a partir del centro en (0,0) */
  void vertices(){
    P_sup.x= 0;    //define pos x del vertice superior
    P_sup.y= size; //define pos y del vertice superior = tamaño 
    P_sup.rotate((mouseX));    
   
    // vector pto izq = suma del vector nulo + vector sup
    // posse los mismos valores que el vector superior
    P_izq= PVector.add(P_cero,P_sup);  //se suman los vectores 
    P_izq.rotate(TWO_PI/3); // se rota 120°
    
    // idem para el vertice de la derecha
    P_der= PVector.add(P_cero,P_sup); 
    P_der.rotate(-TWO_PI/3); // se rota -120°
  }

  //---Forma---// crea la forma del triangulo
  void forma(){
    pushMatrix();
    translate(P_pos.x,P_pos.y);  //posicion del punto central
      //centrales
    //  line(0, 0, ente.P_sup.x, ente.P_sup.y);
      line(0, 0, ente.P_izq.x, ente.P_izq.y);
      line(0, 0, ente.P_der.x, ente.P_der.y);
      //perimetrales
      line(ente.P_sup.x, ente.P_sup.y, ente.P_izq.x, ente.P_izq.y);
      line(ente.P_sup.x, ente.P_sup.y, ente.P_der.x, ente.P_der.y);
      line(ente.P_der.x, ente.P_der.y, ente.P_izq.x, ente.P_izq.y);
    popMatrix();   
  }
  //---Movimiento---//
  void movimiento(){
    P_pos.add(velocidad);      // a la posicion se le agrega una velocidad
    
    direccion= PVector.add(P_cero,P_sup); //se crea vector direc copiando el vector vertice sup
    direccion.setMag(0.1); // se le asigna una magnitud a vector direccion para usarlo en aceleracion
    
    aceleracion.add(direccion); // se copia direccion, aceleracion era cero
    
    velocidad.add(aceleracion);   //se le agrega una aceleracion a la velocidad
    velocidad.limit(vel_Max); // limita la velocidad a 10
    eval_limites();
  }
  
 //evaluacion limites
  void eval_limites(){
    if((P_pos.x<0)||(P_pos.x>width)){
      velocidad.x *= -1; 
      aceleracion.x *= -1;
    }
    
    if((P_pos.y<0)||(P_pos.y>height)){
      velocidad.y *= -1;        
      aceleracion.y *= -1;
    }    
  }
  //---Display---// muestra en pantalla
  void display(){
    forma(); 
  }
}