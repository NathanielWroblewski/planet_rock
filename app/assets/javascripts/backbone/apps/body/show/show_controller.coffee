@PlanetRock.module 'BodyApp.Show', (Show, App, Backbone, Marionette, $, _, d3) ->

  @startWithParent = false

  Show.Controller =

    showGlobe: ->
      globeView = @getGlobeView()
      App.bodyRegion.show globeView

    getGlobeView: ->
      new Show.Globe
