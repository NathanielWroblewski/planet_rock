describe('jasmine is installed', function() {
  it('passes truth test', function() {
    expect(1 + 1).toBe(2);
    // phantom.exit();
  })
  it('has required dependencies', function() {
    expect(Backbone).toBeDefined();
    expect(_).toBeDefined();
    expect(Backbone.Marionette).toBeDefined();
  })
})


// RAILS_ENV=test bundle exec rake spec:javascript
describe('Our application', function (){
  beforeEach(function() {
    setFixtures('<div id="member"></div>')
    this.view = new myView({
      el: $('#member')
    })
  })

  it('starts', function() {
    App = new Marionette.Application()
    expect(App).toBe();
  })
})
