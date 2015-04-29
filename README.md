## MemLeakApp

This is a Rails app that has a memory leak in it on purpose! I use it as a testbed to apply tracing techniques. This app makes use of
rbtrace and Ruby's ObjectSpace object to dump the heap and output the results to S3 (S3 because I was profiling a Heroku app).

Set these config vars on the heroku app:

```Ruby
heroku config:set AWS_ACCESS_KEY_ID=<key> AWS_SECRET_ACCESS_KEY=<secret> AWS_REGION=<region> AWS_BUCKET=nitb-staging
```

* The root route displays some text but also increments a global variable - this is the source of the memory leak.
* The '/profile' route activates the rbtrace script and outputs to the `heap_dump.json` to S3.
