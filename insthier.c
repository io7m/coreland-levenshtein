#include "ctxt.h"
#include "install.h"

struct install_item insthier[] = {
  {INST_MKDIR, 0, 0, ctxt_bindir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_incdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_dlibdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_slibdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_repos, 0, 0, 0755},
  {INST_COPY, "levenshtein-conf.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "levenshtein.ads", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "levenshtein.ads", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "levenshtein.adb", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "levenshtein.adb", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "levenshtein_comp.adb", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "levenshtein_comp.adb", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "levenshtein.ali", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "levenshtein.ali", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "levenshtein_comp.ali", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "levenshtein_comp.ali", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "levenshtein.sld", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "levenshtein.a", "liblevenshtein.a", ctxt_slibdir, 0, 0, 0644},
  {INST_COPY, "levenshtein-conf.ld", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY_EXEC, "levenshtein-conf", 0, ctxt_bindir, 0, 0, 0755},
  {INST_COPY, "levenshtein-comp.ald", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY_EXEC, "levenshtein-comp", 0, ctxt_bindir, 0, 0, 0755},
};
unsigned long insthier_len = sizeof(insthier) / sizeof(struct install_item);
