
# PARROT_TOOLS_DIR=/home/pitr/parrot-master/lib/3.2.0-devel/tools
PARROT_TOOLS_DIR=`parrot_config libdir``parrot_config versiondir`/tools

WINXED_FLAGS = -I src/ -L src

all: src/ZeroMQ.pbc src/ZeroMQ/Raw.pbc src/ZeroMQ/Constants.pasm

clean:
	rm src/ZeroMQ.pbc src/ZeroMQ/Raw.pbc src/ZeroMQ/Constants.pasm

%.pasm: %.winxed
	winxed $(WINXED_FLAGS) -o $@ --target=include $<

%.pir: %.winxed
	winxed $(WINXED_FLAGS) -o $@ -c $<

%.pbc: %.pir
	parrot -o $@ $<

%.pir: %.nci
	perl $(PARROT_TOOLS_DIR)/dev/ncidef2pir.pl $< $@

src/ZeroMQ.pir: src/ZeroMQ/Constants.pasm
