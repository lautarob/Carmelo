$(document).on('turbolinks:load', function() {
  if ($('.travels.search').length > 0) {
    bindSearchAction();
  }
});

bindSearchAction = function() {
  var searchButton = $('[data-behavior~=search-travels]');

  searchButton.on('click', function(evt){
    evt.preventDefault();
    showFiltersSection();
  });
}

showFiltersSection = function() {
  var filterSection = $('.travels__results-section');

  filterSection.fadeIn();
}