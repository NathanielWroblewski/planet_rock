function renderGlobe() {
  var feature;

  var width = $(window).width()
  var height = $(window).height()

  var projection = d3.geo.azimuthal()
      .scale(width / 4)
      .origin([-71.03,42.37])
      .mode("orthographic")
      .translate([width/2, height/2]);

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
      .attr("width", width)
      .attr("height", height)
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
      var selectedCountry = $(this).find('title').text();
      $.get('countries/show/' + encodeURIComponent(selectedCountry), {
      }).done(function(response) {
        var url = response.url.replace('watch?v=', 'embed/') + '?autoplay=1';
        $('#music').attr('src', url);
        $('#hint').html('<h2 style="color:rgba(140, 137, 125, 1);">' +
          response.country + '<span style="color:rgba(140, 137, 125, 0.7);"> ' +
           response.artist + '</span></h2>');
      });
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
}

$(window).ready(function() {
  renderGlobe();

  $(window).on('resize', function() {
    $('svg').detach();
    renderGlobe();
    if ($(window).width() < 700) {
      $('#country').css('font-size', '42px');
    }
    else {
      $('#country').css('font-size', '72px');
    }
  })
})
