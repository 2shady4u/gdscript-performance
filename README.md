gdscript-performance

Contains two simple Godot 3.1 projects that aim to benchmark Godot's CPU and GPU performance.
Be sure to build/export the projects using a release template for best performance results.

## CPU Performance

Keeps spawning bullets with random properties and checks the FPS in function of the number of spawned instances.
Make sure to unlock the FPS in your graphics card settings.

## GPU Performance

Spawns a bunch of objects and animated sprites at rendom locations. The percentage of the GPU used (both integrated and dedicated cards) should be checked in this case. The FPS count shown doesn't really matter.
