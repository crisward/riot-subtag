<img src="https://cdn.rawgit.com/crisward/riot-subtag/master/subtag-logo.svg" height="140"/>

[![Build Status](https://api.travis-ci.org/crisward/riot-subtag.svg?branch=master)](https://travis-ci.org/crisward/riot-subtag)
[![Coverage Status](https://coveralls.io/repos/github/crisward/riot-subtag/badge.svg?branch=master)](https://coveralls.io/github/crisward/riot-subtag?branch=master)
[![npm](https://img.shields.io/npm/dm/riot-subtag.svg)](https://www.npmjs.com/package/riot-subtag)

A very small tag to help fix a performance issue I had with Riot's `if` attribute.
It's much quicker to use this tag, then change your tagname within your script.

**Note:**
This is no longer required with riot 3.0.
Simply use 

```html
<div data-is="{sometag}"></div>
```

Riot 2.* users, see below

## Installing

```
npm install riot-subtag
```

## Usage

```javascript
//app.js

riot = require('riot')
require('riot-subtag')
```

```html
//your.tag

<yourtag>
  <subtag tag="{sometag}"></subtag>

  <script>
    @on('mount',function(){
      if (somecondition==true){
        this.sometag = "onetag"
      }else{
        this.sometag = "twotag"
      }
    })
  </script>
</yourtag>

```

Any attributed added onto subtag will be passed down to your tag.
If the tag attribute is updated, your old tag will have unmount called and your new tag
will have mount called. You will have to run update after changing the tagname.

## Yielding

Subtag now yields its content.

```html
//your.tag

<yourtag>
  <subtag tag="{sometag}">Yield This</subtag>

  <script>
    @on('mount',function(){
      if (somecondition==true){
        this.subtag = "myh1"
      }else{
        this.subtag = "myh2"
      }
    })
  </script>
</youtag>

<myh1><h1><yield /></h1></myh1>
<myh2><h2><yield /></h2></myh2>

```

## Options

Subtag passes down options to your named tag

```
<yourtag>
  <subtag tag="{othertag}" message="hello"></subtag>
</youtag>

<othertag>
  <p>{opts.message}</p>
</othertag>

```


## Credit

My noun project worship continues - check them out for
cool creative commons logo ideas - [Noun Project](https://thenounproject.com/)

## License

(The MIT License)

Copyright (c) 2015 Cris Ward

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.