
.PHONY: all
all: output/rutils-r43.stdout
all: output/rutils-r44-drop-outer.stdout
all: output/rutils-r44-more-cache.stdout
all: output/rutils-r44.stdout

output/rutils-r43.stdout:
	./covr-rutils-build.sh r43 4.3.3 ''
	./covr-rutils-run.sh r43

output/rutils-r44-drop-outer.stdout:
	./covr-rutils-build.sh r44-drop-outer 4.4.2 drop-outer-gpd.diff
	./covr-rutils-run.sh r44-drop-outer

output/rutils-r44-more-cache.stdout:
	./covr-rutils-build.sh r44-more-cache 4.4.2 gpd-more-cache.diff
	./covr-rutils-run.sh r44-more-cache

output/rutils-r44.stdout:
	./covr-rutils-build.sh r44 4.4.2 ''
	./covr-rutils-run.sh r44
