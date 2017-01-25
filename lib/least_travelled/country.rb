require_relative '../least_travelled'

class Country

  attr_accessor :name, :tourists, :why_so_few, :more_info

  @@all = []


  def initialize(name=nil, tourists=nil, why_so_few=nil, more_info=nil)
    @name = name
    @tourists = tourists
    @why_so_few = why_so_few
    @more_info = more_info
    @@all << self
  end

  def self.all
    @@all.first(15)
  end

  def self.find(id)
    self.all[id-1]
  end


end
