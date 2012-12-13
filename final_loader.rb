require 'rubygems'
require 'google-search'

iter = 0

summer = Google::Search::Image.new(:query => 'summer day')

summer.each do |image|
    if(iter > 25)
        break
    end
    pid = fork do
        exec 'wget', "#{image.uri}", "-P", "summer"
        sleep 15
        Process.kill("SIGKILL", pid)
        puts "Process #{pid} killed!"
    end
    iter = iter + 1
end

iter = 0

fall = Google::Search::Image.new(:query => 'autumn')

fall.each do |image|
    if(iter > 25)
        break
    end
    pid = fork do
        exec 'wget', "#{image.uri}", "-P", "fall"
        sleep 15
        Process.kill("SIGKILL", pid)
        puts "Process #{pid} killed!"  
    end
    iter = iter + 1
end

iter = 0

winter = Google::Search::Image.new(:query => 'winter scenery')

winter.each do |image|
    if(iter > 25)
        break
    end
    pid = fork do
        exec 'wget', "#{image.uri}", "-P", "winter"
        sleep 15
        Process.kill("SIGKILL", pid)
        puts "Process #{pid} killed!"   
    end
    iter = iter + 1
end

iter = 0

spring = Google::Search::Image.new(:query => 'spring')

spring.each do |image|
    if(iter > 25)
        break
    end
    pid = fork do
        exec 'wget', "#{image.uri}", "-P", "spring"
        sleep 15
        Process.kill("SIGKILL", pid)
        puts "Process #{pid} killed!"  
    end  
    iter = iter + 1
end