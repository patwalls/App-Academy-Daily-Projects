require "set"
class Ghost

  def initialize(player1,player2)
    my_dictionary = Set.new()

    File.open('dictionary.txt').each do |line|
      my_dictionary.add(line.chomp)
    end
    @dict = my_dictionary
    @fragment = ""
    @player1 = player1
    @player2 = player2
    @player1ghost = 0
    @player2ghost = 0
    @active_player = [@player1,@player2].sample

  end

  def ghost_adder
    ghost = "ghost"

    if @active_player == @player1
      @player1ghost += 1
      puts "#{@player1}, you have: #{ghost[0...@player1ghost]}"

    elsif @active_player == @player2
      @player2ghost += 1
      puts "#{@player2}, you have: #{ghost[0...@player2ghost]}"
    end
  end



  def play

    while game_over? == false
      puts "#{@active_player}, Go!"

      input
      @fragment += @input
      puts "Fragment is #{@fragment}"
      if is_a_word?
        @fragment = ""
        puts "That's a word!"
        ghost_adder
      end
      switch_player

    end
    puts "Game over!"
  end

  def input
    puts "Please type your letter."
    @input = gets.chomp

    until @input.length == 1
      puts "Serious I need you to type just one letter here bro."
      @input = gets.chomp
    end

  end





  def is_a_word?
    @dict.include?(@fragment)
  end

  def switch_player
    if @active_player == @player1
      @active_player = @player2
    elsif @active_player == @player2
      @active_player = @player1
    end

  end

  def game_over?
    if @player1ghost == 5
      puts "#{@player1} lost!"
      return true
    elsif @player1ghost == 5
      puts "#{@player1} lost!"
      return true
    end
    false
  end

end


game = Ghost.new('Eric', "Stanley")
game.play
