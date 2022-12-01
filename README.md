# DVLSI-8bit-counter
## Start
```
make init
```
## Pre-Synthesis Simulation
The `ID` parameter is the experiment ID so that the generated VCD files, in the `dumpster/` directory, for pre-synthesis and post-synthesis will be tagged with a unique ID $ID_NUM.
The `TIME` parameter is the duration of the simulation to be executed. 
```
make pre ID=$ID_NUM TIME=$SIMULATION_DURATION
```

## Post-Synthesis Simulation
```
make post ID=$ID_NUM TIME=$SIMULATION_DURATION
```

## Layout (`floorplan`, `place_opt`, `clock_opt`, and `route_opt`)
```
make layout
```

## Clean Setup
```
make clean
```
