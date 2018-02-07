gem 'minitest'
require_relative '../lib/game_reader'
require_relative '../lib/player'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class GameReaderTest < Minitest::Test

  def game
    @game
  end

  def setup
    @game = GameReader.new
  end

  def test_game_generates_players
    assert_instance_of Player, game.player_1
    assert_instance_of Player, game.player_2
  end

  def test_game_starts_with_100_tiles
    game_tiles = game.tiles.values.sum
    player_tiles = game.player_1.tiles.length + game.player_2.tiles.length
    assert_equal 100, game_tiles + player_tiles
  end

  def test_game_can_get_a_new_letter_tile
    letter = game.get_letter

    assert letter =~ /[[:alpha:]]/
  end

  def test_game_tracks_letters_used
    100.times { game.get_letter }

    assert_equal 0, game.tiles.values.sum
  end

  def test_game_gives_players_starting_tiles
    assert_equal 7, game.player_1.tiles.length
    assert_equal 7, game.player_2.tiles.length
  end
end
