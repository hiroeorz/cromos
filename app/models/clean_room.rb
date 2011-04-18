class CleanRoom

  def setup(setups)
    setups.each { |s| s.call }
  end

  def exec(func)
    func.call
  end
  
end
