class CA{
  int gridUnit = 20;
  int wid = width, hei = height;
  Cell[][] GOL = new Cell[wid/gridUnit][hei/gridUnit]; 
  int generation = 0;

  //construct
  CA(){
    for(int i=0; i<wid/gridUnit; i++){
      for(int j=0; j<hei/gridUnit; j++){
        GOL[i][j] = new Cell();
      }    
    }
    
  }
  
  int neiMoore1(int _I, int _J){
    int nc = 0;
    for(int i=-1; i<=1; i++){
      for(int j=-1; j<=1; j++){ // allows to "wrap" the neighborhood. Ex. i = 0 is (length and 1)
      if(GOL[ (_I+i+(wid/gridUnit))%(wid/gridUnit) ][ (_J+j+(hei/gridUnit))%(hei/gridUnit) ].x == 1){
        nc++;
        }                                    
      }
    }

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
    for(int i=0; i<wid/gridUnit; i++){
      for(int j=0; j<hei/gridUnit; j++){
        int r = neiMoore1(i, j);
        //println(r);
          if(GOL[i][j].x == 0 && r == 3){
            next[i][j] = new Cell(1);
          } else if(GOL[i][j].x == 1 && (r < 2 || r > 3 )) {
            next[i][j] = new Cell(0);
          } else {
            next[i][j] = new Cell(GOL[i][j].x);
          }
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
        stroke(0);
        rect(i*gridUnit,j*gridUnit,gridUnit,gridUnit);
      }
    }
    fill(200,50,50);
    text("generation : "+generation, gridUnit+(gridUnit/6),gridUnit*2);
  }
  
  void setCellsColor(color a, color b){
    for(int i=0; i<wid/gridUnit; i++){
      for(int j=0; j<hei/gridUnit; j++){
        if(GOL[i][j].x == 1){
          GOL[i][j].c = color(a);
        } else {
          GOL[i][j].c = color(b);
        } 
      }
    }
  }
  
  void setCellLive(float _X, float _Y){
    GOL[floor(_X/gridUnit)][floor(_Y/gridUnit)].x = 1;
    GOL[floor(_X/gridUnit)][floor(_Y/gridUnit)].c = color(47);
  }
  
  //void setCellDead()
  
  void reset(boolean mode){  // mode true = random reset, mode false = all dead
    if(mode){
      for(int i=0; i<wid/gridUnit; i++){
        for(int j=0; j<hei/gridUnit; j++){
          GOL[i][j] = new Cell();
        }    
      }
    } else {
      for(int i=0; i<wid/gridUnit; i++){
        for(int j=0; j<hei/gridUnit; j++){
          GOL[i][j] = new Cell(0);
        }    
    }
    }
    generation = 0;
  }
  
};