FILENAME?=initlab-logo

default: all

initlab-logo.png:
	$(MAKE) png

favicon-152.png:
	$(MAKE) favicon WIDTH=152

favicon-144.png:
	$(MAKE) favicon WIDTH=144

favicon-120.png:
	$(MAKE) favicon WIDTH=120

favicon-114.png:
	$(MAKE) favicon WIDTH=114

favicon-72.png:
	$(MAKE) favicon WIDTH=72

favicon-57.png:
	$(MAKE) favicon WIDTH=57

favicon-32.png:
	$(MAKE) favicon WIDTH=32

favicon-16.png:
	$(MAKE) favicon WIDTH=16

favicon.ico: favicon-16.png favicon-32.png
	convert favicon-16.png favicon-32.png favicon.ico

favicon:
	$(MAKE) png WIDTH=$(WIDTH)
	convert initlab-logo-$(WIDTH).png -gravity center -background None -extent $(WIDTH)x$(WIDTH) favicon-$(WIDTH).png

png:
ifndef WIDTH
	inkscape -e $(FILENAME).png -y 0 initlab-logo.svg
else
	inkscape -e $(FILENAME)-$(WIDTH).png -y 0 -w $(WIDTH) initlab-logo.svg
endif

clean:
	rm -f *.png
	rm -f *.ico

all: initlab-logo.png favicon-152.png favicon-144.png favicon-120.png favicon-114.png favicon-72.png favicon-57.png favicon-32.png favicon-16.png favicon.ico
