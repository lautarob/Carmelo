$(document).on('turbolinks:load', function() {
  if ($('.user_pages.offer').length > 0) {
    bindButtonsActions();
  }
});

bindButtonsActions = function() {
  var editButton = $('[data-behavior~=edit-travel]');
  var subscribersButton = $('[data-behavior~=travel-subscribers]');
  var deleteButton = $('[data-behavior~=delete-travel]');

  editButton.on('click', function(evt){
    evt.preventDefault();
    showEditModal();
  });

  subscribersButton.on('click', function(evt){
    evt.preventDefault();
    showSubscribers();
  });

  deleteButton.on('click', function(evt){
    evt.preventDefault();
    deleteTravel();
  });
}

showEditModal = function() {
  alert('Edit modal coming soon');
}

showSubscribers = function() {
  alert('Subscribers coming soon');
}

deleteTravel = function() {
  alert('Detele travel coming soon');
}
