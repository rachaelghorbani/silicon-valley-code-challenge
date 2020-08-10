class VentureCapitalist
  attr_accessor :name, :total_worth

  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    VentureCapitalist.all.select do |venture_capitalist|
      venture_capitalist.total_worth > 1000000000
    end
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select do |funding_round|
      funding_round.venture_capitalist == self
    end
  end

  def portfolio
    self.funding_rounds.map do |funding_round|
      funding_round.startup
    end.uniq
  end

  def biggest_investment
    largest_funding_round = self.funding_rounds.map do |funding_round|
      funding_round.investment
    end.max
    self.funding_rounds.find do |funding_round|
      funding_round.investment == largest_funding_round
    end
  end

  def invested(domain)
    startups = self.funding_rounds.select do |funding_round|
      funding_round.startup.domain == domain
    end
    startups.map do |startup|
      startup.investment
    end.sum
  end

end

