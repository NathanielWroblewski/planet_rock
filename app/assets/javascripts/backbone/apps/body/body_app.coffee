@PlanetRock.module 'BodyApp', (BodyApp, App, Backbone, Marionette, $, _, d3) ->

  BodyApp.on 'start', ->
    API.showBody()

  API =
    showBody: ->
      BodyApp.Show.Controller.showGlobe()
