# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

shuffle = (a) ->
  i = a.length
  while --i > 0
    j = ~~(Math.random() * (i + 1)) # ~~ is a common optimization for Math.floor
    t = a[j]
    a[j] = a[i]
    a[i] = t
  a

BUILDINGS =
  blue:   [ "Cottage" ]
  red:    [ "Farm", "Greenhouse", "Orchard", "Granary" ]
  orange: [ "Cloitser", "Abbey", "Temple", "Chapel" ]
  yellow: [ "Tailor", "Theater", "Bakery", "Merchant" ]
  gray:   [ "Millstone", "Shed", "Well", "Fountain" ]
  black:  [ "Factory", "Trading Post", "Bank", "Warehouse" ]
  green:  [ "Inn", "Almshouse", "Feast Hall", "Tavern" ]
  purple: [ "Obelisk of the Crescent", "Cathedral of Caterina", "Opaleye's Watch",
            "Archive of the Second Age", "The Starloom", "The Sky Baths", "Architect's Guild",
            "Grand Mausoleum of the Rodina", "Silva Forum", "Shrine of the Elder Tree",
            "Barrett Castle", "Grove University", "Statue of the Bondmaker", "Fort Ironweed" ]


App.TinyTownsRandomizer =
  randomize_building: (color) ->
    element = document.getElementById(color).getElementsByClassName("text")[0]
    element.innerHTML = shuffle(BUILDINGS[color])[0]
    return element.innerHTML

  randomize_until_different_building: (color) ->
    element = document.getElementById(color).getElementsByClassName("text")[0]
    old_building = element.innerHTML
    continue while old_building == App.TinyTownsRandomizer.randomize_building(color)
    return element.innerHTML

  randomize_all_buildings: ->
    App.TinyTownsRandomizer.randomize_building("blue")
    App.TinyTownsRandomizer.randomize_building("red")
    App.TinyTownsRandomizer.randomize_building("yellow")
    App.TinyTownsRandomizer.randomize_building("orange")
    App.TinyTownsRandomizer.randomize_building("green")
    App.TinyTownsRandomizer.randomize_building("gray")
    App.TinyTownsRandomizer.randomize_building("black")
    App.TinyTownsRandomizer.randomize_building("purple")

$(document).on "click", "[data-behavior~=randomize-building]", (event) ->
  event.preventDefault()
  color = this.getAttribute('data-color')
  App.TinyTownsRandomizer.randomize_until_different_building(color)

$(document).on "turbolinks:load", ->
  App.TinyTownsRandomizer.randomize_all_buildings()
