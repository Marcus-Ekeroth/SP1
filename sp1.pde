int counter = 0; //Counter variables to increment the x-value of blocks, helping them appear in a line
int counter2 = 0;
int counter3 = 0;
int counter4 = 0;
Blocks[] block1 = new Blocks[10]; //Instantiating block arrays
Blocks[] block2 = new Blocks[10];
Blocks[] block3 = new Blocks[10];
Blocks[] block4 = new Blocks[10];
PlayerPlat plat1 = new PlayerPlat(-500, 500, 100, 30); //Instantiating platform object
Ball ball1 = new Ball(plat1.platX + plat1.platWidth/2, plat1.platY - plat1.platHeight/3, 20, 20); //Instantiating the ball object
boolean start = true; //Boolean to check whether the game is in the starting phase


void setup() {
  size(600, 600);
  background(255);
}

void draw() {
  background(255);
  plat1.platMove(plat1); //Make the platform moveable by the player
  for (int i = 0; i < block1.length; i++) { //The following for-loops instantiate block objects and draw them
    block1[i] = new Blocks(counter + 40, 50, 50, 20);
    fill(0);
    rect(counter + block1[i].blockX, block1[i].blockY, block1[i].blockWidth, block1[i].blockHeight);
    counter = (width/23)*i;
    block1[i].blockBounce(ball1, counter); //Make the ball bounce off this row of blocks
  }
  for (int i = 0; i < block1.length; i++) {
    block2[i] = new Blocks(counter2 + 40, 100, 50, 20);
    fill(0);
    rect(counter2 + block2[i].blockX, block2[i].blockY, block2[i].blockWidth, block2[i].blockHeight);
    counter2 = (width/23)*i;
    block2[i].blockBounce(ball1, counter2);
  }
  for (int i = 0; i < block1.length; i++) {
    block3[i] = new Blocks(counter3 + 40, 150, 50, 20);
    fill(0);
    rect(counter3 + block3[i].blockX, block3[i].blockY, block3[i].blockWidth, block3[i].blockHeight);
    counter3 = (width/23)*i;
    block3[i].blockBounce(ball1, counter3);
  }
  for (int i = 0; i < block1.length; i++) {
    block4[i] = new Blocks(counter4 + 40, 200, 50, 20);
    fill(0);
    rect(counter4 + block4[i].blockX, block4[i].blockY, block4[i].blockWidth, block4[i].blockHeight);
    counter4 = (width/23)*i;
    block4[i].blockBounce(ball1, counter4);
  }
  if (start) { //Start the game by clicking the mouse while having the platform in the desired location
    ball1.ballStart(plat1);
    if (mousePressed) {
      start = false;
      ball1.ballX = mouseX;
    }
  }

  if (!start) {
    ball1.ballXspeed = constrain(ball1.ballXspeed, -4, 4); //Constraining the ball's speed to prevent it from going too fast
    ball1.ballYspeed = constrain(ball1.ballYspeed, -3, 3);
    ball1.ballBounce(); //Make the ball bounce off the walls
    ball1.ballPlatBounce(plat1); //Make the ball bounce off the platform
    ball1.ballMove(); //Make the ball move
    if (ball1.gameOver(plat1)) { //End the game if the ball descends below the platform
      ball1.gameOver(plat1);
      noLoop();
    }
  }
  //NOTE: The game has a major flaw; I could not find a way to actually make each indidual block disappear once hit. I tried a number of different methods, but none seemed to quite work the way i wanted them to.
}
