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

There’s broad consensus in the field of Traffic Signal Control research that mere installation of adaptive systems that adjust the timings of traffic lights in an area in a coordinated manner have potential to meaningfully reduce vehicle delay and emissions with some algorithms and techiques reporting the estimates in the range of $10percent$ to $30percent$ in simulated environments @petersReducingCarbonEmissions2009 @abidAIEnhancedTrafficSignal2026 #ref(<sakaza2025leveraging>)\. On the contrary, the overwhelming majority of municipalities in the United States still rely on the traditional fixed-time or actuated systems *(CITE SOME SURVEY ON THE STATE OF SYSTEM MODERNIZATION)*.

A traffic signal control problem is a multiple-convex *(SOURCE THAT STATES MULTIPLE-CONVEX)* NP-hard *(SOURCE THAT PROVES NP-HARD)* optimization problem whose goal is to reduce traffic congestion @bhattacharyyaSystematicReviewEvolutionary2026. The problem aims to answer the following question: how to tune the timings of traffic signals in a road network so that the system as a whole provides the greatest safety, traffic throughput, the least emissions and car stops @bhattacharyyaSystematicReviewEvolutionary2026? This can be expressed with a formula as

$ "Genral formula given in the systematic review thing" $

esome  

s

- What is traffic signal control?

- Why is traffic signal control relevant?

  - problems and potential improvement
- Why is a genetic algorithm a good choice
- Cycle time & Splits @urbanik2015signal
- Our current GA implementation @chanOptimisationFixedTimeSignal1999
  - How do we know we’re using the right GA implementation? Which GA implementations are there?
- Could approach it from the angle that a lot of distributed techniques are tried, and this is an attempt to improve performance of any probabilistic swarm intelligence algorithm with a simple AWoC aggregation

  - A bit iffy though, considering that it would require a lot of resources. Is WoAC really beneficial? It requires like 10x independent computation. We run the same algorithm for different systems and combine guesses. What class of problems would that really be useful in?
- Websters as the early choice @tekluGeneticAlgorithmApproach2007
- 

= Literature Review

Genetic Algorithms have been applied extensively to solving TSC, both for real-time and fixed-time optimization. The versatility of genetic algorithms as a meta-heuristic   permits their utilization to optimize all aspects of TSC @yampolskiyWisdomArtificialCrowds2012. Some approaches use a single genetic algorithms to optimize boths the offsets and cycle lengths and cycle tims of individual intersections in fixed-time settings @chanOptimisationFixedTimeSignal1999 #ref(<tekluGeneticAlgorithmApproach2007>). Some approaches deviate from the traditional cycle model devised by Webster@WebsterMethodTraffic and use models such as Cell Transmission Models @loDynamicNetworkTraffic2001. We find these models to complex for the research question of studying the effects of WoAC on GA TSC, so for our purposes a simple Binary GA models suficies.                                                                                                                                                                                              

- TSC Solutions with GA: what has been tried before. What TRANSYT uses. Any applications at scale?
- What’s the state of the research? Are we leaning more adaptive or static or actuated? How research compares to real world appplications and why? Has GA research has been exhausted?
- Applications of GA. What types of problems GAs apply to
- Alternatives to GAs

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

=== Generating Instances

This process generates a new test case when settings such as grid size, number of vehicles, random seed, or starting edge are changed.  

=== Experiment Setup

All experiments were run on a laptop with an AMD Ryzen 7 7840HS (8 cores, 16 threads) and 16 GB of RAM, running Ubuntu 26.04.1 LTS with Python 3.14.4 and Eclipse SUMO 1.28.0. The experiments used the GA parameters listed in Table I.    

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

== Results

= Conclusions
