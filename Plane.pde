////////////////////////Plane class///////////////////////////////////////////
class Plane{
  final PVector planePos = new PVector();    //plane corrdinate position
  final PVector planeSpeed = new PVector();  //plane speed ->determine plane position
  final static float planeVel = 4;           //plane velocity
  final static int bulletVel = 5;            //bullet velocity
  final static int image_h = 80, image_w = 50;  //plane size
  public int score=0;
  boolean removePlane;
  
  void screenBound(){
    //declare plane position
    planePos.add(planeSpeed);
    
    //plane cannot go through the edge of screen 
    if(planePos.x > width-image_w)   planePos.x = width-image_w; //left&right side
    else if(planePos.x < 0)  planePos.x = 0;                     //left&right side
    
    if(planePos.y > height-image_h)  planePos.y = height-image_h; //top&bottom side
    else if(planePos.y < 0)  planePos.y = 0;                      //top&bottom side
  }
  
  //create plane by loading image object
  void createPlane(){
    //score
    textFont(fontBold);   
    fill(150);    text("Score:", width-125, 20);
    fill(255);    text(score, width-75, 20);
    
    //load rocket image
    image(rocket, planePos.x-25, planePos.y, image_w,image_h);
  }
   
  void shoot(){
    final int bulletDens = 2;   //bullet density 
    if(mousePressed && frameCount % bulletDens == 0) plane.addBullet();
  }
  
  void addBullet(){
    final PVector bulletSpeed = new PVector();
    
    bulletSpeed.set(planePos.x,(planePos.y)-0.5,0); //move up
    bulletSpeed.sub(planePos);
    bulletSpeed.normalize();
    bulletSpeed.mult(bulletVel);
    bullets.add(new Bullet(planePos, bulletSpeed));
  }
}//end of Plane class