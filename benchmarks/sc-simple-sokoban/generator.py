#!/usr/bin/python3
"""
    Problem generator for the simple-sokoban domain: a sokoban in a grid-like map without obstacles.
"""
import argparse
import os
import random
import sys
sys.path.append("..")
from base import generate, PlanningProblem, AbstractProblemPrinter


def get_instance_name(size, stones, run=None):
    return 'instance_{}'.format(size) if run is None else 'instance_{}_{}_{}'.format(size, stones, run)


def parse_arguments():
    parser = argparse.ArgumentParser(description='Generate counters problem instances.')
    parser.add_argument("--max", default=15, help='Maximum number of counters', type=int)
    parser.add_argument("--max_dimension", default=15, help='Maximum dimension', type=int)
    parser.add_argument("--output-dir", required=True, help='Output dir where the generated problems will be placed')
    args = parser.parse_args()
    return args


class ProblemPrinter(AbstractProblemPrinter):
    """ A generic printer for the problem """

    def __init__(self, problem):
        self.positions = []
        self.connections = []
        self.problem = problem
        self.generate_cells()
        super().__init__(problem)

    def print(self):
        return self.instance.print()

    def add_objects(self):
        self.instance.add_object("player1", "player")

        for p in self.positions:
            self.instance.add_object(p, "location")

        for s in self.problem.all_stones:
            self.instance.add_object(s, "stone")

    def add_init(self):
        for con in self.connections:
            self.instance.add_init(con)

    def add_goals(self):
        pass

    def get_domain_name(self):
        return self.problem.domain

    def get_instance_object(self):
        return PlanningProblem(self.problem.name, self.get_domain_name())

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

    def print_pos(self, pos):
        i, j = pos
        return "pos-{}-{}".format(i, j)


class FStripsPrinter(ProblemPrinter):
    def __init__(self, problem, gconstraint=False, sconstraint=False):
        self.valid_moves = dict()
        self.next = dict()
        assert not (gconstraint and sconstraint),   \
            "Makes no sense to put the same constraint as goal and state constraint"
        self.sconstraint = sconstraint
        self.gconstraint = gconstraint

        super().__init__(problem)
        self.create_next_function()

    def add_constraints(self):
        if self.gconstraint:
            constraint_elems = ["(loc {})".format(s) for s in self.problem.all_stones]
            self.instance.add_goal("(alldiff_constraint {})".format(' '.join(constraint_elems)))
        elif self.sconstraint:
            constraint_elems = ["(loc {})".format(s) for s in self.problem.all_stones] + ["(loc player1)"]
            self.instance.add_state_constraint("(alldiff {})".format(' '.join(constraint_elems)))

    def add_objects(self):
        super().add_objects()

    def add_init(self):
        super().add_init()

        self.instance.add_init("(= (loc player1) {})".format(self.print_pos(self.problem.agent_position)))
        for s, pos in zip(self.problem.all_stones, self.problem.stone_positions):
            self.instance.add_init("(= (loc {}) {})".format(s, self.print_pos(pos)))

        for i, j in self.problem.all_positions:
            if (i, j) in self.problem.goal_cells:
                self.instance.add_init("(goal_location {})".format(self.print_pos((i, j))))

            # The clear predicate is unnecessary for the state contraint-alldiff'd version
            if not self.sconstraint \
                    and not (i, j) in self.problem.stone_positions \
                    and (i, j) != self.problem.agent_position:
                self.instance.add_init("(clear {})".format(self.print_pos((i, j))))

    def add_goals(self):
        super().add_goals()

        for s in self.problem.all_stones:
            self.instance.add_goal("(goal_location (loc {}))".format(s))

    def get_domain_name(self):
        sc = 'sc' if self.sconstraint else None
        gc = 'gc' if self.gconstraint else None
        components = ['fn', sc, gc, self.problem.domain]
        return '-'.join([s for s in components if s])

    def create_connection(self, direction, i, j, i1, j1):
        self.connections.append("(connected pos-{}-{} pos-{}-{})".format(i, j, i1, j1))

        # Save the necessary data to generate the next function initialization afterwards
        x, y = (i, j), (i1, j1)
        self.valid_moves[(x, y)] = direction
        self.next[(x, direction)] = y

    def create_next_function(self):
        for (x, y), direction in self.valid_moves.items():
            if (y, direction) in self.next:
                self.instance.add_init("(= (next {} {}) {})".format(
                    self.print_pos(x), self.print_pos(y), self.print_pos(self.next[(y, direction)])
                ))


class MetricPDDLPrinter(ProblemPrinter):

    def __init__(self, problem):
        super().__init__(problem)

    def add_objects(self):
        self.instance.add_object( "player1", "player")

        for s in self.problem.all_stones:
            self.instance.add_object(s, "stone")

    def add_init(self):
        # bounds
        self.instance.add_init( "(= (max_x) {0})".format(self.problem.size))
        self.instance.add_init( "(= (min_x) 1)")
        self.instance.add_init( "(= (max_y) {0})".format(self.problem.size))
        self.instance.add_init( "(= (min_y) 1)")

        # player position
        self.instance.add_init("(= (x player1) {0})".format(self.problem.agent_position[0]))
        self.instance.add_init("(= (y player1) {0})".format(self.problem.agent_position[1]))

        for s, pos in zip(self.problem.all_stones, self.problem.stone_positions):
            self.instance.add_init("(= (x {}) {})".format(s, pos[0]))
            self.instance.add_init("(= (y {}) {})".format(s, pos[1]))

    def add_goals(self):
        super().add_goals()
        for s in self.problem.all_stones:
            goal_locs = [ "(and (= (x {0}) {1}) (= (y {0}) {2}))".format( s, gx, gy) for gx, gy in self.problem.goal_cells]
            self.instance.add_goal( "(or {})".format( ' '.join(goal_locs) ) )

    def create_connection(self, direction, i, j, i1, j1):
            self.connections.append("(MOVE-DIR pos-{}-{} pos-{}-{} {})".format(i, j, i1, j1, direction))

    def get_domain_name(self):
        return 'mt-' + self.problem.domain


class Problem(object):
    def __init__(self, name, domain, size, num_stones):
        self.name = name
        self.domain = domain
        self.size = size
        self.num_stones = num_stones
        self.agent_position = None
        self.stone_positions = []
        self.all_positions = []
        self.goal_cells = []
        self.positions = []
        self.all_stones = ["stone{}".format(s) for s in range(1, self.num_stones + 1)]

        for i in range(1, self.size + 1):
            for j in range(1, self.size + 1):
                self.all_positions.append((i, j))

        self.generate_positions()

    def generate_positions(self):
        """ Generate the position of the elements. """
        middle = self.size // 2
        last = self.size

        self.agent_position = (2, middle)  # First the agent's position: second column, middle row (2,m)
        self.goal_cells = [(1, middle)]  # Fix the first goal left of the player (1, middle)

        # locate the n - 1 - 2 stones on the second row
        stone_columns = [i for i in range(2, self.size) if i != middle]
        self.stone_positions += zip([2]*len(stone_columns), stone_columns)
        # locate the remaining goals on the rightmost column
        self.goal_cells += zip([last]*(len(stone_columns)-1), stone_columns[1:])


class RandomProblem(Problem):
    """ An instance randomly generated. """

    def __init__(self, name, domain, size, num_stones):
        super().__init__(name, domain, size, num_stones)

    def generate_positions(self):
        """ Generate the position of the elements. """
        inner_positions = []
        for i in range(2, self.size):
            for j in range(2, self.size):
                inner_positions.append((i, j))

        self.stone_positions = random.sample(inner_positions, len(self.all_stones))
        remaining_clear_positions = [p for p in self.all_positions if p not in self.stone_positions]  # Set substraction
        positions = random.sample(remaining_clear_positions, len(self.all_stones) + 1)
        self.agent_position = positions[0]
        self.goal_cells = positions[1:]


def main():
    args = parse_arguments()
    base_dir = os.path.realpath(args.output_dir)

    # First we generate the non-random instances
    for size in range(4, args.max + 1):
        num_stones = size - 3
        name = get_instance_name(size, num_stones)
        problem = Problem(name, "simple-sokoban", size, num_stones)

        # The PDDL version
        generate(MetricPDDLPrinter(problem), base_dir)

        # Functional version with alldiff state constraint
        generate(FStripsPrinter(problem, sconstraint=True), base_dir)


    random.seed( 8352781 )

    # Now the random instances
    for dim in range(10, args.max_dimension + 1, 5) :
        for size in range(4, args.max + 1, 3):
            max_num_stones = max(2, size - 2)
            for num_stones in range(2, max_num_stones + 1, 2):
                for run in range(1, 4):
                    name = get_instance_name(dim, num_stones, run)
                    problem = RandomProblem(name, "simple-sokoban-rnd", dim, num_stones)

                    # The PDDL version
                    generate(MetricPDDLPrinter(problem), base_dir)

                    # Functional version with alldiff state constraint
                    generate(FStripsPrinter(problem, sconstraint=True), base_dir)


if __name__ == "__main__":
    main()
