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