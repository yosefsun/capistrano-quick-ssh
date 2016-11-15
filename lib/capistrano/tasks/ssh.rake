desc "SSH"
task :ssh  do
  run_locally do
    if (roles(:all).count == 1)
      host = roles(:all).last
    else
      puts 'Pick a server you would like to SSH into :'
      roles(:all).each_with_index do |host, index|
        puts "#{index+1}) #{host.user}@#{host.hostname} (#{host.roles.to_a.join(',')})"
      end

      print '> '
      line = $stdin.gets
      host = roles(:all)[line.to_i-1]
    end
    cmd = "ssh #{host.user}@#{host.hostname}"
    puts "runing #{cmd}"
    system(cmd)
  end
end