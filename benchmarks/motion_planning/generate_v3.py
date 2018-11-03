#!/usr/bin/python3
import sys
import os
import argparse
import math

def parse_arguments() :
    parser = argparse.ArgumentParser( description = "Generate random motion planning instance" )
    parser.add_argument( "--max_scale_factor", required=True, help="Maximum scale factor for boxes (minimum set to 1)")
    parser.add_argument( "--num_boxes", required=True, help="Number of boxes to put on the map")
    parser.add_argument( "--max_x_trans", required=False, help="Maximum translation along x axis (defaults to 50)" )
    parser.add_argument( "--max_y_trans", required=False, help="Maximum translation along y axis (defaults to 50)")
    parser.add_argument( "--max_rotation", required=False, help="Maximum rotation angle (defaults to 60 degrees)")
    parser.add_argument( "--random_seed", required=False, help="Set RNG seed")
    parser.add_argument( "--num_instances", required=False, help="Number of instances to generate (defaults to 1)")
    parser.add_argument( "--rotate_boxes", required=False, help="Rotate boxes [true/false](defaults to 'true')" )
    parser.add_argument( "--fixed_rotation_angle", required=False, help="Fix rotation angle")

    args = parser.parse_args()
    args.num_boxes = int( args.num_boxes )
    args.max_scale_factor = float( args.max_scale_factor )
    if args.max_x_trans is None :
        args.max_x_trans = 50.0
    else :
        args.max_x_trans = float( args.max_x_trans)
    if args.max_y_trans is None :
        args.max_y_trans = 50.0
    else :
        args.max_y_trans = float( args.max_y_trans )
    if args.max_rotation is None :
        args.max_rotation = math.radians(60.0)
    else :
        args.max_rotation = math.radians( float(args.max_rotation) )
    if args.random_seed is not None :
        import random
        args.random_seed = int(args.random_seed)
        random.seed( args.random_seed )
        print( "Setting seed to {0}".format(args.random_seed) )
    if args.num_instances is None :
        args.num_instances = 1
    else :
        args.num_instances = int(args.num_instances)
    if args.rotate_boxes is None :
        args.rotate_boxes = True
    else :
        if args.rotate_boxes == 'true' :
            args.rotate_boxes = True
        elif args.rotate_boxes == 'false' :
            args.rotate_boxes = False
        else :
            raise RuntimeError( 'Argument --rotate_boxes only allows for either "true" or "false"' )
    if args.fixed_rotation_angle is not None :
        args.fixed_rotation_angle = float( args.fixed_rotation_angle )

    return args

def main() :
    from PyQt5 import QtWidgets
    from roverworld.views.generator_windows import GeneratorMainWindow

    cmd_line_args = parse_arguments()
    naming_pattern = 'v3{0}_num_obstacles_{1}_{2:0>3}{3}'
    app = QtWidgets.QApplication(sys.argv)
    app.lastWindowClosed.connect(app.quit)
    window = GeneratorMainWindow(cmd_line_args, naming_pattern)
    window.show()
    app.exec_()

if __name__ == '__main__' :

    main()
