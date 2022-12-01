# DVLSI-8bit-counter
![final_layout](https://user-images.githubusercontent.com/63811852/205077164-edbbc8ea-eb05-4713-a500-fb5cbb023749.png)

## Start
Create necessary directories: 
  - `dumpster/`: store `.vcd` waveform files after `vcs`
  - `logs/`: store any log files and command history logs of `dc_shell` and `icc2_shell`
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
