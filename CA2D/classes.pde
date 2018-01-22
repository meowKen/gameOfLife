///METHODS

///CLASSES

class Cell{
  int x;
  color c;
  
  //construc.
  Cell(){
    x=(int)random(0,2);
    if(x == 1){
      c = color(47);
    } else {
      c = color(198);
    }
    
  }
  
  Cell(int _X){
    x=_X;
    if(x == 1){
      c = color(47);
    } else {
      c = color(198);
    }
  }
    
};

class CA{
  int gridUnit = 15;
  int wid = width, hei = height;
  Cell[][] GOL = new Cell[wid/gridUnit][hei/gridUnit]; 
  int generation = 0;

  //construct
  CA(){
    for(int i=0; i<wid/gridUnit; i++){
      for(int j=0; j<hei/gridUnit; j++){
        GOL[i][j] = new Cell();
        /*if(GOL[i][j].x == 1){
          GOL[i][j].c = color(47);
        }  else if(GOL[i][j].x == 0){
          GOL[i][j].c = color(198);
        }*/
      }    
    }
    
  }
  
  int neiMoore1(int _I, int _J){
    int nc = 0;
    for(int i=-1; i<=1; i++){
      for(int j=-1; j<=1; j++){ // allows to "wrap" the neighborhood. Ex. i = 0 is (length and 1)
      //println( (_I+i+(wid/gridUnit))%(wid/gridUnit) +" | "+ (_J+j+(hei/gridUnit))%(hei/gridUnit) +" | "+ GOL[ (_I+i+(wid/gridUnit))%(wid/gridUnit) ][ (_J+j+(hei/gridUnit))%(hei/gridUnit) ].x);
      if(GOL[ (_I+i+(wid/gridUnit))%(wid/gridUnit) ][ (_J+j+(hei/gridUnit))%(hei/gridUnit) ].x == 1){
        nc++;
        }                                    
      }
    }
   //println(nc);
   if(GOL[_I][_J].x == 1){
     nc--;
   }
    return nc;
  }
  
  void copyCA(Cell[][] _C){
    for(int i=0; i<wid/gridUnit; i++){
      for(int j=0; j<hei/gridUnit; j++){
        GOL[i][j].x = _C[i][j].x;
        GOL[i][j].c = _C[i][j].c;
       }  
    }
  }
  
  void generate(){
    Cell[][] next = new Cell[wid/gridUnit][hei/gridUnit];
    int un = 0, zero = 0, same = 0;
    for(int i=0; i<wid/gridUnit; i++){
      for(int j=0; j<hei/gridUnit; j++){
        int r = neiMoore1(i, j);
        //println(r);
          if(GOL[i][j].x == 0 && r == 3){
            next[i][j] = new Cell(1);

            zero++;
          } else if(GOL[i][j].x == 1 && (r < 2 || r > 3 )) {
            next[i][j] = new Cell(0);

            un++;
          } else {
            next[i][j] = new Cell(GOL[i][j].x);
            same++;
          }
          println(next[i][j].x+" || "+zero+" | "+un+" | "+same);
      }
    }
    copyCA(next);
    generation++;
    println("generation");
  }
  
  //draw a rect on screen for each cell
  void show(){
    for(int i=0; i<wid/gridUnit; i++){
      for(int j=0; j<hei/gridUnit; j++){
        fill(GOL[i][j].c);
        rect(i*gridUnit,j*gridUnit,gridUnit,gridUnit);
      }
    }
  }
  
};