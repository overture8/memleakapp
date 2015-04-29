class WelcomeController < ApplicationController
  def index
  end

  def profile
    system("rbtrace -p #{Process.pid} -e 'load \"#{Rails.root}/script/heap_dump.rb\"'")
    render :text => "Profiling complete"
  end
end
