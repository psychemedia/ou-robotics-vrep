# Adding Lines to a Scene

In tabletop robotics, a family of simple activities rely on using a small mobile with a download facing light sensor to exlore an environment in which one or more pieces of tape that can be detected by the light sensor are placed on the ground.

For example:

- driving a robot up to a line and then stopping when it detects it;
- driving over several pieces of differently coloured tape to generate a data log that must be interepreted to identify the separate pieces of tape and their widths;
- placing a robot in an area boxed off by tape from which it is not allowed to escape;
- following a line or closed circuit.

Such activities are well suited to simple two dimensional simulators, but we can also model them in a 3D simulator.

## Adding and Modifying Line Segments In A Scene

- add Path - segment type
-  position line: (to move individual points, select Path tool (left hand menu)), select path, select path (or path point) point then use point translate tool in top menu bar (cube with xyx arrows) to move point / shape; hide Show path line and show position on line
- Line thickness: select Path, Path shaping dialogue - > Path shaping enabled, Type: vertical segment; point size and scaling set thickness; hide *show path line*; imn Path Shaping parameters, Adjust colour then tweak Path shaping -> Ambient Diffuse settings

## Adding and Modifying Closed Circuits Within A Scene

- add Path - circle type
- draw a circle; to move individual points, select Path tool (left hand menu), select point, then use Point translate tool (top toolbar) to let you drag point around.
- line thickness as per Line Segments