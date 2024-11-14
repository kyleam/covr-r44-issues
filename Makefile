
.PHONY: all
all: output/rutils-r43.stdout
all: output/rutils-r44-drop-outer.stdout
all: output/rutils-r44-more-cache.stdout
all: output/rutils-r44.stdout


rutils_url = https://github.com/HenrikBengtsson/R.utils.git
rutils_commit = c80170c7ef244a6dd4bff541eecb1085d8849a9c

output/rutils-r43.stdout:
	./img-build.sh rutils-r43 4.3.3 '' '$(rutils_url)' '$(rutils_commit)'
	./img-run.sh rutils-r43

output/rutils-r44-drop-outer.stdout:
	./img-build.sh rutils-r44-drop-outer 4.4.2 drop-outer-gpd.diff \
	  '$(rutils_url)' '$(rutils_commit)'
	./img-run.sh rutils-r44-drop-outer

output/rutils-r44-more-cache.stdout:
	./img-build.sh rutils-r44-more-cache 4.4.2 gpd-more-cache.diff \
	  '$(rutils_url)' '$(rutils_commit)'
	./img-run.sh rutils-r44-more-cache

output/rutils-r44.stdout:
	./img-build.sh rutils-r44 4.4.2 '' '$(rutils_url)' '$(rutils_commit)'
	./img-run.sh rutils-r44
