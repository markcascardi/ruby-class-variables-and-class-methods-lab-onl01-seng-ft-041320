class Song
  attr_accessor :name, :artist, :genre

  @@count = 0
  @@artists = []
  @@genres = []

  def initialize(name, artist, genre)
    @name = name
    @artist = artist
    @genre = genre
    @@count += 1
    add_artist(artist)
    add_genre(genre)
  end

  def self.count
    @@count
  end

  def add_genre(genre)
    @@genres << genre
  end

  def add_artist(artist)
    @@artists << artist
  end

  def self.genres
    @@genres.uniq
  end

  def self.artists
    @@artists.uniq
  end

  def self.genre_count
    Hash[*@@genres.group_by { |genre| genre }.
        flat_map { |genre, v| [genre, v.size] }]
  end

  def self.artist_count
    Hash[*@@artists.group_by { |artist| artist }.
    flat_map { |artist, v| [artist, v.size] }]
  end
end
