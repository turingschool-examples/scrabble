class GameReader
  def initialize(file_name)
    @players_and_words = {} # :player_id -> [words]

    @scrabble_game = Scrabble.new

    lines = File.readlines(file_name)

    if(lines.length > 0)
      first_line = lines.shift
      prefix_word = first_line.split(',')
      # substring using 0 .. index of _ inclusive
      player_prefix = prefix_word[0][0, prefix_word[0].index('_') + 1]
      lines.each do |line|
        id_word = line.split(',')
        id = player_prefix + id_word[0].to_s
        id = id.to_sym
        words = get_player_words(id)
        if(!words)
          words = []
          @players_and_words[id] = words
        end
        words.push(id_word[1].chomp)
      end
    end
  end

  def word_count(player)
    words = get_player_words(player)
    if(words)
      return words.length
    end
    0
  end

  def get_player_words(player)
    @players_and_words[player]
  end

  def score(player)
    words = get_player_words(player)
    if(words)
      total = words.reduce(0) do |score, word|
        word_score = @scrabble_game.score(word)
        score + word_score
      end
      return total
    end
    0
  end
end
