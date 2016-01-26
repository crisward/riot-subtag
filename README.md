# Riot Subtag

A very small tag to help fix a performance issue I had with Riot's if statement.
It's much quick to use this tag, then change your tagname within your script.


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

<youtag>
  <subtag tag="{sometag}"></subtag>

  <script>
    @on('mount',function(){
      if (somecondition==true){
        this.subtag = "onetag"
      }else{
        this.subtag = "twotag"
      }
    })
  </script>
</youtag>

```

Any attributed added onto subtag will be passed down to your tag.
If the tag attribute is updated, your old tag will have unmount called and your new tag
will have mount called. You will have to run update after changing the tagname.




## License

(The MIT License)

Copyright (c) 2015 Cris Ward

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.