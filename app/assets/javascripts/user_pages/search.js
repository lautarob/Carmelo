$(document).on('turbolinks:load', function() {
  if ($('.user_pages.search').length > 0) {
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
  var filterSection = $('.user__results-section');

  filterSection.fadeIn();
}