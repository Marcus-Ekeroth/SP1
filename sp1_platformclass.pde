class PlayerPlat { //Class for the player's moveable platform
  int platX;
  int platY;
  int platHeight;
  int platWidth;

  PlayerPlat(int platX, int platY, int platWidth, int platHeight) { //Constructor for platform
    this.platX = platX;
    this.platY = platY;
    this.platWidth = platWidth;
    this.platHeight = platHeight;
  }
  void platDisplay(PlayerPlat plat) { //Method to display the platform

    fill(255);
    rect(plat.platX, plat.platY, plat.platWidth, plat.platHeight);
  }
  void platMove(PlayerPlat plat) { //Method to make the platform move according to mouseX

    plat.platX = mouseX - plat1.platWidth/2;
    plat.platDisplay(plat);
  }
}
