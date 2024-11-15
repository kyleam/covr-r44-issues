 * [Overview](#overview)
 * [Slowdown](#slowdown)
   * [data.table](#datatable)
   * [diffobj](#diffobj)
   * [R.utils](#rutils)
 * [Exclusions error](#exclusions-error)
   * [data.table](#datatable-1)
   * [diffobj](#diffobj-1)
   * [nanotime](#nanotime)

Overview
--------

This repository demonstrates two issues with covr and R 4.4:

 * calculating coverage for R.utils shows a substantial slowdown

 * calculating coverage for nanotime triggers an error ("'from' must
   be a finite number") when applying exclusions

The [patches/](/patches) subdirectory contains the following patches:

 * [drop-outer-gpd.diff][f1]: the simplest change that resolves the
    above issues.

 * [drop-outer-gpd-no-simplify.diff][f2]: a fix for a currently
    unreachable bug in covr's `split_on_line_directives` helper (see
    the `drop-outer` case for the pagenum package).

 * [proposed-v1][f3]: the actual fix proposed upstream


[f1]: /patches/drop-outer-gpd.diff
[f2]: /patches/drop-outer-gpd-no-simplify.diff
[f3]: /patches/proposed-v1.diff


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
