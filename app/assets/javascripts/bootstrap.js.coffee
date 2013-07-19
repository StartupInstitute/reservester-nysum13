k = jQuery.noConflict()
k ->
  k("a[rel=popover]").popover()
  k(".tooltip").tooltip()
  k("a[rel=tooltip]").tooltip()