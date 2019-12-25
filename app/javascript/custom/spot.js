$(function() {
  // return $("#spot_postcode").jpostal({
  //   postcode: ["#spot_postcode"],
  //   address: {
  //     "#spot_prefecture_code": "%3",
  //     "#spot_address_city": "%4",
  //     "#spot_address_street": "%5%6%7"
  //   }
  // });
  $('.js-star-review').each(function() {
    score = $(this).data('score')
    readOnly = $(this).data('readOnly')
    $(this).raty({
      size     : 36,
      starOff: '/assets/star-off.png',
      starOn : '/assets/star-on.png',
      starHalf: '/assets/star-half.png',
      scoreName: 'spot[review]',
      half: true,
      readOnly: readOnly,
      score:  score
    });
  });
});