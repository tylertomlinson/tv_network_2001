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
    main_characters = @shows.reduce([]) do |characters, show|
      characters << show.characters
    end.flatten
    main_characters.find_all do |character|
      character.salary > 500_000 && character.name[character.name.upcase]
    end
  end

  def actors_by_show
    @shows.reduce({}) do |actors, show|
      actors[show] = show.actors
      actors
    end
  end

  def shows_by_actor
    @shows.reduce({}) do |actor_shows, show|
      show.actors.each do |actor|
        actor_shows[actor] = [] if actor_shows[actor].nil?
        actor_shows[actor] << show
      end
      actor_shows
    end
  end

  def prolific_actors
    shows_by_actor.select {|actor,show| show.size > 1}.keys
  end

end
