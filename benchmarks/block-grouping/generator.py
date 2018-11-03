#!/usr/bin/python3
"""
    Problem generator for the block-grouping domain.
"""
import argparse
from collections import defaultdict
import os
import random
import sys
import itertools

sys.path.append("..")
from base import generate, AbstractProblemPrinter


def get_instance_name(size, num_blocks, num_categories, run):
    return 'instance_{}_{}_{}_{}'.format(size, num_blocks, num_categories, run)


def parse_arguments():
    parser = argparse.ArgumentParser(description='Generate block-grouping problem instances.')
    parser.add_argument("--max", default=20, help='Maximum grid size', type=int)
    parser.add_argument("--output-dir", required=True, help='Output dir where the generated problems will be placed')
    parser.add_argument("--constrained", action='store_true', default=True,
                        help='Output the constrained problem version')
    args = parser.parse_args()

    assert args.max >= 4
    return args


class ProblemPrinter(AbstractProblemPrinter):
    """ A generic printer for the problem """

    def __init__(self, problem):
        self.problem = problem
        self.instance = self.get_instance_object()
        self.positions = []
        self.connections = []
        self.generate_cells()
        self.add_objects()
        self.add_init()
        self.add_goals()

    def print_pos(self, pos):
        i, j = pos
        return "pos-{}-{}".format(i, j)

    def generate_moves(self, i, j):
        if j-1 >= 1:
            self.create_connection("up", i, j, i, j-1)

        if i+1 <= self.problem.size:
            self.create_connection("right", i, j, i+1, j)

        if i-1 >= 1:
            self.create_connection("left", i, j, i-1, j)

        if j+1 <= self.problem.size:
            self.create_connection("down", i, j, i, j+1)

    def generate_cells(self):
        for i, j in self.problem.all_positions:
            pos = self.print_pos((i, j))
            self.positions.append(pos)
            self.generate_moves(i, j)

    def create_connection(self, param, i, j, i1, j1):
        raise RuntimeError("Method must be subclassed")

    def add_objects(self):
        for o in self.problem.blocks:
            self.instance.add_object(o, "block")
        for o in self.problem.categories:
            self.instance.add_object(o, "color")
        for p in self.positions:
            self.instance.add_object(p, "location")

    def add_init(self):
        for con in self.connections:
            self.instance.add_init(con)


class FStripsPrinter(ProblemPrinter):
    def __init__(self, problem, constrained):
        super().__init__(problem)
        self.constrained = constrained

    def add_objects(self):
        super().add_objects()
        for d in 'up right left down'.split():
            self.instance.add_object(d, "direction")

    def add_init(self):
        super().add_init()
        for elem, pos in self.problem.positions.items():
            self.instance.add_init("(= (loc {}) {})".format(elem, self.print_pos(pos)))

        for block, color in self.problem.block_color.items():
            self.instance.add_init("(= (color {}) {})".format(block, color))

    def add_goals(self):
        super().add_goals()
        # for color, blocks in self.problem.color_blocks.items():
        #     if len(blocks) == 0:  # A useless color - no blocks assigned to it
        #         continue

            # if len(blocks) > 1:
            #     representative = blocks[0]
            #     self.instance.add_goal("(= (loc {}) (loc {}))".format(representative, b2))

        for b1, b2 in itertools.product(self.problem.blocks, self.problem.blocks):
            if b1 < b2:  # No need to specify both a = b and b = a, not b = b, etc.
                basic = "(= (loc {}) (loc {}))".format(b1, b2)
                c1 = self.problem.block_color[b1]
                c2 = self.problem.block_color[b2]
                self.instance.add_goal(basic if c1 == c2 else "(not {})".format(basic))

    def create_connection(self, direction, i, j, i1, j1):
        self.connections.append("(= (next pos-{}-{} {}) pos-{}-{})".format(i, j, direction, i1, j1))

    def get_domain_name(self):
        return 'fn-' + self.problem.domain


class MetricPDDLPrinter(ProblemPrinter):
    def __init__(self, problem, constrained):
        super().__init__(problem)
        self.constrained = constrained

    def add_objects(self):
        for o in self.problem.blocks:
            self.instance.add_object(o, "block")

    def add_init(self):
        super().add_init()
        for elem, pos in self.problem.positions.items():
            self.instance.add_init("(= (x {}) {})".format( elem, pos[0]))
            self.instance.add_init("(= (y {}) {})".format( elem, pos[1]))
        self.instance.add_init( "(= (max_x) {} )".format(self.problem.size) )
        self.instance.add_init( "(= (min_x) {} )".format(1) )
        self.instance.add_init( "(= (max_y) {} )".format(self.problem.size) )
        self.instance.add_init( "(= (min_y) {} )".format(1) )

    def add_goals(self):
        super().add_goals()
        # for color, blocks in self.problem.color_blocks.items():
        #     if len(blocks) == 0:  # A useless color - no blocks assigned to it
        #         continue

            # if len(blocks) > 1:
            #     representative = blocks[0]
            #     self.instance.add_goal("(= (loc {}) (loc {}))".format(representative, b2))

        for b1, b2 in itertools.product(self.problem.blocks, self.problem.blocks):
            if b1 < b2:  # No need to specify both a = b and b = a, not b = b, etc.
                basic_x = "(= (x {}) (x {}))".format(b1, b2)
                basic_y = "(= (y {}) (y {}))".format(b1, b2)
                c1 = self.problem.block_color[b1]
                c2 = self.problem.block_color[b2]
                self.instance.add_goal( "\n".join( [basic_x, basic_y] ) if c1 == c2 else "(or (not {}) (not {}))".format(basic_x,basic_y))

    def create_connection(self, direction, i, j, i1, j1):
        pass

    def get_domain_name(self):
        return 'mt-' + self.problem.domain



class Problem(object):
    def __init__(self, name, domain, size, num_blocks, num_categories):
        self.name = name
        self.domain = domain
        self.size = size
        self.num_blocks = num_blocks
        self.num_categories = num_categories

        self.positions = {}  # Object-to-position map
        self.categories = []

        self.all_positions = []
        self.pos_index = {}
        for i in range(1, self.size + 1):
            for j in range(1, self.size + 1):
                self.pos_index[(i, j)] = len(self.all_positions)  # index the positions starting by 0
                self.all_positions.append((i, j))

        self.blocks = ["b{}".format(i) for i in range(1, self.num_blocks + 1)]
        self.categories = ["c{}".format(i) for i in range(1, self.num_categories + 1)]

        # Set random positions to the blocks
        self.positions = {b: random.choice(self.all_positions) for b in self.blocks}

        # Set random colors to the blocks
        self.block_color = {b: random.choice(self.categories) for b in self.blocks}

        # A map from color to all the blocks of that color
        self.color_blocks = defaultdict(list)
        for b, c in self.block_color.items():
            self.color_blocks[c].append(b)


def main():
    args = parse_arguments()
    base_dir = os.path.realpath(args.output_dir)
    random.seed( 383921 )
    for size in [5, 7, 9, 11, 15, 20, 25, 100]:
        for num_blocks in range(5, 41, 5):
            num_categories = max(2, num_blocks//4)

            for run in range(1, 4):
                name = get_instance_name(size, num_blocks, num_categories, run)
                problem = Problem(name=name, domain="block-grouping",
                                  size=size, num_blocks=num_blocks, num_categories=num_categories)

                #generate(PDDLPrinter(problem), base_dir)  # The PDDL version
                #  Currently disabled - cannot seem to encode cell positions as integers.
                generate(MetricPDDLPrinter(problem, args.constrained), base_dir)  # The numerical-fluents PDDL version
                generate(FStripsPrinter(problem, args.constrained), base_dir)  # The Functional version


if __name__ == "__main__":
    main()
