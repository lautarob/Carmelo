// $(document).on('turbolinks:load', function() {
//   if (isSearchView() || isOfferView()) {
//     intializeDatepicker();
//   }
// });

// isSearchView = function() {
//   return $('.user_pages.search').length > 0;
// }

// isOfferView = function() {
//     return $('.user_pages.offer').length > 0;
// }

// setDay = function(evt) {
//     var day;

//     if (evt.date) {
//         day = evt.date.getDate();
//     } else {
//         day = new Date;
//         day = day.getDate();
//     }

//     $('.datepicker-title').html(day);
// }

// intializeDatepicker = function() {
//     $('.user__form-datepicker').datepicker({
//         todayHighlight: true,
//         title: 'title'
//     }).on('show changeDate',  function(evt) {
//         setDay(evt);
//     });
// }
