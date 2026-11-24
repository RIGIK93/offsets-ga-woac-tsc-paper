#import "@preview/charged-ieee:0.1.4": ieee

#show: ieee.with(
  title: [Optimizing Offsets in Fixed-Time 2-Stage Traffic Signal Control with the WoAC GA Approach],
  abstract: [
    Traffic Signal Control is a multiple-convex NP-Hard optimization problem. Conventional swarm, distributed and mixed methods have been applied in an attempt to efficiently reduce delay, emissions and number of stops for vehicles in both urban and rural settings. We applied a binary genetic algorithm to assign offsets for each intersection in a network of traffic lights in order to adapt to the historical data simulated with SUMO software. Additionally, we applied the Wisdom of Artificial Crowds (WoAC), a swarm-based, nature-inspired metaheuristic in order to attempt to both improve and parallelize the genetic algorithm. We find WoAC to provide no imporvement to the Binary GAs outcomes with the set up explored in this paper; however, we still find the methodology and experimental design a useful starting point for the application of WoAC to improve existing TSC algorithms.
  ],
  authors: (
    (
      name: "Bryant Garcia",
      department: [Computer Science and Engineering],
      organization: [University of Louisville],
      location: [Louisville, Kentucky, United States],
      email: "bryant.garcia@louisville.edu"
    ),
    (
      name: "Maxim Peniaz",
      department: [Computer Science and Engineering],
      organization: [University of Louisville],
      location: [Louisville, Kentucky, United States],
      email: "maxim.peniaz@louisville.edu"
    ),
  ),
  index-terms: ("Traffic Signal Control", "Genetic Algorithm", "Artificial Wisdom of the Crowds", "Optimization"),
  bibliography: bibliography("refs.bib"),
  figure-supplement: [Fig.],
)

= Introduction

There’s broad consensus in the field of Traffic Signal Control research that mere installation of adaptive systems that adjust the timings of traffic lights in an area in a coordinated manner have potential to meaningfully reduce vehicle delay and emissions with some algorithms and techiques reporting the estimates in the range of $10percent$ to $30percent$ in simulated environments @petersReducingCarbonEmissions2009 @abidAIEnhancedTrafficSignal2026 #ref(<sakaza2025leveraging>)\. On the contrary, the overwhelming majority of municipalities in the United States still rely on the traditional fixed-time or actuated systems @aaronIntelligentTransportationSystems2024.    

A traffic signal control problem is a multiple-convex @chanOptimisationFixedTimeSignal1999 NP-hard @serafiniMathematicalModelFixedtime1989 optimization problem whose goal is to reduce traffic congestion @bhattacharyyaSystematicReviewEvolutionary2026. The problem aims to answer the following question: how to tune the timings of traffic signals in a road network so that the system as a whole provides the greatest safety, traffic throughput, the least emissions and car stops @bhattacharyyaSystematicReviewEvolutionary2026? Formally, this goal in a network of traffic lights can be expressed as a weighted sum of the average delay in the network $D(X) $, the number of stops $S(X) $ and some emissions index $E(X) $ all subject to the parameters $X $ such as cylce length ($C_"min" <= C <= C_"max" $), green splits, and intersection offsets                                                                                  

$ min_X F(X) = w_1 D(X) + w_2 S(X) + w_3 E(X) . $ <eq:goal>

The Department of Transportation defines cycle time as “the duration of a complete sequence of \[stages\] in the absence of priority calls” and split as “the time given to a phase during coordinated operation” @urbanik2015signal. A green split can be then understood as the time in seconds allocated to a particular stage. In this paper, we are working with a two-stage set up, where either all North-South traffic lights are green or the East-West traffic lights. This is, of course, a simplified model, as a realistic one would be far too complex for the scope of this paper. 

The Department of Transportation defines offsets as “the time relationship between a reference point on the coordinated phase and a master reference, either the master clock or a sync pulse” @urbanik2015signal. The offsets are used to put green splits in sync with each other to create the effect of a green wave.                                                        

== Genetic Algorithm

A genetic algorithm is a population-based metaheuristic inspired by the biological mechanisms of natural selection @chanOptimisationFixedTimeSignal1999. There are different formulations of genetic algorithms: those that keeps the entire population in memory, those that merely store probabilities and rely on them, etc. We will be utilizing a binary genetic algorithm already applied to TSCs by Chan and Wong in their 1999 paper. A binary genetic algorithm encodes a chromosome as a sequence of 0s and 1s. Each chromosome is an encoding of parameters $X $. Thus, for each chromosome $F(X) $ from @eq:goal can be computed and each chromosome alone is sufficient to represent one possible solution to the TSC problem. A set of chromosomes is called a population. A genetic algorithm varies the chromosomes of the population incrementally with each increments being called a generation in order to increase the quality of the solutions (in our case, that would mean minimizing $F(X) $). The population is varied either by random modification of a chromosome called mutation to promote exploration or by mating to combine two individuals of the popualtion and produce offspring with hopefully better characteristics. Chan and Wong show that their genetic algorithm can be applied to optimize offsets, cycle lengths and green splits; however, we have applied this algorithm to offsets only.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       

== Wisdom of the Artificial Crowds        

== 

= Literature Review

Genetic Algorithms have been applied extensively to solving TSC, both for real-time and fixed-time optimization. The versatility of genetic algorithms as a meta-heuristic   permits their utilization to optimize all aspects of TSC @yampolskiyWisdomArtificialCrowds2012. Some approaches use a single genetic algorithm to optimize the offsets and cycle lengths and cycle times of individual intersections in fixed-time settings @chanOptimisationFixedTimeSignal1999 #ref(<tekluGeneticAlgorithmApproach2007>). Some approaches deviate from the traditional cycle model devised by Webster@WebsterMethodTraffic and use models such as Cell Transmission Models @loDynamicNetworkTraffic2001. We find these models to complex for the research question of studying the effects of WoAC on GA TSC, so for our purposes a simple Binary GA model suficies. Some approaches attempt to utilize GA in a real-time simulation environment, as opposed to fitting to the historical data; however, this approach has been proven to complex for this study as well @leeRealTimeOptimizationAdaptive2005.

Besides GA, an array of other methods have been applied to solving TSC, including particle swarm optimization @shi2021particle, bee colony optimization @jovanovic2022ecology and ant colony optimization techniques @rehman2018vehicular. The variety of experimentation and diversity in algorithm selection highlihgs the potential benefit of metaheuristics such as WoAC in TSC research. Despite that variety, the real world still lags behind, with little to no adoption of these algorithms @aaronIntelligentTransportationSystems2024. For GAs specifcially, most notably a GA is applied in fixed-time contexts in TSC planning software Transyt where a genetic algorithm is used to optimize cycle length, phasing sequence, splits, and offsets  @mctransTRANSYT7F.

As for the Artificial Wisdom of the Crowds, we did not find any of the attempts to apply the metaheuristic to TSC. The algorithm, however, has been applied to other NP-hard problems, such as the Traveling Salesman Problem with the average improvement in the range of $3percent dash 10percent $ and little computational overhead @yampolskiyWisdomArtificialCrowds2012, crossword puzzle generation @bonomoCrosswordPuzzleGenerator2015, number matrix games @reddingSolvingNPhardNumber2015, sudoku @hughesSolvingSudokuPuzzles2012 and battleship solitaire @portUsingGAWisdom2012.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

= Proposed Approach

== Problem Formulation

= Experimental Results

== Data

All test data was generated using tools that are provided by SUMO. The network and traffic demand were created once with fixed settings and the same files were used for every simulation in the experiment.

=== Road Network

The road network is a 3x3 grid with traffic lights at every intersection generated using the Netgenerate tool. Intersection are named with a column letter and number from A0 to C2. The traffic lights alternate between green, yellow, and red phases. In SUMO, the traffic lights are controlled as one unit by the traffic light logic. The traffic light logic includes a list of phases that are written as a string of letters including G for green, y for yellow, and r for red.

=== Traffic Demand

The traffic demand was generated with the randomTrips.py Python script provided by SUMO. Vehicles are generated at the starting point of C0B0 every 3 seconds for the first simulated hour. All vehicles pass under intersection B0 and then follow a randomly generated path with a fixed seed to create identical road demand in each run of the simulation.      

=== Data Files

All files are in SUMO’s XML format. The road network is stored in grid.net.xml that stores the road lanes, intersections, traffic lights, and the starting traffic light plan. The traffice demand starts as a trips.rou.xml file where each trip contains a vechile ID, vehcile departrure time in seconds (after the simulation starts), and the vehciles start and end edges. The randomTrips.py script calls SUMO’s router and finds a route for each vehicle to traverse from the start and end edges which are stored in a routes.rou.xml file. Offset plans group lights in an intersection with their phase durations, phase strings and offsets and are written to an add.xml file. The confguration file grid.sumocfg links these input files together and SUMO writes the results to a statistics file XML file.

```

```

=== Generating Instances

This process generates a new test case when settings such as grid size, number of vehicles, random seed, or starting edge are changed.  

=== Experiment Setup

All experiments were run on a laptop with an AMD Ryzen 7 7840HS (8 cores, 16 threads) and 16 GB of RAM, running Ubuntu 26.04.1 LTS with Python 3.14.4 and Eclipse SUMO 1.28.0. The experiments used the GA parameters listed in Table I. Figure 2 shows the test network in SUMO’s graphical interface.                  

#figure(
  table(
    columns: 2,
    align: (left, auto),
    stroke: none,
    table.hline(),
    table.header([Parameter], [Setting]),
    table.hline(),
    [Chromosome], [72 bits (8 bits x 9 intersections)],
    [Offset formula], [offset = gene x C_max / 255],
    [Fitness], [Average time loss per vehicle],
    [Population size], [100],
    [Selection], [Tournament, size 3],
    [Crossover], [Uniform],
    [Mutation], [0\.01 per light (part of the gene is re-randomized)],
    [Generations], [50],
    [GA runs], [10],
    [Worker processes], [14],
    table.hline(),
  ),
) <texpile-table-98b3a00cf56d>

#figure(image("images/pasted-image-fc062a06.png"), caption: [SUMO-GUI view of the 3x3 road network.]) <texpile-fig-f7ff7b66b334>

== Results

=== GA vs Webster’s Baseline

Table II and Fig. 3 compare methods. With Webster’s green splits and offsets set to zero, vehicles lost an average of 18.91 seconds. Ten separate GA runs lowered this to an average of 15.10 seconds. The best run reached 14.87 seconds which is 21.4% lower. The splits and cycle length were the same in every plan, so the entire improvement comes from adjust the offsets.

#figure(
  table(
    columns: 3,
    align: (left, center, center),
    stroke: none,
    table.hline(),
    table.header([Method], [Avg. delay (s)], [vs. Webster]),
    [Webster, zero offsets], [18\.91s], [--],
    [GA (mean of 10 runs x 50 generations)], [15\.10s], [\-20.1%],
    [GA best run], [14\.87s], [\-21.4%],
    [WoAC, sliding window], [15\.42s], [\-18.5%],
    table.hline(),
  ),
) <texpile-table-d3170febcd7a>

#figure(image("images/pasted-image-a4c2d342.png"), caption: [Average time loss per vehicle for Webster's pla with zero offse, the GA (mean of 10 runs), and the GA with WoAC plan.]) <texpile-fig-b59bea7479e9>

#figure(image("images/pasted-image-0a7b2743.png"), caption: [Best average time loss per generation for the 10 GA runs (50 generations each)]) <texpile-fig-1caf14ccfcb0>

=== Wisdom of Artifical Crowds

The best plan from each GA run was treated as one expert and the crowds were formed using the top 10%, 25%, 50%, 75%, and 100% of the experts. With 10% crowd there is only onexpert so the crowd plan is just that GA plan. WIth the sliding window, these crowds had time losses between 15.42s and 16.41s, each of which was worse than the best GA expert. Fig. 4 shows the crowd results for each crowd size.

The best crowd, 15.42s, used the top 50% of experts (5 runs) and a 10s window. This is 0.55s (3.7%) worse than the best GA run, which is also worse than the average GA run.

The results can be explained by how offsets work. An offset is only useful if its lines up with the offsets of the lights next to it. Taking the offsets from different experts can break that coordination that each expert found. Also, experts chose different offsets for most lights so there wasn’t a lot of common offsets for them to agree on which is why larger crowds changed almost every single offset. Since experts didn’t agree on most offsets, there was no common plan for the Wisdom of the Crowds to settle on, so the plan mixed parts of different solutions.

#figure(image("images/pasted-image-ab08faad.png"), caption: [Average time loss of the WoAC plan versus the percentage of GA experts in the crowd.]) <texpile-fig-0845f6b6e93c>

=== Run time

Each fitness evaluation is a full SUMO simulation, evaluation time dominates the run time. Fig.5 shows the effect of each optimization on the timer per generation with a population of 100. In the first version with the 10 worker processes, read SUMO’s trip records, one per line vehicle to compute the average time loss which took 3.1s per generation. Caching the fitness of chromosomes that had already been simulated reduced it to 2.1s. Raising the pool of 10 worker processes to 14 and reading SUMO’s summary statistics file that already contained the average brought it down to 1.6s. Skipping the XML validation and SUMO’s performance report brought it down to 1.2s. With all of these optimizations, evaluating a generation became about 2.6 times faster. A complete 50 generation run takes about 63s, so 10 runs finish in about 10.5 minutes. WoAC adds very little to this since each crowd plan only needs one extra simulation.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        

= Conclusions
