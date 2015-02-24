//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require fastclick/fastclick.js
//= require chart/Chart.js

var Bilki = {
  onPageChange: function(){
    Bilki.navigationActiveStates();
    Bilki.initStats();
  },

  navigationActiveStates: function(){
    $('.nav .active').removeClass('active');
    $('.nav a').each(function(index, item){
      var href = $(item).attr('href')
      if(window.location.pathname == href){
        $(item).parent().addClass('active');
      }
    });
  },

  initStats: function(){
    if($("#stats").length > 0){
      c = $("#spending")
      w = c.parent().width();
      c.prop('width', w);
      var ctx = $("#spending").get(0).getContext("2d");
      var spendingChart = new Chart(ctx).Line(SpendingData);
    }
  }
}

window.addEventListener('load', function() {
    FastClick.attach(document.body);

    $(document).on('page:change', Bilki.onPageChange)
    $(document).trigger('page:change');

    $(document).on('click', '.btn-bill', function(e){
      var btn = $(this)
      btn.button('loading');
    });

}, false);


