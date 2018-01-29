class Holder{
  CA gameOfLife;
  float rw = 100;
  float rh = 60;
  float tw = rw-20;
  float th = rh-10;
  
  Holder(){
    gameOfLife = new CA();
  }
  
  void run(){
    gameOfLife.generate();
    gameOfLife.show();
  }
  
  void show(){
    gameOfLife.show();
  }
  
  void demo(boolean _OVER){
    gameOfLife.generate();
    gameOfLife.setCellsColor(color(47), color(65));
    gameOfLife.show();
    if(_OVER){
      fill(215);
      stroke(51,153,255);
      rect(width/2-rw/2, height/2-rh/2, rw, rh );
    } else {
      fill(180);
      stroke(51,51,255);
      rect(width/2-rw/2, height/2-rh/2, rw, rh );
    }
    fill(47);
    textSize(20);
    text("RUN", width/2, height/2);
    fill(200,50,50);
    text("press the button to run an empty sketch",  width/8, height/2 + 100);
    text("press '+' or '-' to change the delay between generation (speed)",  width/8, height/2 + 125);
    text("press 'ENTER' or 'BACKSPACE' to run or pause the simulation",  width/8, height/2 + 150);
    text("press 's' to step into the next generation",  width/8, height/2 + 175);
    text("press 'r' to reset the canvas",  width/8, height/2 + 200);
    text("press 'a' to randomize the canvas",  width/8, height/2 + 225);
    text("press 'b' to come back here (to the menu)",  width/8, height/2 + 250);
    
  }
  
  void editGridClick(float _X, float _Y){
    gameOfLife.setCellLive(_X, _Y);
  }
  
  void dieAll(){
    gameOfLife.reset(false);
  }
  
  void randomAll(){
    gameOfLife.reset(true);
  }
 
  
};