$(document).on('turbolinks:load', function() {
  if ($('.travels.search').length > 0) {
    initSliders();
  }
});

initAgeSlider = function() {
  var ageSlider = $('#travels__filter-age-slider');
  var minValue = 18;
  var maxValue = 70;

  ageSlider.slider({
    animate: "fast",
    range: true,
    min: minValue,
    max: maxValue,
    values: [ minValue, maxValue ],
    slide: function( event, ui ) {
      $("#minAge").html(ui.values[0]);
      $("#maxAge").html(ui.values[1]);
    }
  });

  $("#minAge").html(ageSlider.slider('values')[0]);
  $("#maxAge").html(ageSlider.slider('values')[1]);
}

initModelSlider = function() {
  var modelSlider = $('#travels__filter-model-slider');
  var minValue = 1930;
  var maxValue = 2016;

  modelSlider.slider({
    animate: "fast",
    range: true,
    min: minValue,
    max: maxValue,
    values: [ minValue, maxValue ],
    slide: function( event, ui ) {
      $("#minModel").html(ui.values[0]);
      $("#maxModel").html(ui.values[1]);
    }
  });

  $("#minModel").html(modelSlider.slider('values')[0]);
  $("#maxModel").html(modelSlider.slider('values')[1]);
}

initSliders = function() {
  initAgeSlider();
  initModelSlider();
}
