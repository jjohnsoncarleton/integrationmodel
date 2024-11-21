globals [
  percent-similar  ;; on the average, what percent of a turtle's neighbors
                   ;; are the same color as that turtle?
  percent-unhappy  ;; what percent of the turtles are unhappy?
  percent-similar-history
  want-history
  potspaces
  current-intolerance
  stopcheck
  xcull
  ycull

]

turtles-own [
  happy?           ;; for each turtle, indicates whether at least %-similar-wanted percent of
                   ;;   that turtle's neighbors are the same color as the turtle
  similar-nearby   ;; how many neighboring patches have a turtle with my color?
  other-nearby     ;; how many have a turtle of another color?
  total-nearby     ;; sum of previous two variables
  %-similar-wanted-new ;; updates similar wanted
  media-bias-turt
]

patches-own [
 nearbyturtles ;; the actual neighborhood around the grid cell
 %-red ;; percentage of red agents in the neighborhood of the grid cell
 %-green ;; percentage of red agents in the neighborhood of the grid cell
 region-bias
;  dis-part
]

to setup
  clear-all


  ;; create turtles on random patches.
  ask patches
  [
    if random 100 < density [   ;; set the occupancy density
      sprout 1 [ ifelse random 100 < red-percent [
        set color red] [set color green]
        ]
      ]


    set region-bias media-bias
;    set region-bias (ifelse-value pxcor >= 0 and pycor >= 0 [ bias-NE]
;      pxcor <= 0 and pycor > 0 [ bias-NW]
;      pxcor < 0 and pycor <= 0 [bias-SW]
;      pxcor >= 0 and pycor < 0 [bias-SE]
;    )


    ]




  ;; If we want to spawn agents in checkerboard formation (red, then green, then red, etc.)
  if checkerboard = true
  [
    ;; Clear the randomized initial state
    clear-all

    ;; everywhere spawn agents
    ask patches
    [
     ;; if the sum of coordinates  is odd sprout red otherwise green.
     ifelse (pxcor + pycor) mod 2 = 1
      [sprout 1 [set color red]]
      [sprout 1 [set color green]
    ]
  ]

    ;; we will remove agents so that we get the desired density
    set ycull item 0 get-row
    set xcull item 1 get-row

    ask turtles with [ycor <= ycull]
    [
      if ycor < ycull or xcor <= xcull
    [die]
    ]
  ]


  ask turtles [
    set %-similar-wanted-new %-similar-wanted

    ;; the two kinds of agents consume different kinds of media.
    ifelse color = red
    [ set media-bias-turt bias-red][  set media-bias-turt bias-green]

  ]
  ask patches [
   ; set nearbyturtles no-turtles

    set nearbyturtles (turtle-set turtles-on neighbors turtles-here)

    set  %-red  count nearbyturtles with [color = red] / (count nearbyturtles + 10 ^ (-15) )
    set  %-green  count nearbyturtles with [color = green] / (count nearbyturtles + 10 ^ (-15) )
;
;   let relR count nearbyturtles with [color = red] / count turtles with [color = red]
;   let relG count nearbyturtles with [color = green] / count turtles with [color = green]
;
;  set dis-part abs (relR - relG)
;


  ]
  ;ask turtles [set %-similar-wanted-new random-normal 10 5]

  set percent-similar-history []
  set want-history []
  update-turtles
  update-globals
  set stopcheck 100

  reset-ticks
end

;; run the model for one tick
to go


  ;if all? turtles [ happy? ] [ stop ]
  move-unhappy-turtles
  check-random-movement
  repeat wait-time [
    update-turtles
  ]
  update-globals


  ;; We will wait a certain amount of time before enacting our stopping conditions
  ;; We stop when the standard deviation of the set of average segegration for the last 100 steps is less than one
  ;; AND the standard deviation of the set of the average intolerance is less than 0.5
  if length percent-similar-history > stopcheck
  [

    ;; the index (plus one) of the end of the list of average segregation
    let endlist length percent-similar-history

    ;; this the list of the average segregation for the last 100 timesteps
    let subset sublist percent-similar-history (endlist - stopcheck) (endlist - 1)

    ;; the index (plus one) of the end of the list of average intolerance
    let endlist-want length  want-history
    ;; this the list of the average intolerance for the last 100 timesteps
    let subset-want sublist  want-history (endlist - stopcheck) (endlist - 1)


     if standard-deviation subset < 1 and standard-deviation subset-want < 0.5
    [
     stop
    ]



  ]

  ;; increment the timer
  tick
end

;; (only for checkboard initial condition) this is the code that calculates where remove turtles in order to get the desired density
to-report get-row

  ;; target amount of turtles according to density
  let amount-turtles round ((count turtles) * density / 100)

  ;; number of turtles to remove if
  let num-remove (count turtles - amount-turtles)

  ;; the number of turtles is world
  let width max-pxcor - min-pxcor + 1
  let row (floor (num-remove / (width))  - max-pxcor)
  let col ((num-remove mod width) - max-pxcor - 1)
  let output (list row col)

  report output

end

;; moving for reasons other than neighborhood composition
to check-random-movement
   ask turtles
  [
    ;; roll a 100 sided die to see if you move
    if random 100 <  non-racial-move-prob
    [find-new-spot-random]
  ]

end

;; unhappy turtles try a new spot
to move-unhappy-turtles

  ;; agents who have neighborhood compositions above their intolerance threshold will find a new spot
  ask turtles with [ not happy? ]
    [ find-new-spot]

;  ifelse count turtles with [not happy?] < (count turtles * 0.5)
;  [
;  ask turtles with [ not happy? ]
;    [ find-new-spot]
;
;  ]
;  [
;    ask n-of (round (count turtles * 0.5)) turtles with [not happy?]
;  [find-new-spot   ]
;
;  ]
;   [ find-new-spot-old ]
end






;; move to a random a spot
to find-new-spot-random
  ;; this is the set of spaces without any agents on them
  set potspaces patches with [not any? turtles-here]
  ;; select an empty space at random
  move-to one-of potspaces
end

;to find-new-spot-old
;  rt random-float 360
;  fd random-float 10
;  if any? other turtles-here [ find-new-spot-old ] ;; keep going until we find an unoccupied patch
;  move-to patch-here  ;; move to center of patch
;end


;to find-new-spot
;
;  set potspaces patches with [not any? turtles-here]
;  set current-intolerance %-similar-wanted-new / 100
;  ifelse color = red [
;
;    ifelse (max [ %-red ] of potspaces > current-intolerance )  [
;      move-to one-of potspaces with [%-red >= current-intolerance  ]][
;
;     ;   move-to one-of potspaces
;    ]
;
;
;
;
;  ]
;  [
;    ifelse (max [ %-green ] of potspaces > current-intolerance )  [
;      move-to one-of potspaces with [%-green >= current-intolerance  ]][
;
;    ;    move-to one-of potspaces
;    ]
;
;  ]
;
;
;
;end


;; this is the function that determines where unhappy agents move to
to find-new-spot

  ;; Set of grid spaces that do not have any agents on them.
  set potspaces patches with [not any? turtles-here]

  ;; Get the intolerance of the agent
  set current-intolerance %-similar-wanted-new / 100

  ;; Unhappy agents look for an empty spot with the percentage of surrounding agents with the same color
  ;; that is equal or larger than their current intolerance levels if they cannot find a spot that satisfies this
  ;; then they move to a spot with the largest percentage of agents that matches their color
  ifelse color = red
  [

    ;; this is the agent looking for potential spaces to move
    ifelse (max [ %-red ] of potspaces >= current-intolerance )
    [
      ;; move to a space that works
      move-to one-of potspaces with [%-red >= current-intolerance]
    ]
    [
      ;; move to a spot with the largest percentage of agents that matches their color
      let maxred  max [%-red] of potspaces
      move-to one-of potspaces with [%-red = maxred]
    ]
  ]
  [

    ;; same procedure but for green agents
    ifelse max [ %-green ] of potspaces >= current-intolerance
    [
      move-to one-of potspaces with [%-green >= current-intolerance]
    ]
    [
      let maxgreen  max [%-green] of potspaces
      move-to one-of potspaces with [%-green = maxgreen]
    ]

  ]



end

;; update all running parameters for the agents
to update-turtles

  ask turtles
  [
    ;; in next two lines, we use "neighbors" to test the eight patches
    ;; surrounding the current patch

    ;; # of agents that match the color of the current agent
    set similar-nearby count (turtles-on neighbors)  with [ color = [ color ] of myself ]
    ;; # of agents that do not match the color of the current agent
    set other-nearby count (turtles-on neighbors) with [ color != [ color ] of myself ]
    ;; all the agents on the neighboring patches
    set total-nearby similar-nearby + other-nearby

    ;; this is the % of agents that are the same color as you in your neighborhood
    let %-similar-nearby 0
    ifelse total-nearby > 0
    [ set %-similar-nearby similar-nearby / total-nearby] [set %-similar-nearby 0 ]

    ;; this the difference between your desired percentage and your acutal percentage of agents that are similar to you
    let neighborhooddiff ( %-similar-nearby - %-similar-wanted-new / 100)

    ;; adjust the intolerance based on your intolerance and the difference between your desired percentage and your acutal percentage of agents that are similar to you
    set %-similar-wanted-new %-similar-wanted-new + intolerance-adjust neighborhooddiff (%-similar-wanted-new / 100)

    ;; if the % desired goes outside of the interval [0 100] then set it back to 0.01 or 99.99
    set %-similar-wanted-new  max list min list (%-similar-wanted-new * media-bias-turt) 99.99 0.01

    ;; set a flag that marks you as happy if there is enough agents that are like you nearby
    set happy? similar-nearby >= (%-similar-wanted-new * total-nearby / 100)


    ;; add visualization
    if visualization = "old" [ set shape "default" ]
    if visualization = "square-x" [
      ifelse happy? [ set shape "square" ] [ set shape "square-x" ]
    ]

  ]
end

;; update all the running numbers for the world
to update-globals

  ;; in line with the way the Wilensky, U. (1997) made his netlogo model,
  ;; we measure segregation in the same fashion

  ;; for each agent add the number of agents that of the same type near them
  let similar-neighbors sum [ similar-nearby  ] of turtles

  ;; for each agent add the number of agents that near them (regardless of type)
  let total-neighbors sum [ total-nearby ] of turtles

  ;; Divide the two numbers
  set percent-similar (similar-neighbors / total-neighbors) * 100

  ;; Measure the percentage not happy with their neighborhood configuration
  set percent-unhappy (count turtles with [ not happy? ]) / (count turtles) * 100

  ;; Keep track of this round's percent-similar (measure of segregation)
  set percent-similar-history lput percent-similar  percent-similar-history


  ;; Keep track of this round's average intolerance
  set want-history lput mean ([%-similar-wanted-new] of turtles ) want-history


  ;; want to keep track of the % of each kind on agent around a patch (even empty ones)
  ;; this is useful when agents want to move to a new (empty) spot
  ask patches
  [

    ;; This is the set of agents around a
    set nearbyturtles (turtle-set turtles-on neighbors turtles-here)


    ifelse count nearbyturtles > 0
    [
      set  %-red  count nearbyturtles with [color = red] / (count nearbyturtles)
      set  %-green  count nearbyturtles with [color = green] / (count nearbyturtles  )
    ]
    [
      set  %-red 0
      set  %-green 0
    ]


  ]
end


to-report intolerance-adjust [diff tol]


  ;; This is the equation I_j (1-I_j) * (%_j-I_j) *( 1-((%_j-I_j)/lambda)^2 )
 let reaction   tol * (1 - tol) * diff * (1 - (diff / repulsion_distance) ^ 2 ) * adaptability;



  ;; random alterate reaction equation
; let reaction diff * (1 - (diff / repulsion_distance) ^ 2 ) * (repulsion_distance ^ 3 / (1 - repulsion_distance))
;    let reaction 0
;  ifelse diff > 0
;  [
;    set reaction  rightval * tol * (1 - tol) * diff * (1 - (diff / repulsion_distance) ^ 2 ) * adaptability;
;
;  ]
;  [
;    set reaction   tol * (1 - tol) * diff * (1 - (diff / repulsion_distance) ^ 2 ) * adaptability;
;  ]
; let reaction   diff * (1 - (diff / repulsion_distance) ^ 2 ) * adaptability;
;let reaction   tol * (1 - tol) * diff * (1 - (diff / rightval)) *  (1 + (diff / leftval)) * adaptability;
; let reaction   tol * (1 - tol) * diff * (1 + (diff / repulsion_distance)  ) * adaptability
; let reaction  sin (diff * 180 / repulsion_distance) * adaptability
;let reaction  diff * (1 - (diff / repulsion_distance) ^ 2 ) * adaptability

  report reaction


end






;; not used but was attempting to program the Theil Index as an alternate measure of segregation
to-report Theil


  let per-red (count turtles with [color = red] / count turtles) * ln (count turtles with [color = red] / count turtles)
  let per-green (count turtles with [color = green] / count turtles) * ln (count turtles with [color = green] / count turtles)

  let entropy -1 * per-red * ln (per-red) - per-red * ln (per-red)
  let T 0

    ask turtles [
    ;; in next two lines, we use "neighbors" to test the eight patches
    ;; surrounding the current patch

    let loc-red (count (turtles-on neighbors) with [color = red] / count (turtles-on neighbors)) * ln (count (turtles-on neighbors) with [color = red] / count (turtles-on neighbors))
    let loc-green (count (turtles-on neighbors) with [color = green] / count (turtles-on neighbors)) * ln (count (turtles-on neighbors) with [color = green] / count (turtles-on neighbors))
    let loc-entropy -1 * loc-red * ln (loc-red) - loc-red * ln (loc-red)
    set total-nearby similar-nearby + other-nearby
    let %-similar-nearby similar-nearby / (total-nearby + 10 ^ (-15) )
  ]


end
