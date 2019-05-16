It is just another Dockerfile for [Gollum 5.x](https://github.com/gollum/gollum).
This image would be updated time to time.
If you prefer stable version, please use latest 4.x.

### Usage

Simplest way to use:
```
docker run --name gollum -p 4567:4567 neworldlt/gollum
```
And you could find Gollum at http://localhost:4567.

If you want use Gollum for bigger purpose than tests, you probably want to persist your data:
```
docker run --name gollum -p 4567:4567 -v $HOME/wikidata:/root/wikidata neworldlt/gollum
```

Also you could provide more config options:
```
docker run --name gollum -p 4567:4567 -v $HOME/wikidata:/root/wikidata neworldlt/gollum --allow-uploads=dir
```

You could run Gollum as daemon:
```
docker run --name gollum -d \
    -p 4567:4567 \
    -v $HOME/wikidata/wiki:/root/wikidata \
    --restart=always \
    neworldlt/gollum \
    --allow-uploads=dir
```

### Licence

```
The MIT License

Copyright (c) 2019 Andrius Semionovas

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```