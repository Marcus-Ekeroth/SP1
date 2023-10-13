class Ball {
  float ballX;
  float ballY;
  int ballWidth;
  int ballHeight;
  float ballXspeed = 2;
  float ballYspeed = 3;
  PlayerPlat platform;
  Blocks[] blocks = new Blocks[10];

  Ball(float ballX, float ballY, int ballWidth, int ballHeight) {
    this.ballX = ballX;
    this.ballY = ballY;
    this.ballWidth = ballWidth;
    this.ballHeight = ballHeight;
  }
  void ballStart(PlayerPlat plat) { //Method to have the ball follow the platform at the start of the game
    fill(0);
    ellipse(plat.platX + plat.platWidth/2, plat.platY - plat.platHeight/3, ballWidth, ballHeight);
  }
  void ballMove() { //Method to make the ball move
    ballX += ballXspeed;
    ballY -= ballYspeed;
    fill(0);
    ellipse(ballX, ballY, ballWidth, ballHeight);
  }
  void ballBounce() { //Method to make the ball bounce off left, right and top walls
    if (ballX >= width - 10 || ballX <= 0 + 10) {
      ballXspeed = ballXspeed * -1.0;
    }
    if (ballY <= 0.0 + 10) {
      ballYspeed = ballYspeed * -1.0;
    }
  }
  void ballPlatBounce(PlayerPlat platform) { //Method to make the ball bounce off the player's moveable platform
    if (ballX > platform.platX + platform.platWidth * 1/3 && ballX < platform.platX + platform.platWidth * 2/3 && ballY + 10 > platform.platY) { //Bounce off the middle of the platform while increasing Y speed and decreasing X speed
      ballYspeed = ballYspeed * -1.75;
      ballXspeed = ballXspeed * 0.75;
    }
    if (ballX > platform.platX && ballX < platform.platX + platform.platWidth * 1/3 && ballY + 10 > platform.platY) { //Bounce off the left side of the platform while increasing the speed of X and decreasing the speed of Y

      ballYspeed = ballYspeed * -0.75;
      ballXspeed = abs(ballXspeed) * - 2;
    }
    if (ballX > platform.platX + platform.platWidth * 2/3 && ballX < platform.platX + platform.platWidth * 3/3 && ballY + 10 > platform.platY) { //Bounce off the right side of the platform while increasing the speed of X and decreasing the speed of Y

      ballYspeed = ballYspeed * -0.75;
      ballXspeed = abs(ballXspeed) * 2;
    }
  }

  boolean gameOver(PlayerPlat platform) { //Method to make the player lose if the ball gets too low
    if (ballY > platform.platY + 40) {
      textSize(50);
      text("You lose!", width/3, height/2);
      return true;
    } else {
      return false;
    }
  }
}
