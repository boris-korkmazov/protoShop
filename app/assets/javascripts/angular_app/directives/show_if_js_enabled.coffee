@app.directive("showIfJsEnabled", ->

  return {
    link:(scope, element, attrs)->
      element.removeClass('hidden')
  }
)