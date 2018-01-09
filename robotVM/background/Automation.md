# Automation

## Notes - Industrial Automation: Hands-On, Frank  Lamb, McGraw Hill Education, 2013

Ch. 4 Machine Systems

- conveyors: "move objects or substances from one point to another".
  - belt conveyors: "two or more pulleys or rollers with a continouus loop of materialwith the conveyor belt rotating around them. One or both of the pulleys may be powered, moving the belt and the material on the belt forward".
  - roller conveyors: "usually used for moving packages with flat bottoms, like boxes. Rollers should be placed so that at least three rollers are underneath the package at any time."
  - chain and mat conveyors: "use a continuous chain that runs from one sprocket to another at each end of a frame".
  - vibrating conveyors: "used for moving bulk materials. Sometimes called shakers or shaker tables, they have a solid conveying surface with sides to contain the material being conveyed."
  - pneumatic conveyors: "use pipes or ducts to transport materials using a stream of air".
  - "*Diverters* are used to move product in a trasnverse directionto the direction of the conveyor. ... Diverters may be used to move product off the side of a conveyoronto spurs or guide product into lanes for sorting. "When guiding objects, it is important to consider the angle at which the diverter will operate." Best: 30 degrees to conveyor flow, never more than 45 degrees."
  - "*Pushers* are used to move objects at right andgles to the conveyor."
  - "*Gates and lifts* (self contained conveyors on hinges) allow passage of personnel/vehicles"
  - "*Elevators* ... move product from one conveyor level to another. 
- "*indexers* move objects a fixed distance for repetitive positioning and to avoid cumulative errors." Incl. pick and place.
- "*part feeders* supply components... [and] often serve as a buffer and part orientation device."
  - *vibratory bowls*
  - *step and rotary feeders*
  - *escapements and parts handling*. "A good rule of thumb is once you have control of randomized parts through orientation and singulation, you should never relinquish it." p177

Robots - ISO 8373 - "*industrial robot* is an 'automatically controlled, reprogrammable, multipurpose manipulator programmable in three or more axes'. In industry, the term *robotics* can be defined as the design and use of robot systems for manufacturing."

- *articulated robots* (aka robot arm): typically 3 to 6 joints "arranged in a 'chain' so that one joint supports another farther in the chain". Degrees of freedom - independent motions that make up robot's area of operation. Joints conventionally numbered J1-Jx, with J1 nearest the base and then incrementing along the chain. J1 typically a horixontal rotate around base. Joint rotation for J1 typically <360 becuase of cables passing through J1. J2 and J3 typically in vertical plane. J4-6 typically manipuators, J6 typically a rotary to which grippers etc added.
- *SCARA robots* (eg Adept): Selective Compliant Assembly Robot Arm or Selective Compliant Articulated Robot Arm, typically 4 axis, J1-2 horizontal rotary (J1 and J2 parallel), J3 z-axis, rigidly controlled in x-y by J1-2;  J4 rotary (T-axis?) at end of J3.
- *cartesian robot* (eg Adept Python, CNC machines): linear or gantry robot.
- *parallel robot* (eg Adept Quattro): four or more linkages from central actuation point; each link constrained by others. Usually suspended above objects being manipulated.
- *payload*: carrying capacity - amount of weight a robot must be able to lift, including wieght of end effector tooling;
- *accuracy*: how closely robot moves to intended position;
- *repeatability*: how well a robot returns to same position each time
- *compliance*: measure of how much a robot moves when force exerted against it;
- *frame* or *too frame*: co-ordinate reference.
- co-ordinate systems:
  - *world*: use robot base as origin;
  - *tool*: use end of arm where tooling mounted as origin;
  - *workpiece*: point on work area tooling as origin.