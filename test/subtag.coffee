window.riot = require 'riot'
subtag = require '../lib/subtag.js'
simulant = require 'simulant'
require './sampletags.tag'

describe "subtag",->


  beforeEach ->
    @domnode = document.createElement('subtag')
    @node = document.body.appendChild(@domnode)

  after ->
    @domnode = ''
    @tag.unmount()    

  it "should display tag1 outputing hello",->
    @tag = riot.mount(@domnode,'subtag',{tag:'tag1'})[0]
    expect(document.body.textContent).to.contain('hello')

  it "should change from one tag to another",->
    opts = {tag:'tag1'}
    @tag = riot.mount(@domnode,'subtag',opts)[0]
    expect(document.body.textContent).to.contain('hello')

    opts.tag = 'tag2'
    @tag.update()
    expect(document.body.textContent).to.contain('goodbye')

  it "should call mount and unmount on tags as they are changed",->
    expect(window.hasmounted).to.be.undefined
    opts = {tag:'tag3'}
    @tag = riot.mount(@domnode,'subtag',opts)[0]
    expect(window.hasmounted).to.be.true

    expect(window.hasunmounted).to.be.undefined
    opts = {tag:'tag2'}
    @tag = riot.mount(@domnode,'subtag',opts)[0]
    expect(window.hasunmounted).to.be.true

  it "shouldn't go mental if no tag is set",->
    opts = {}
    @tag = riot.mount(@domnode,'subtag',opts)[0]
    
  it "should yield internal content",->
    @domnode.innerHTML = "it yielded"
    opts = {tag:'tag4'}
    @tag = riot.mount(@domnode,'subtag',opts)[0]
    expect(document.body.textContent).to.contain('some content')
    expect(document.body.textContent).to.contain('it yielded') 
    opts.tag = 'tag5'
    @tag.update()
    expect(document.body.textContent).to.contain('it yielded')

  it "should update passed in opts when they change",->
    opts = {tag:'tag6',message:"message1"}
    @tag = riot.mount(@domnode,'subtag',opts)[0]
    expect(document.body.textContent).to.contain('message1')
    opts.message = "updated"
    @tag.update()
    expect(document.body.textContent).to.contain('updated')