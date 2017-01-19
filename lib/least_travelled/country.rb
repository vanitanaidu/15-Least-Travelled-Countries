require_relative '../least_travelled'

class Country

  attr_accessor :name, :tourists, :info

  @@all = []


  def initialize(name=nil, tourists=nil, info=nil)
    @name = name
    @tourists = tourists
    @info = info
    @@all << self
    # when an instance of country is created every one of the instances will have a name
    # and it will be pushed into @@all the class variable.
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end


end
