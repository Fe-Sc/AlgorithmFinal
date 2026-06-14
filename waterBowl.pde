class system {
  float mass;
  float force;
  float damping;
  float velocity;
  float acceleration;
  float displacement;
  float springConstant;
  PVector position;


  system(float mass, float springConstant, float damping, PVector position) {
    this.mass = mass;
    this.springConstant = springConstant;
    this.damping = damping;
    this.position = position;
    force = 0;
    velocity = 0;
    displacement = 0;
  }


  void update() {
    
    float restoringForce = -springConstant * displacement; //f = -k*x (x is displacement)
    force += restoringForce; //total force  
    acceleration = force / mass; // a = f/m
    velocity += acceleration;
    
    velocity *= damping; //applying damping
    displacement += velocity;

    force = 0; //Prevent force accumulation
  }

  void calculateNeighbourForce(float distance) {
    float neighbourForce  = distance*springConstant;
    force += neighbourForce;
  }
}
