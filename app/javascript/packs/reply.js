$(function () {
  const scrollBottom = () => {
    let bottom = $(document).height() - $(window).height()
    $('html, body').animate({ scrollTop: bottom }, 1000);
  }

  $(document).on("click", ".reply", function () {
    scrollBottom();
    $('.comment_content').trigger('focus');
  });
})