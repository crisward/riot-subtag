subtag
  div(riot-tag="{opts.tag}")
    <yield />
    
  script(type="text/coffee").
    @prevtag = null

    @on 'mount',->
      return if !opts.tag
      @prevtag = opts.tag
      @mountedTag = riot.mount(@root.querySelector('div'),opts.tag,opts)[0]

    @on 'update',->
      if @prevtag && @prevtag != opts.tag
        @prevtag = opts.tag
        @mountedTag.unmount(true)
        @mountedTag = riot.mount(@root.querySelector('div'),opts.tag,opts)[0]
      else if @mountedTag
        @mountedTag.opts = opts
        @mountedTag.update()

    @on 'unmount',->
      @mountedTag.unmount(true) if @mountedTag