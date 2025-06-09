################################################################################
# Define a rule to generate Makefile.prj from the project.tcl file
# using bdw_makegen, and include the generated file here.
################################################################################
include Makefile.prj

Makefile.prj : project.tcl
	@bdw_makegen

# Clean out undesirable junk files from the project directory
# Uses the automatically created clean_all target from Makefile.prj
clean : clean_all clean_libs
	@rm -f *.bak
	@rm -f *.BAK
	@rm -f Makefile.prj
	@rm -f msg_help.html
	@rm -f .stack.*
	@rm -f *.pro
	@rm -f *.pro.user
	@rm -f xrun.history
	@rm -f xrun.log
	@rm -f xmsc_run.log
	@rm -f .project.qws
	@rm -f .project.tcl.check
	@rm -f project.tcl.user
	@rm -f .stratus_ide_project_settings
	@rm -f stratus_ide.log

# Clean generated files before distributing the project
distclean : clean
	@rm -rf bdw_work
	@rm -rf cachelib

CLEAN : clean
