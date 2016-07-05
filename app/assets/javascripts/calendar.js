$(document).ready(function(){
    intializeDatepicker();
});

function intializeDatepicker() {
    $('.offer__form-datepicker').datepicker({
        todayHighlight: true,
        title: 'title'
    }).on('show changeDate',  function(e) {
        setDay(e);
    });
}

function setDay(e) {
    var day;

    if (e.date) {
        day = e.date.getDate();
    } else {
        day = new Date;
        day = day.getDate();
    }

    $('.datepicker-title').html(day);
}
