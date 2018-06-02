//----- Calculos de Parametros de triangulo equilatero----//
/* se supone que uno de los lados (la base) esta apoyado 
   sobre el eje X, o sea y=0, ademas medio lado tiene 
   x positivo y medio lado x negativo, ya que el eje 
   donde se encuentra el centro y el vertice superior 
   esta sobre el eje Y, o sea x=0; */

class PTriangulo{
 //VARIABLES GLOBALES
 float lado=0; // tamaño lado del triangulo 
 float[][] vertices = new float[3][2];//[vertice][posicion x,y]
 float[] centro = new float[2]; // posicion del punto central
  
  //-------------CONSTRUCTOR  
  PTriangulo(float l){
    lado = l;
  }  
  
  //-------------FUNCIONES
  //--vertices--//
  void C_Vertices(){  //calculo de la posicion de los vertices
    //Punto Central
    centro[0] = 0;            centro[1] = lado * sqrt(3)/6;
    //Punto Superior (X,Y)
    vertices[0][0] = 0;       vertices[0][1] = lado * sqrt(3)/2;
    //Punto Izquierdo (X,Y)
    vertices[1][0] = -lado/2; vertices[1][1] = 0;
    //Punto Derecho (X,Y)
    vertices[2][0] = lado/2;  vertices[2][1] = 0;
  }
  
  //---radios---// 
  float RadioExterior(){ // circunscrito/ exterior  
      float radioCirculo= lado * sqrt(3)/3; 
    return radioCirculo;
  }
  
  float RadioInterior(){ // inscrito/ interior
      float radioCirculo = lado * sqrt(3)/6; 
    return radioCirculo;
  }
  
  //---area---// 
  //cálculo del area del triangulo  
  float Area(){
      float  area= sq(lado)*sqrt(3)/4; 
    return area;  
  }
  
  //---rectas---//
  /* calculo ecuacion de la recta que forman los lados izq y der. 
  Las ecuaciones seran similares, solo cambiará el signo de la pendiente, 
  siendo positiva del lado izq y negativa del der. Esto se calcula para 
  saber que valor tendrá Y en cada valor de X, o sea limite de altura maximo*/
  float AltoSegunX(float x){
      //calculo de la pendiente m= (y2-y1)/(x2-x1);--->(x1,y1)Pto Superior; (x2,y2) Pto Izq
      float m=(vertices[1][1]-vertices[0][1])/(vertices[1][0]-vertices[0][0]);
      //pendiente de recta valor similar para ambos lados... lado der=> -m, lado izq=> m
      //  y-y1= m(x-x1);---> y= m.(x-x1)+y1;---> y= m.x+(y1-m.x1) // es la forma y= m*x+b 
      if (x>0){m= m*-1;} // si x mayor a 0 entonces se le cambia el signo  
      float y= m*x + (vertices[0][1] - m * vertices[0][0] );
    return y;
  }
  
  /* Se calcula el ancho que tendrá el triangulo segun 
  la posicion en su altura donde nos encontremos, devulve limite izquierdo y derecho*/
  float[] AnchoSegunY(float y){
      float[] x= new float[2];
      //calculo de la pendiente m= (y2-y1)/(x2-x1);--->(x1,y1)Pto Superior; (x2,y2) Pto Izq
      float m=(vertices[1][1]-vertices[0][1])/(vertices[1][0]-vertices[0][0]);
    
      //  y-y1= m(x-x1);---> (y-y1)/m = x-x1;---> x= (y-y1)/m + x1 
      x[0]= ((y - vertices[0][1]) / (-m)) + vertices[0][0]; //lado izquierdo
      x[1]= -x[0];
    return x;
  }
}