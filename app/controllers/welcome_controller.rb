class WelcomeController < ApplicationController
  def index
    $leak ||= ''
    $leak << ("a" * 1.megabytes)
    render :text => "Mem Leak App"
  end

  def profile
    heap_dump_file = Rails.root.join('app', 'script', 'heap_dump.rb')
    system("rbtrace -p #{Process.pid} -e 'load \"#{heap_dump_file}\"'")
    render :text => "Profiling complete"
  end
end
