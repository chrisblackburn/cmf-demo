//= require active_admin/base
//= require jquery-ui-timepicker-addon
//= require underscore
//= require eventable
//= require sir-trevor

$(function(){
  var instances = $('.sir-trevor-area'),
      l = instances.length, instance;

  while (l--) {
    instance = $(instances[l]);
    new SirTrevor.Editor({
      el: instance,
      blockTypes: ["Quote", "Heading", "Image", "Text", "Code", "Tweet", "List", "Video"]
    });
  }

  $('input.hasDatetimePicker').datetimepicker({
    dateFormat: "dd/mm/yy",
    beforeShow: function () {
      setTimeout(
        function () {
          $('#ui-datepicker-div').css("z-index", "3000");
        }, 100
      );
    }
  });
});
