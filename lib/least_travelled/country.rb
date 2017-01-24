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
    # when an instance of country is created every one of the instances will have a name
    # and it will be pushed into @@all the class variable.
  end

  def self.all
    @@all.first(15)
  
  end

  def self.find(id) #id in my case will be a country so when the user inputs a country  how would you find it in @@all?
    self.all[id-1]
  end


end
