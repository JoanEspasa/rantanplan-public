#!/usr/bin/env python
"""
    Problem generator for the plant-watering domain.
"""
import argparse
import os
import random
import math
import sys
sys.path.append("../..")
from base import generate, AbstractProblemPrinter


def get_instance_name(size, run,num_plants):
    return 'instance_{}_{}_{}'.format(size, num_plants, run)


def parse_arguments():
    parser = argparse.ArgumentParser(description='Generate plant-watering problem instances.')
    parser.add_argument("--max", default=20, help='Maximum grid size', type=int)
    parser.add_argument("--output-dir", required=True, help='Output dir where the generated problems will be placed')
    parser.add_argument("--constrained", action='store_true', default=False,
                        help='Output the constrained problem version')
    parser.add_argument("--max-num-plants",required=True, default=None,type=int)
    parser.add_argument("--max-each-plant",required=False, default=10,type=int)
    parser.add_argument("--runs",required=False, default=1,type=int)
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

        self.add_objects()
        self.add_init()
        self.add_goals()

    def print(self):
        return self.instance.print()

    def add_objects(self):
        for o, t in self.problem.objects.items():
            self.instance.add_object(o, t)

    def add_init(self):
        pass

    def add_goals(self):
        pass


class FStripsPrinter(ProblemPrinter):
    def __init__(self, problem, constrained):
        self.constrained = constrained
        super().__init__(problem)
        if self.constrained:
            constraint_elems = ["(poured {})".format(p) for p in self.problem.plants] + ["(total_loaded)"]
            self.instance.add_goal("(sum_constraint {})".format(' '.join(constraint_elems)))

    def add_objects(self):
        super().add_objects()
        self.instance.add_object("agent1", "agent")

    def add_init(self):
        super().add_init()
        self.instance.add_init("(= (x {0}) {1})".format("agent1",self.problem.agent_pos[0]))
        self.instance.add_init("(= (y {0}) {1})".format("agent1",self.problem.agent_pos[1]))
        for elem, pos in self.problem.positions.items():
            self.instance.add_init("(= (x {0}) {1})".format(elem, pos[0]))
            self.instance.add_init("(= (y {0}) {1})".format(elem, pos[1]))
        self.instance.add_domain_bound("(units - int[0..{}])".format(self.problem.max_int))
        self.instance.add_domain_bound("(coordinate - int[1..{0}])".format(self.problem.size))
        self.instance.add_init("(= (total_loaded) 0)")
        self.instance.add_init("(= (carrying) 0)")
        for o in self.problem.plants:
            self.instance.add_init("(= (poured {}) 0)".format(o))

    def add_goals(self):
        super().add_goals()
        for p in self.problem.plants:
            self.instance.add_goal("(= (poured {}) {})".format(p, self.problem.goal[p]))


    def get_domain_name(self):
        if self.constrained : return 'fn-' + self.problem.domain + '-constrained'
        return 'fn-' + self.problem.domain

class MetricPDDLPrinter(ProblemPrinter):

    def __init__(self, problem, constrained):
        self.constrained = constrained

        super().__init__(problem)
        if self.constrained :
            sum_components = [ "(poured {})".format(p) for p in self.problem.plants]
            if len(self.problem.plants) == 1 :
                summation = '{}'.format(sum_components[0])
            else :
                summation = '(+ {0} {1})'.format( sum_components[0], sum_components[1])
                for i in range(2, len(sum_components)) :
                    summation = '(+ {0} {1})'.format( summation, sum_components[i])
            self.instance.add_goal("(= (total_poured) {0} )".format(summation))

    def add_objects(self):
        super().add_objects()
        self.instance.add_object("agent1", "agent")

    def add_init(self):
        super().add_init()
        self.instance.add_init("(= (max_int) {})".format(self.problem.max_int))
        self.instance.add_init("(= (maxx) {0})".format(self.problem.size))
        self.instance.add_init("(= (minx) 1)")
        self.instance.add_init("(= (maxy) {0})".format(self.problem.size))
        self.instance.add_init("(= (miny) 1)")
        self.instance.add_init("(= (carrying) 0)")
        self.instance.add_init("(= (total_poured) 0)")
        self.instance.add_init("(= (total_loaded) 0)")

        for o in self.problem.plants:
            self.instance.add_init("(= (poured {}) 0)".format(o))

        self.instance.add_init( "(= (x {0}) {1})".format( "agent1", self.problem.agent_pos[0]))
        self.instance.add_init( "(= (y {0}) {1})".format( "agent1", self.problem.agent_pos[1]))
        for elem, pos in self.problem.positions.items():
            self.instance.add_init("(= (x {0}) {1})".format(elem, pos[0]))
            self.instance.add_init("(= (y {0}) {1})".format(elem, pos[0]))

    def add_goals(self):
        super().add_goals()
        for p in self.problem.plants:
            self.instance.add_goal("(= (poured {}) {})".format(p, self.problem.goal[p]))

    def get_domain_name(self):
        if self.constrained : return 'mt-' + self.problem.domain + '-constrained'
        return 'mt-' + self.problem.domain


class Problem(object):
    def __init__(self, name, domain, size, num_plants, max_each_plant,num_taps=1):
        self.name = name
        self.domain = domain
        self.size = size
        self.objects = {}  # Object-to-type map
        self.positions = {}  # Object-to-position map
        self.goal = {}  # The amount of pouring for each plant
        self.plants = []

        self.all_positions = []
        for i in range(1, self.size + 1):
            for j in range(1, self.size + 1):
                self.all_positions.append((i, j))

        for i in range(1, num_plants + 1):
            plant_name = "plant{}".format(i)
            self.plants.append(plant_name)
            self.objects[plant_name] = "plant"
            self.goal[plant_name] = random.randint(1, max_each_plant)
        for i in range(1, num_taps + 1):
            self.objects["tap{}".format(i)] = "tap"

        self.max_int = num_plants * 10 * 2
        self.total_loaded = 0
        self.carrying = 0

        # Set random positions to plants, tap and player
        positions = random.sample(self.all_positions, len(self.objects) + 1)  # We account for the agent position
        self.agent_pos = positions[0]

        for i, o in enumerate(self.objects.keys(), 1):  # skip the first random position, assigned to the agent
            self.positions[o] = positions[i]


def main():
    args = parse_arguments()
    base_dir = os.path.realpath(args.output_dir)
    random.seed( 383921 )
    if not os.path.exists( base_dir ) :
        print("Creating directory {0}".format(base_dir))
        os.makedirs( base_dir )

    for size in range(4, args.max + 1):
        for num_plants in range(1, args.max_num_plants + 1):
            if size > 20 and size % 10 != 0 : continue
            for run in range(1, args.runs+1):
                name = get_instance_name(size, run, num_plants)
                problem = Problem(name=name, domain="plant-watering",
                                  size=size, max_each_plant = args.max_each_plant, num_plants= num_plants)

                generate(MetricPDDLPrinter(problem, args.constrained), base_dir)  # The PDDL2.1 + state constraints versions
                generate(FStripsPrinter(problem, args.constrained), base_dir)  # The Functional version


if __name__ == "__main__":
    main()
