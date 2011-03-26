
# PARROT_TOOLS_DIR=/home/pitr/parrot-master/lib/3.2.0-devel/tools
PARROT_TOOLS_DIR=`parrot_config libdir``parrot_config versiondir`/tools

all: src/ZeroMQ.pbc src/ZeroMQ/Raw.pbc

clean:
	rm src/ZeroMQ.pbc
	rm src/ZeroMQ/Raw.pbc

%.pir: %.winxed
	winxed -o $@ -c $<

%.pbc: %.pir
	parrot -o $@ $<

%.pir: %.nci
	perl $(PARROT_TOOLS_DIR)/dev/ncidef2pir.pl $< $@

