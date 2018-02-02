CA gameOfLife;
Holder context;
float rw = 100;
float rh = 60;
boolean menu;
boolean edit;
boolean startBtnOver = false;
boolean running = false;
boolean toClean = false;
boolean step = false;
int cd = 0, delay = 10;

void setup(){
  size(1000,1000);
  gameOfLife = new CA();
  context = new Holder();
  menu = true;
  edit = false;
}


/**********************************/
        //draw() function :
// possible states of function
//  _1_ Menu
//  _2_ Edit
//    _2.1_ Edit && toClean
//    _2.1_ Edit && step
//  _3_ Running
/**********************************/
void draw(){
  if(cd == delay){
    if(menu){
      startBtnOver = false;
      if(mouseX > width/2-rw/2 && mouseX < width/2+rw/2){
        if(mouseY > height/2-rh/2 && mouseY < height/2+rh/2){
          startBtnOver = true;
        }
      }
      context.demo(startBtnOver);
    } else {
      if(edit){
        if(toClean){
          context.dieAll();
          toClean = false;
        } else if(step){
          step = false;
          context.run();
        }
        context.show(); 
      } else {
        if(running){
          context.run();
        } 
      }
    }
    cd = 0;
  } else if(cd>delay){
    cd = 0;
  } else {  
    cd++;
  }  
  println(delay);
 
}

/**************************/
// mouseClicked() function : execute once when the mouse is clicked
// allow the program to know IF : 
//  should or shouldn't end demo mode and go to edit mode 
//  OR add a living cell under the mouse cursor 
/**************************/
void mouseClicked(){
  if(startBtnOver){
    menu = false;
    edit = true;
    context.dieAll();
    startBtnOver = false;
  } else {
    if(edit){
      context.editGridClick(mouseX, mouseY);
    }
  }
}

/*************************/
// the keyboard controls of the application
/*************************/
void keyPressed(){
  toClean = false;
  if(key == BACKSPACE || key == ENTER){   //variable named 'key' stores the LAST input code
    if(edit){
      edit = false;
      running = true;
    } else {
      edit = true;
      running = false;
    }
  } else if (key == 'r'){
    toClean = true;
  } else if (key == 'b'){
    menu = true;
    context.randomAll();
  } else if (key == 's'){
    step = true;
  } else if (key == '+' && delay > 1){
    delay--;
  } else if (key == '-' && delay < 24){
    delay++;
  } else if (key == 'a'){
    context.randomAll();
  }
  
}
