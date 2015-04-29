require "objspace"
require 'aws-sdk'
require 's3io'

ObjectSpace.trace_object_allocations_start
GC.start()
s3 = Aws::S3::Resource.new
s3_object = s3.bucket(ENV['AWS_BUCKET']).object('heap_dump.json')
ObjectSpace.dump_all(output: S3io.open(s3_object, 'w'))

