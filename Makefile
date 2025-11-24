#makefile idek what am i doing
#lonely coder 2am
alltargets := $(filter-out ./Makefile,$(shell find . -type f -name "Makefile"))#exclude this makefile
allfolders := $(alltargets:%/Makefile=%)#get the folder of the makefile 
allfiles := $(filter-out $(alltargets),$(wildcard $(allfolders)/*))#find the files in the same folder as submake(what even is this lol)
folders ?=
comma :=,
empty :=
space :=$(empty) $(empty)
folders = $(subst $(comma),$(space),$(folders))

ifdef folders

all: broadcast $(folders)/Makefile

.PHONY: broadcast

broadcast:
	@echo selected folders, now executing make for specified folders:
	@echo now making file for folders: $(folders)

$(folders)/Makefile: $(filter %/Makefile,%,$@)
	@$(MAKE) -C $(@:%/Makefile=%)

else
.PHONY: all $(alltargets)
all: $(alltargets)

$(alltargets):
#	echo $(@:%/Makefile=%)
	@$(MAKE) -C $(@:%/Makefile=%)
		

endif


%/Makefile: %
	$(MAKE) -C $*
