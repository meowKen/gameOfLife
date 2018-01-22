CA gameOfLife;

void setup(){
  size(1800,800);
  gameOfLife = new CA();
}

void draw(){
  gameOfLife.generate();
  gameOfLife.show();
}

/*void mouseClicked(){
  gameOfLife.generate();
}*/