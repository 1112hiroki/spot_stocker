$(function() {
  return $("#spot_postcode").jpostal({
    postcode: ["#spot_postcode"],
    address: {
      "#spot_prefecture_code": "%3",
      "#spot_address_city": "%4",
      "#spot_address_street": "%5%6%7"
    }
  });
});