require "objspace"
require 'aws-sdk'

ObjectSpace.trace_object_allocations_start
GC.start()

save_path = Rails.root.join('tmp', 'heap_dump.json')

ObjectSpace.dump_all(output: File.open(save_path, 'w'))

s3 = Aws::S3::Resource.new
obj = s3.bucket(ENV['AWS_BUCKET']).object('heap_dump.json')
obj.upload_file(save_path)

