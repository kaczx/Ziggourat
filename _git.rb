class DirContent
  def pwd(dir, recur)
    Dir.chdir(dir)
    d = Dir.new(dir)
    d.each  {|x| 
      if x != '.' && x != '..'
        p = dir+"/"+x
        if File.directory?(p)
          puts 'DIR : '        
        else
          puts 'FILE : '
        end
        puts p+"\r\n"
        
        getRights(p)

        if File.extname(p) == '.rb'
          require p
          puts "fichier #{p} inclus"
        end
        
        if File.directory?(p) && recur == 1
          pwd(p, 1)
        end
      end
    }  
  end
  
  def getList(home, recur)
    @home = home
    pwd(@home, recur)
  end
  
  def getRights(file)
  
    if File.readable?(file)  
      puts '-> READABLE'
    end
    
    if File.writable?(file)  
      puts '-> WRITABLE'
    end    
    
  end
  
end

Dir.chdir("/home/Ziggourat/wallet/.git")
path = DirContent.new

path.getList("/home/Ziggourat/wallet/.git", 1)

path.getList("/home/Ziggourat/wallet", 0)

