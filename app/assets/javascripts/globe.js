$(document).ready(function(){

  var feature;

  var width = $(window).width()

  var projection = d3.geo.azimuthal()
      .scale(width / 4)
      .origin([-71.03,42.37])
      .mode("orthographic")
      .translate([640, 400]);

  var circle = d3.geo.greatCircle()
      .origin(projection.origin());

  var scale = {
    orthographic: 380,
    stereographic: 380,
    gnomonic: 380,
    equidistant: 380 / Math.PI * 2,
    equalarea: 380 / Math.SQRT2
  };

  var path = d3.geo.path()
      .projection(projection);

  var svg = d3.select("#body").append("svg:svg")
      .attr("width", width / 4)
      .attr("height", 800)
      .on("mousedown", mousedown);

  d3.json("countries", function(collection) {
    feature = svg.selectAll("path")
        .data(collection.features)
      .enter().append("svg:path")
        .attr("d", clip);

    feature.append("svg:title")
        .text(function(d) { return d.properties.name; });

    $('path').on('mouseenter', function(){
      var country = $(this).find('title').text();
      $('#country').text(country);
    })

    $('path').on('dblclick', function(){
      // $.get('countries/show'

      // )
    })
  });

  d3.select(window)
      .on("mousemove", mousemove)
      .on("mouseup", mouseup);

  d3.select("select").on("change", function() {
    projection.mode(this.value).scale(scale[this.value]);
    refresh(750);
  });

  var m0,
      o0;

  function mousedown() {
    m0 = [d3.event.pageX, d3.event.pageY];
    o0 = projection.origin();
    d3.event.preventDefault();
  }

  function mousemove() {
    if (m0) {
      var m1 = [d3.event.pageX, d3.event.pageY],
          o1 = [o0[0] + (m0[0] - m1[0]) / 8, o0[1] + (m1[1] - m0[1]) / 8];
      projection.origin(o1);
      circle.origin(o1)
      refresh();
    }
  }

  function mouseup() {
    if (m0) {
      mousemove();
      m0 = null;
    }
  }

  function refresh(duration) {
    (duration ? feature.transition().duration(duration) : feature).attr("d", clip);
  }

  function clip(d) {
    return path(circle.clip(d));
  }

})
