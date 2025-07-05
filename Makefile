default: run

run:
	../engine/install/player/bin/player --premount ../engine/install/player/share/assets00.zip --premount ./assets01

clean:
	@echo "Cleaning..."