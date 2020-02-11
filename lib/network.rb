class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    #Can be refactored to combine the last two iterations. Time permititng
    main_characters = @shows.reduce([]) { |characters, show|  characters << show.characters }.flatten
    main_characters = main_characters.find_all { |character| character.salary > 500_000 }
    main_characters = main_characters.find_all { |character| character.name == character.name.upcase }
  end

  def actors_by_show
    @shows.reduce({}) do |actors, show|
      actors[show] = show.actors
      actors
    end
  end

  def shows_by_actors
  end

  def prolific_actors
  end

end
