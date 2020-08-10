class Startup
  attr_accessor :name
  attr_reader :founder, :domain

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def self.all
    @@all
  end

  def pivot(domain, name)
    self.domain = domain
    self.name = name
  end

  def funding_rounds
    FundingRound.all.select do |funding_round|
      funding_round.startup == self
    end
  end

  def num_funding_rounds
    self.funding_rounds.count
  end

  def investors
    self.funding_rounds.map do |funding_round|
      funding_round.venture_capitalist
    end.uniq
  end

  def total_funds
    self.funding_rounds.map do |funding_round|
      funding_round.investment
    end.sum
  end
  
  def sign_contract(venture_capitalist, type, investment )
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def big_investors
    self.investors.select do |investor|
      VentureCapitalist.tres_commas_club.include? (investor)
    end
  end

  def self.find_by_founder(founder)
    Startup.all.find do |startup|
      startup.founder == founder
    end
  end

  def self.domains
    Startup.all.map do |startup|
      startup.domain
    end
  end

  private

  def domain=(domain)
    @domain = domain
  end

end
