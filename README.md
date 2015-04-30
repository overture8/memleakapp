## MemLeakApp

This is a Rails app that has a memory leak in it on purpose! I use it as a testbed to apply tracing techniques. This app makes use of
`rbtrace` and Ruby's `ObjectSpace` object to dump the heap and output the results to S3 (S3 because I was profiling a Heroku app).

### Usage

Set these config vars on the heroku app:

```Ruby
heroku config:set AWS_ACCESS_KEY_ID=<key> AWS_SECRET_ACCESS_KEY=<secret> AWS_REGION=<region> AWS_BUCKET=nitb-staging
```

* The `root` route displays some text but also increments a global variable - this is the source of the memory leak.
* The `/profile` route activates the rbtrace script and outputs to the `heap_dump.json` to S3.

### References

* [Create a Rails app with a memory leak](https://blog.newrelic.com/2013/03/07/new-relics-instances-tab/)
* [rbtrace gem](https://github.com/tmm1/rbtrace)
* [Debugging Memory leaks - Sam Saffron](http://samsaffron.com/archive/2015/03/31/debugging-memory-leaks-in-ruby)
* [Hunting Memory leaks - Peter Wagenet](http://blog.skylight.io/hunting-for-leaks-in-ruby/)
* [Anything by @tmm1](http://tmm1.net)
* [Discourse Diff Heaps Script](https://github.com/heroku/discussion/blob/master/script/diff_heaps.rb)
* [Ruby Perf Tools](https://github.com/tmm1/perftools.rb)
* [Profiling Ruby With Google's Perftools - Ilya Grigorik](https://www.igvita.com/2009/06/13/profiling-ruby-with-googles-perftools/)
* [Sam Saffron - Why I am excited about Ruby 2.1?](https://vimeo.com/89491942)
* [Github memory profiling](https://github.com/blog/1489-hey-judy-don-t-make-it-bad)
