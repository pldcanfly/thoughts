jQuery(document).ready( ->
  jQuery("nav").find(".burger").click(  ->
    # TODO: Fix Doublemenu open
    jQuery(this).parents("nav").toggleClass("active")
  );
);
