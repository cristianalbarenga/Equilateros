class PTriangulo{
 //**** VARIABLES GLOBALES ****//
 float size; // tamaño lado del triangulo 
 float ang;
 
 PVector 
 P_sup= new PVector(),  // vertice superior : siempre será el frente
 P_izq= new PVector(),  // vertice izquierdo
 P_der= new PVector();  // vertice derecho
 
 PVector P_cero= new PVector(0,0); // vector nulo
  
 PVector 
 P_pos= new PVector(), //posicion del centro del triangulo (pivote)
 orientacion= new PVector(), // copia direccion del vertice sup, para darle orientacion
 velocidad= new PVector(),
 aceleracion= new PVector();
 
 int vel_Max= 10; // velocidad maxima que adquiere la entidad
 
 //**** CONSTRUCTOR ****// 
  PTriangulo(float t,float a){
    size = t;
    ang= a;
  }  
  
  //**** FUNCIONES ****//
  //--vertices--//
  /* se calculan los vertices del triangulo equilatero 
     a partir del centro en (0,0) */
  void vertices(){
    P_sup.x= 0;    //define pos x del vertice superior
    P_sup.y= size; //define pos y del vertice superior = tamaño 
    P_sup.rotate(radians(ang+ mouseX)); // rotacion del vector sup   
   
    // vector pto izq = suma del vector nulo + vector sup
    // posse los mismos valores que el vector superior
    P_izq= P_sup.copy();  //se copia el vector sup 
    P_izq.rotate(TWO_PI/3); // se rota 120°
    
    // idem para el vertice de la derecha
    P_der= P_sup.copy(); // se copia el vector superior
    P_der.rotate(-TWO_PI/3); // se rota -120°
  }

  //---Forma---// crea la forma del triangulo
  void forma(){
    pushMatrix();
    translate(P_pos.x,P_pos.y);  //posicion del punto central
      //centrales
      //  line(0, 0, ente.P_sup.x, ente.P_sup.y);
      line(0, 0, P_izq.x, P_izq.y);
      line(0, 0, P_der.x, P_der.y);
      //perimetrales
      line(P_sup.x, P_sup.y, P_izq.x, P_izq.y);
      line(P_sup.x, P_sup.y, P_der.x, P_der.y);
      line(P_der.x, P_der.y, P_izq.x, P_izq.y);
    popMatrix();   
  }
  
  //---Direccion---//
  calcula el vector orientacion frontal (para donde se mueve el ente)
  void direccion(){
        orientacion= P_sup.copy(); //la orientacion esta dada por el punto superior
        orientacion.setMag(1); //se normaliza el vector (magnitud 1)
  }
   
  //---Movimiento---//
  void movimiento(){
      velocidad.add(aceleracion);   //le agrega la aceleracion a velocidad
      velocidad.limit(vel_Max); // limita la velocidad 
      P_pos.add(velocidad);  // a la posicion se le suma la velocidad
      aceleracion.mult(0);
  }
  
 //---Fuerza Externa---// se aplica una fuerza que le da un movimiento
  void aplyFuerza(PVector fuerza){
     aceleracion.add(fuerza); 
  }
  
 //---evaluacion limites----//
 /* evalua los limites de la pantalla e invierte 
   la velocidad y aceleracion al llegar a esta*/
  void limitesPantalla(){
    float limX_der=width - P_sup.x;
    float limX_izq=0 - P_sup.x;
    float limY_sup=0 - P_sup.y; 
    float limY_inf=height - P_sup.y;
    
    if((P_pos.x < limX_izq)||(P_pos.x > limX_der)){
      velocidad.x *= -1; 
       if(P_pos.x < limX_izq) {P_pos.x= limX_izq;}
       if(P_pos.x > limX_der) {P_pos.x= limX_der;}
    }
  
    if((P_pos.y < limY_sup )||(P_pos.y > limY_inf)){
      velocidad.y *= -1;
      if(P_pos.y < limY_sup) {P_pos.y= limY_sup;}
      if(P_pos.y > limY_inf) {P_pos.y= limY_inf;}
    }    
  }
 
  //---Display---// muestra en pantalla la forma
  void display(){
    forma(); 
  }
}
