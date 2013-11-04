@PlanetRock.module 'BodyApp.Show', (Show, App, Backbone, Marionette, $, _, d3) ->

  class Show.Globe extends Marionette.ItemView

    template: 'logo/show/templates/show_logo'

    initialize: ->
      @width = @calculateWidth()
      $(window).on 'resize', @rerender

    render: ->
      @appendSVG()

    events:
      'window resize': 'updateGlobeSize'

    appendSVG: ->



