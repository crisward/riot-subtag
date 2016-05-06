tag1
  p hello

tag2
  p goodbye

tag3 
  p {hasmounted}
  script(type="text/coffee").
    @on 'mount',->
      @hasmounted = "Mounted"
      window.hasmounted = true

    @on 'unmount',->
      @hasmounted = "Mounted"
      window.hasunmounted = true

tag4
  p some content
  <yield />