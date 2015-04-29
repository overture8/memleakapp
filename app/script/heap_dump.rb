require "objspace"
require 'aws-sdk'
require 's3io'

ObjectSpace.trace_object_allocations_start
GC.start()
s3_object = S3.buckets[ENV['AWS_BUCKET']].objects['heap_dump.json']
ObjectSpace.dump_all(output: S3io.open(s3_object, 'w'))

