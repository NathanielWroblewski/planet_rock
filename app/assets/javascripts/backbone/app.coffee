@PlanetRock = do (Backbone, Marionette) ->
  App = new Marionette.Application
  App.addRegions
    headerRegion: '#body'
    headerRegion: '#country'

  App.addInitializer ->
    App.module('#bodyApp').start()
    App.module('#countryApp').start()

  App.on 'initialize:after', ->
    Backbone.History.start() if Backbone.History

  App
