class WelcomeController < ApplicationController
  def index
    system("rbtrace -p #{Process.pid} -e 'load \"#{Rails.root}/script/heap_dump.rb\"'")
  end
end
