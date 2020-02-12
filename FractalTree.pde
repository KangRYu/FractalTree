private double fractionLength = .8; 
private double smallestBranch = 10; 
private double branchAngle = .2;  

private double currentSmallestBranch = 100;
private double growthRate = 1.1;

public void setup() {   
	size(640,480);    
} 


public void draw() {   
	background(0);   
	stroke(0,255,0);   
	line(320,480,320,380);   
	drawBranches(320, 380, 100, 3 * PI/2);
  
  if(currentSmallestBranch > smallestBranch) {
    currentSmallestBranch /= 1.1;
  }
  else {
    noLoop();
  }
} 


public void drawBranches(int x,int y, double branchLength, double angle) {   
    double angle1, angle2;
    angle1 = angle + branchAngle;
    angle2 = angle - branchAngle;

    branchLength *= fractionLength;

    int endX1, endY1, endX2, endY2;
    endX1 = (int)(branchLength*Math.cos(angle1) + x);
    endY1 = (int)(branchLength*Math.sin(angle1) + y);
    endX2 = (int)(branchLength*Math.cos(angle2) + x);
    endY2 = (int)(branchLength*Math.sin(angle2) + y);
    
    line(x, y, endX1, endY1);
    line(x, y, endX2, endY2);

    if(branchLength > currentSmallestBranch) {
        drawBranches(endX1, endY1, branchLength, angle1);
        drawBranches(endX2, endY2, branchLength, angle2);
    }
}    
