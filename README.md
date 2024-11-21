# integrationmodel
README for NetLogo Model: Segregation Dynamics Simulation
## Overview

This NetLogo model simulates the dynamics of segregation and tolerance in a population of agents (turtles) with varying preferences for neighbors of their own "type" (color). It allows for the exploration of social dynamics such as neighborhood composition, media bias effects, and adaptive intolerance.

## Features
Agents and Patches:

Turtles (agents) interact and move based on their preferences and neighborhood conditions.
Patches track neighborhood composition and serve as locations for agents.
Key Parameters:

Intolerance Levels: Agents adjust their intolerance dynamically based on interactions.

Media Bias: Influences the intolerance of agents based on their type.

Density and Checkerboard Setup: Configurable initial placement of agents.

Segregation Metrics: Calculates percentage similarity in neighborhoods.
Behavioral Rules:

Agents move if unhappy with their neighborhood (based on percentage similarity).
Random movements simulate external motivations beyond neighborhood preferences.
Neighborhood composition and global segregation are updated in every tick.
Model Structure

## Globals

percent-similar: Average similarity of agents' neighbors.

percent-unhappy: Percentage of agents dissatisfied with their neighborhoods.

percent-similar-history: Historical record of global segregation levels.
want-history: Tracks average intolerance levels over time.

## Turtle Variables

happy?: Boolean indicating if an agent is satisfied with its neighborhood.
similar-nearby, other-nearby, total-nearby: Neighborhood composition metrics.

%-similar-wanted-new: Dynamic intolerance threshold.
media-bias-turt: Bias specific to the agent's type.

## Patch Variables

nearbyturtles: Agents near a specific patch.

%-red, %-green: Proportion of red and green agents in a patch's neighborhood.

region-bias: Regional media influence.

## Usage Instructions

Setup:

Adjust parameters such as density, bias, and checkerboard in the interface.
Run setup to initialize the simulation.

Run:

Press go to start the simulation.
Agents will move based on their happiness and neighborhood composition.

Stop Conditions:

Simulation halts when segregation metrics stabilize over a defined history length.

## Configuration Parameters

density: Controls agent occupancy density.

red-percent: Proportion of red agents at the start.

non-racial-move-prob: Probability of random agent movements. Moves regardless if satisfied with neighborhood composition.

media-bias: Media influence on agent intolerance.

adaptability: Sensitivity of agents to neighborhood differences.

repulsion_distance: Maximum tolerable difference before agents move.

## Outputs

Visualization: Dynamic visualization of agent positions and happiness.

Segregation Metrics: percent-similar and percent-unhappy track segregation levels.

Dynamic Intolerance: Evolution of average intolerance levels over time.

## Advanced Features

Checkerboard Initialization: Sets up alternating agent types to study initial conditions.

Stopping Conditions: Based on stabilization of segregation metrics and intolerance levels.

Historical Tracking: Records segregation and intolerance trends for analysis.
