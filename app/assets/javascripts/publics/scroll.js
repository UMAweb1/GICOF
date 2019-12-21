$(function() {
  $('.dm_scroll').jscroll({
    contentSelector: '.scroller',
    nextSelector: 'nav>.pagination>.page-item a[rel=next]',
    autoTrigger: true,
    padding: 200
  });

  $('.posts_all').jscroll({
    contentSelector: '.scroller',
    nextSelector: 'nav>.pagination>.page-item a[rel=next]',
    autoTrigger: true,
    padding: 200
  });
});