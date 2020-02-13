private double smallestBranch = 10; 
private double branchLength = 2;
private double maxBranchLength = 100;
private double branchAngle = .2;  
private double fractionLength = .8; 


public void setup() {   
	size(640,480);    
  strokeWeight(2);
} 


public void ranStroke() { // Applies a random stroke color
  float r = (float)(Math.random() * 255);
  float g = (float)(Math.random() * 255);
  float b = (float)(Math.random() * 255);
  stroke(r, g, b);
}


boolean grow = true;


public void draw() {   
  fill(0, 0, 0, 25);
	rect(0, 0, width, height); // Redraws background   

  ranStroke(); // Draws the trunk
	line(320,480,320,380);   

	drawBranches(320, 380, branchLength, 3 * PI/2); // Calls recursive fractal
  
  if(branchLength < maxBranchLength && grow) { // Increases the size of a branch
    branchLength++;
    branchAngle*=1.005;
    if(branchLength >= maxBranchLength) {
      grow = false;
    }
  }
  else {
    branchLength--;
    branchAngle/=1.005;
    if(branchLength <= 2) {
      grow = true;
    }
  }
} 


public void drawBranches(int x,int y, double branchLength, double angle) {   
    // Calculate the angles for the two branches
    double angle1, angle2;
    angle1 = angle + branchAngle;
    angle2 = angle - branchAngle;

    branchLength *= fractionLength;

    int endX1, endY1, endX2, endY2;
    endX1 = (int)(branchLength*Math.cos(angle1) + x);
    endY1 = (int)(branchLength*Math.sin(angle1) + y);
    endX2 = (int)(branchLength*Math.cos(angle2) + x);
    endY2 = (int)(branchLength*Math.sin(angle2) + y);

    ranStroke();
    line(x, y, endX1, endY1);
    line(x, y, endX2, endY2);

    if(branchLength > smallestBranch) {
        drawBranches(endX1, endY1, branchLength, angle1);
        drawBranches(endX2, endY2, branchLength, angle2);
    }
}    
