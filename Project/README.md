## MATLAB Genetic Algorithm for Network Flow Optimization

This project implements a genetic algorithm to optimize the flow in a network. The main script `main.m` defines the parameters and runs the genetic algorithm to find the best solution.

### Key Components

- **Parameters**: Defines the population size, number of roads, nodes, flow, penalty parameters, genetic algorithm parameters, and road capacities.
- **Initialization**: Initializes the population and calculates the fitness of each individual.
- **Main Loop**: Runs the genetic algorithm for a specified number of generations, including selection, crossover, mutation, and survivor selection.
- **Evaluation**: Evaluates the fitness of the population and identifies the best solution.

### Usage

1. Set the desired parameters in `main.m`.
2. Run the script to execute the genetic algorithm.
3. The best solution and its fitness will be displayed.

### Files

- `main.m`: Main script to run the genetic algorithm.
- `flow_conservation_matrix.m`: Function to generate the flow conservation matrix.
- `initialize_pop.m`: Function to initialize the population.
- `fitness_function.m`: Function to calculate the fitness of an individual.
- `select_parents.m`: Function to select parents for crossover.
- `crossover.m`: Function to perform crossover between parents.
- `mutate.m`: Function to mutate children.
- `select_survivors.m`: Function to select survivors for the next generation.
- `is_feasible.m`: Function to check if a solution is feasible.
- `repair_solution.m`: Function to repair an infeasible solution.
- `objective_function.m`: Function to calculate the objective value of a solution.

### Notes

- Experiment with different values for the penalty parameters, mutation rate, and number of generations to achieve better results.
- Ensure that the road capacities and other parameters are set according to the specific network being optimized.

### Example

```matlab
% Example usage in main.m
pop_size = 100;
n_gen = 100;
mutation_rate = 0.1;
% Run the genetic algorithm
% ...
```

This project demonstrates the application of genetic algorithms to solve complex optimization problems in network flow management.

This project implements a genetic algorithm to optimize the flow inside a network of roads. The goal is to find the best configuration of flows that minimizes the total travel time while respecting the capacity constraints of each road.

## Main Script: `main.m`

The main script initializes the parameters, sets up the problem, and runs the genetic algorithm to find the optimal solution.

### Key Parameters

- `pop_size`: Population size
- `n_roads`: Number of roads
- `num_nodes`: Number of nodes in the network
- `V`: Total flow inside the network
- `lambda`: Penalty parameters for constraint violations
- `n_gen`: Number of generations
- `n_parents`: Number of parents selected for crossover
- `n_children`: Number of children generated from crossover
- `mutation_rate`: Mutation rate

### Road Capacities

The capacities of the roads are defined in a map and converted to a vector for easier manipulation.

### Genetic Algorithm

The genetic algorithm consists of the following steps:

1. **Initialization**: Generate an initial population of solutions.
2. **Fitness Evaluation**: Calculate the fitness of each solution based on the objective function.
3. **Selection**: Select parents based on their fitness.
4. **Crossover**: Generate children by combining parents.
5. **Mutation**: Apply random changes to the children.
6. **Survivor Selection**: Select the best solutions to form the new population.
7. **Repeat**: Iterate through the generations until the stopping criterion is met.

### Output

The script outputs the best solution found, its fitness, and the objective value. If the best solution is not feasible, it attempts to repair it.

## Usage

To run the script, execute `main.m` in MATLAB. You can modify the parameters and penalty values to experiment with different configurations.

## Dependencies

- MATLAB
- Custom functions: `flow_conservation_matrix`, `initialize_pop`, `fitness_function`, `select_parents`, `crossover`, `mutate`, `select_survivors`, `is_feasible`, `repair_solution`, `objective_function`
