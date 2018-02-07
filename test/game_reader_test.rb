gem 'minitest'
require_relative '../lib/game_reader'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class GameReaderTest < Minitest::Test

  def test_game_reader_is_instantiated
    game = GameReader.new
    assert_instance_of GameReader, game
  end

  def test_game_reader_has_letter_has
    game = GameReader.new
    assert_equal ({
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
      }), game.letters
  end

  def test_game_has_a_score_function
    game = GameReader.new

    assert_equal 1, game.score("A")
  end

  def test_game_has_a_seperate_word_function
    game = GameReader.new
    assert_equal ["H", "E", "L", "L", "O"], game.seperated_word("Hello")
  end

  def test_score_can_score_a_word
    game = GameReader.new

    assert_equal 8, game.score("HELLO")
  end

  def test_nil_and_0_returns_0
    game = GameReader.new

    assert_equal 0, game.score(nil)
    assert_equal 0, game.score("")
  end

  def test_game_has_score_with_multipliers_with_valid
    game = GameReader.new

    assert 18, game.score_with_multipliers("HELLO", [1,2,1,1,1], 2)
  end

  def test_score_with_multipler_without_bonus_or_multiplier
      game = GameReader.new

      assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
  end

  def test_game_has_score_with_multiplers_plus_10_points_bonus
    game = GameReader.new

    assert 58, game.score_with_multipliers("sparkle", [1,2,1,3,1,2,1], 2)
  end


end
