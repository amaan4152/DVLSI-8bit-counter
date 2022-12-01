SCRIPT=exec_workflow.sh

.PHONY:
	init pre post layout clean

init:
	mkdir logs dumpster
pre:
	source ~/.bashrc && ./$(SCRIPT) PRE_SYN $(EXP) $(TIME)

post:
	source ~/.bashrc && ./$(SCRIPT) POST_SYN $(EXP) $(TIME)

layout:
	source ~/.bashrc && ./$(SCRIPT) ICC

clean:
ifneq (,$(wildcard ./*.log*))
	@mv -f *.log* logs/misc/
endif
ifneq (,$(wildcard ./*_output.txt))
	@mv -f *_output.txt dumpster/cmd_outs/
endif
	@rm -f simv
	@rm -f default-*
	@rm -rf floorplan/
	@rm -rf icc2_design_lib/
	
