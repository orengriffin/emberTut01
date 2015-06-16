App = Ember.Application.create()

#Router

App.Router.map ->
  this.resource 'tables', ->
    this.resource 'table',
      path: ':table_id'


App.ApplicationRoute = Ember.Route.extend
  setupController: -> this.controllerFor('food').set 'model', App.Food.find()

App.TablesRoute = Ember.Route.extend
  model: -> App.Table.find()

App.TablesController = Ember.ArrayController.extend()

App.FoodController = Ember.ArrayController.extend()

App.TabController = Ember.ObjectController.extend()

App.Store = DS.Store.extend
  revision: 11
  adapter : 'DS.FixtureAdapter'

App.Table = DS.Model.extend
  tab: DS.belongsTo 'App.Tab'

App.Tab = DS.Model.extend
  tabItems: DS.hasMany 'App.TabItem'
  cents: ->
      this.get('tabItems').getEach('cents').reduce((accum, item)->
        accum + item)

App.TabItem = DS.Model.extend
  cents: DS.attr 'number'
  food : DS.belongsTo 'App.Food'

App.Food = DS.Model.extend
  name    : DS.attr 'string'
  imageUrl: DS.attr 'string'
  cents   : DS.attr 'number'

# Models
App.Table.FIXTURES = [
  id : 1
  tab: 1
,
  id : 2
  tab: 2
,
  id : 3
  tab: 3
,
  id : 4
  tab: 4
,
  id : 5
  tab: 5
,
  id : 6
  tab: 6

]

App.Tab.FIXTURES = [
  id      : 1,
  tabItems: []
,
  id      : 2,
  tabItems: []
,
  id      : 3,
  tabItems: []
,
  id      : 4,
  tabItems: [400, 401,
             402, 403, 404]
,
  id      : 5,
  tabItems: []
,
  id      : 6,
  tabItems: []

]

App.TabItem.FIXTURES = [
  id   : 400,
  cents: 1500
  food : 1
,
  id   : 401,
  cents: 300
  food : 2
,
  id   : 402,
  cents: 700
  food : 3
,
  id   : 403,
  cents: 950
  food : 1
,
  id   : 404,
  cents: 2000
  food : 5

]

App.Food.FIXTURES = [
  id      : 1,
  name    : 'Pizza',
  imageUrl: 'img/pizza.png',
  cents: 1500
,
  id      : 2,
  name    : 'Pancakes',
  imageUrl: 'img/pancakes.png'
  cents: 300

,
  id      : 3,
  name    : 'Fries',
  imageUrl: 'img/fries.png'
  cents: 700
,
  id      : 4,
  name    : 'Hot Dog',
  imageUrl: 'img/hotdog.png'
  cents: 590
,
  id      : 5,
  name    : 'Birthday Cake',
  imageUrl: 'img/birthdaycake.png'
  cents: 2000
,
]

window.App = App


