
This repository demonstrates two issues with covr and R 4.4:

 * calculating coverage for R.utils shows a substantial slowdown

 * calculating coverage for nanotime triggers an error ("'from' must
   be a finite number") when applying exclusions

The proposed fix under [patches/drop-outer-gpd.diff][f1] resolves the
above issues.  However, it surfaces a currently unreachable bug in
covr's `split_on_line_directives` helper (see the `drop-outer` case
for the pagenum package).

[patches/drop-outer-gpd-no-simplify.diff][f2] includes an additional
fix for that issue.

[f1]: /patches/drop-outer-gpd.diff
[f2]: /patches/drop-outer-gpd-no-simplify.diff


Slowdown
--------

**R 4.3 run**

https://github.com/kyleam/covr-r44-issues/blob/feacfae774e36b3e50a26a20804cf09b6d1d99b6/output/rutils-r43.stderr#L161

**R 4.4 run**

https://github.com/kyleam/covr-r44-issues/blob/feacfae774e36b3e50a26a20804cf09b6d1d99b6/output/rutils-r44.stderr#L161

**R 4.4 patched run**

https://github.com/kyleam/covr-r44-issues/blob/feacfae774e36b3e50a26a20804cf09b6d1d99b6/output/rutils-r44-drop-outer.stderr#L161


Exclusions error
----------------

**R 4.3 run**

https://github.com/kyleam/covr-r44-issues/blob/feacfae774e36b3e50a26a20804cf09b6d1d99b6/output/nanotime-r43.stderr#L17-L18

**R 4.4 run**

https://github.com/kyleam/covr-r44-issues/blob/feacfae774e36b3e50a26a20804cf09b6d1d99b6/output/nanotime-r44.stderr#L17-L22

**R 4.4 patched run**

https://github.com/kyleam/covr-r44-issues/blob/feacfae774e36b3e50a26a20804cf09b6d1d99b6/output/nanotime-r44-drop-outer.stderr#L17-L18
