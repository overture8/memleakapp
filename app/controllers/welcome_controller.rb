class WelcomeController < ApplicationController
  def index
  end

  def profile
    heap_dump_file = Rails.root.join('app', 'script', 'heap_dump.rb')
    system("rbtrace -p #{Process.pid} -e 'load \"#{heap_dump_file}\"'")
    render :text => "Profiling complete"
  end
end
