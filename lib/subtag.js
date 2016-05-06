
riot.tag('subtag', '<div riot-tag="{opts.tag}"><yield ></yield></div>', function(opts) {this.prevtag = null;

this.on('mount', function() {
  if (!opts.tag) {
    return;
  }
  this.prevtag = opts.tag;
  return this.mountedTag = riot.mount(this.root.querySelector('div'), opts.tag, opts)[0];
});

this.on('update', function() {
  if (this.prevtag && this.prevtag !== opts.tag) {
    this.prevtag = opts.tag;
    this.mountedTag.unmount(true);
    return this.mountedTag = riot.mount(this.root.querySelector('div'), opts.tag, opts)[0];
  }
});

this.on('unmount', function() {
  if (this.mountedTag) {
    return this.mountedTag.unmount(true);
  }
});

});