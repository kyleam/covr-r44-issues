
.PHONY: all
all: output/pagenum-r43.stdout
all: output/pagenum-r44-drop-outer-no-simplify.stdout
all: output/pagenum-r44-drop-outer.stdout
all: output/pagenum-r44.stdout
all: output/rutils-r43.stdout
all: output/rutils-r44-drop-outer.stdout
all: output/rutils-r44-more-cache.stdout
all: output/rutils-r44.stdout

# pagenum

pagenum_url = https://github.com/kwstat/pagenum.git
pagenum_commit = 6accb808a26107c951896ef3ff9cf6a102b89113

output/pagenum-r43.stdout:
	./img-build.sh pagenum-r43 4.3.3 '' '$(pagenum_url)' '$(pagenum_commit)'
	./img-run.sh pagenum-r43

output/pagenum-r44-drop-outer.stdout:
	./img-build.sh pagenum-r44-drop-outer 4.4.2 drop-outer-gpd.diff \
	  '$(pagenum_url)' '$(pagenum_commit)'
	./img-run.sh pagenum-r44-drop-outer

output/pagenum-r44-drop-outer-no-simplify.stdout:
	./img-build.sh pagenum-r44-drop-outer-no-simplify 4.4.2 \
	  drop-outer-gpd-no-simplify.diff \
	  '$(pagenum_url)' '$(pagenum_commit)'
	./img-run.sh pagenum-r44-drop-outer-no-simplify

output/pagenum-r44.stdout:
	./img-build.sh pagenum-r44 4.4.2 '' '$(pagenum_url)' '$(pagenum_commit)'
	./img-run.sh pagenum-r44

# R.utils

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
