class Blocks { //Class for blocks the player needs to hit with the ball
  int blockX;
  int blockY;
  int blockHeight;
  int blockWidth;
  boolean blockHit = false;
  int hit = 0;

  Blocks(int blockX, int blockY, int blockWidth, int blockHeight) { //Blocks constructor
    this.blockX = blockX;
    this.blockY = blockY;
    this.blockHeight = blockHeight;
    this. blockWidth = blockWidth;
  }
  void blockBounce(Ball ball, int counter) { //Method to make the ball bounce off the blocks
    if (ball.ballX > counter + blockX && ball.ballX < counter + blockX + blockWidth && ball.ballY > blockY - 10) { // Bounce off top of block
      ball.ballYspeed = ball.ballYspeed * -1;
      this.blockHit = true;
    }
    if (ball.ballX > counter + blockX && ball.ballX < counter + blockX + blockWidth && ball.ballY > blockY + blockHeight + 10) { //Bounce off bottom of block
      ball.ballYspeed = ball.ballYspeed * -1;
      this.blockHit = true;
    }
    if (ball.ballX + 10 >  blockX + counter && ball.ballY > blockY && ball.ballY < blockY + blockHeight) { //Bounce off left side of block
      ball.ballXspeed = ball.ballXspeed * -1.0;
      this.blockHit = true;
    }
    if (ball.ballX - 10 >  blockX + blockWidth + counter && ball.ballY > blockY && ball.ballY < blockY + blockHeight) { //Bounce off right side of block
      ball.ballXspeed = ball.ballXspeed  * -1.0;
      this.blockHit = true;
    }
  }
  //NOTE: i was going to use the following method as a way to teleport the blocks far out of bounds once they are hit, seemingly making them disappear
  /*void blockRemove(){
   if(this.blockHit){
   this.hit = -3000;
   }
   }*/
}
