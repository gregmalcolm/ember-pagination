module 'Acceptances - Pagination',
  setup: ->
    App.reset()
    wait()

test 'widget renders', ->
  equal 2,2

widgetTest = (name,f) ->
  test name, ->
    visit("/widgets").then(f)

widgetTest 'list', ->
  res = []
  for w in find(".widget")
    res.push w.text().trim()

  equal res,['Adam']
  equal find(".widget:eq(0)").text().trim(),"Adam"

widgetTest 'show more', ->
  click(".more-link a").then ->
    equal find(".widget").length,2
    equal find(".widget:eq(1)").text().trim(),"Ben"

widgetTest 'has more link', ->
  equal find(".more-link a").length,1

widgetTest 'has more link goes away', ->
  click(".more-link a").then ->
    equal find(".more-link a").length,0