(function() {
  var template = Handlebars.template, templates = Handlebars.templates = Handlebars.templates || {};
templates['home.html'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  


  return "<div class=\"container\"><div class=\"row\"><div class=\"span12\"><div class=\"hero-unit\"><h1>Web Audio Oscillator</h1></div></div></div><div class=\"row\"><div id=\"controls\"><div class=\"span1 offset2\"><button id=\"play\" class=\"btn btn-success\">Play</button></div><div class=\"span1 offset1\"><button id=\"stop\" class=\"btn btn-danger\">Stop</button></div></div></div><div class=\"row\"><div id=\"notes\"><div class=\"span1 offset1\"><label for=\"freq\">Frequency</label><input id=\"freq\" placeholder=\"2000\" name=\"freq\" type=\"text\"/></div><div class=\"span1 offset1\"><button id=\"update\" class=\"btn\">Update</button></div></div></div></div>";});
})();