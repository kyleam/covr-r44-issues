
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

### data.table

**R 4.3 run**

https://github.com/kyleam/covr-r44-issues/blob/fab8e7bc7fd9705f0671ebf0bf23eecb83780be5/output/datatable-r43.stderr#L97

**R 4.4 run**

https://github.com/kyleam/covr-r44-issues/blob/fab8e7bc7fd9705f0671ebf0bf23eecb83780be5/output/datatable-r44.stderr#L21

**R 4.4 patched run**

https://github.com/kyleam/covr-r44-issues/blob/fab8e7bc7fd9705f0671ebf0bf23eecb83780be5/output/datatable-r44-drop-outer.stderr#L97

### diffobj

**R 4.3 run**

https://github.com/kyleam/covr-r44-issues/blob/fab8e7bc7fd9705f0671ebf0bf23eecb83780be5/output/diffobj-r43.stderr#L45

**R 4.4 run**

https://github.com/kyleam/covr-r44-issues/blob/fab8e7bc7fd9705f0671ebf0bf23eecb83780be5/output/diffobj-r44.stderr#L21

**R 4.4 patched run**

https://github.com/kyleam/covr-r44-issues/blob/fab8e7bc7fd9705f0671ebf0bf23eecb83780be5/output/diffobj-r44-drop-outer.stderr#L45

### R.utils

**R 4.3 run**

https://github.com/kyleam/covr-r44-issues/blob/fab8e7bc7fd9705f0671ebf0bf23eecb83780be5/output/rutils-r43.stderr#L161

**R 4.4 run**

https://github.com/kyleam/covr-r44-issues/blob/fab8e7bc7fd9705f0671ebf0bf23eecb83780be5/output/rutils-r44.stderr#L161

**R 4.4 patched run**

https://github.com/kyleam/covr-r44-issues/blob/fab8e7bc7fd9705f0671ebf0bf23eecb83780be5/output/rutils-r44-drop-outer.stderr#L161


Exclusions error
----------------

### data.table

**R 4.3 run**

https://github.com/kyleam/covr-r44-issues/blob/fab8e7bc7fd9705f0671ebf0bf23eecb83780be5/output/datatable-r43.stderr#L15-L16

**R 4.4 run**

https://github.com/kyleam/covr-r44-issues/blob/fab8e7bc7fd9705f0671ebf0bf23eecb83780be5/output/datatable-r44.stderr#L15-L20

**R 4.4 patched run**

https://github.com/kyleam/covr-r44-issues/blob/fab8e7bc7fd9705f0671ebf0bf23eecb83780be5/output/datatable-r44-drop-outer.stderr#L15-L16

### diffobj

**R 4.3 run**

https://github.com/kyleam/covr-r44-issues/blob/fab8e7bc7fd9705f0671ebf0bf23eecb83780be5/output/diffobj-r43.stderr#L15-L16

**R 4.4 run**

https://github.com/kyleam/covr-r44-issues/blob/fab8e7bc7fd9705f0671ebf0bf23eecb83780be5/output/diffobj-r44.stderr#L15-L20

**R 4.4 patched run**

https://github.com/kyleam/covr-r44-issues/blob/fab8e7bc7fd9705f0671ebf0bf23eecb83780be5/output/diffobj-r44-drop-outer.stderr#L15-L16

### nanotime

**R 4.3 run**

https://github.com/kyleam/covr-r44-issues/blob/fab8e7bc7fd9705f0671ebf0bf23eecb83780be5/output/nanotime-r43.stderr#L17-L18

**R 4.4 run**

https://github.com/kyleam/covr-r44-issues/blob/fab8e7bc7fd9705f0671ebf0bf23eecb83780be5/output/nanotime-r44.stderr#L17-L22

**R 4.4 patched run**

https://github.com/kyleam/covr-r44-issues/blob/fab8e7bc7fd9705f0671ebf0bf23eecb83780be5/output/nanotime-r44-drop-outer.stderr#L17-L18
