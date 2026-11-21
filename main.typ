#import "@preview/charged-ieee:0.1.4": ieee

#show: ieee.with(
  title: [Optimizing Offsets in Fixed-Time 2-Stage Traffic Signal Control with the WoAC GA Approach],
  abstract: [
    Optimizing offsets for intersections in the sytems of traffic lights is a multiple-convex NP-Hard problem.
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

There’s broad consensus in the field of Traffic Signal Control research that mere installation of adaptive systems that adjust the timings of traffic lights in an area in a coordinated manner have potential to meaningfully reduce vehicle delay and emissions with some algorithms and techiques reporting the estimates in the range of $10percent$ to $30percent$ in simulated environments @petersReducingCarbonEmissions2009 @abidAIEnhancedTrafficSignal2026 @sakaza2025leveraging. Genetic algorithm                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        

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

= Literature Review

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

All experiments    

== Results

= Conclusions

= Acknowledgements
