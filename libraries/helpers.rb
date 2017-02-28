module GenericConfig
  def builder(options)
    @genConf ||= ''
    options.each do |k,v|
      if v.class == String
        printString(k,v)
        newLine
      elsif v.class == Fixnum
        printFixnum(k,v)
        newLine
      elsif v.class == Chef::Node::ImmutableArray
        v.each do |a|
          if a.class == String
            printString(k,a)
            newLine
          elsif a.class == Fixnum
            printFixnum(k,a)
            newLine
          elsif a.class == Chef::Node::ImmutableMash
            printMash(k,a) 
          end
        end
      end
    end
    return @genConf
  end
  def printString(key, value)
    @genConf << "#{key} = \"#{value}\""
  end
  def printFixnum(key, value)
    @genConf << "#{key} = #{value}"
  end
  def newLine
    @genConf << "\n"
  end
  def printMash(key, array)
    @genConf << "#{key} = [\n"
    array.each_with_index do |(i,j),index|
      @genConf << "  "
      printString(i,j)
      @genConf << ",\n" unless array.size-1 == index
    end
    @genConf << "\n]\n"
  end 
end
