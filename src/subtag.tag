subtag
  div(riot-tag="{opts.tag}")

  script(type="text/coffee").
    @prevtag = null

    @on 'mount',->
      @prevtag = opts.tag
      @mountedTag = riot.mount(@root.querySelector('div'),opts.tag,opts)[0]

    @on 'update',->
      if @prevtag && @prevtag != opts.tag
        @prevtag = opts.tag
        @mountedTag.unmount(true)
        @mountedTag = riot.mount(@root.querySelector('div'),opts.tag,opts)[0]
        
    @on 'unmount',->
      @mountedTag.unmount(true)