class Examination

  def setup(&block)
    @setups << block
  end
  
  def examine(name, &block)
    @examinations[name] = block 
  end

end
