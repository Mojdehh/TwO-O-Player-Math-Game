require_relative 'player'
require_relative 'questions'


puts "Let's bring on the Game!"

P1 = Player.new('Player 1')
puts 'What is the name of player 1?'
P1.name = gets.chomp

P2 = Player.new('Player 2')
puts 'What is the name of player 2?'
P2.name = gets.chomp

puts "#{P1.name} vs #{P2.name}"


@whose_turn = 0

begin

  if @whose_turn % 2 == 0
    puts "------- NEW TURN -------"
    question = Questions.new
    puts "#{P1.name}: #{question.prompt}"
    player_answer = $stdin.gets.chomp.to_i
    if player_answer == question.answer 
      puts "YES! You are  correct."
      puts "#{P1.name}: #{P1.life}/3 vs #{P2.name}: #{P2.life}/3"
      @whose_turn += 1
    else
      P1.wrong_answer
      puts "Seriously? No!"
      puts "#{P1.name}! You just lost one point!"
      puts "#{P1.name}: #{P1.life}/3 vs #{P2.name}: #{P2.life}/3"
      @whose_turn += 1
    end

  else
    puts "------- NEW TURN -------"
    question = Questions.new
    puts "#{P2.name}: #{question.prompt}"
    player_answer = $stdin.gets.chomp.to_i
    if player_answer == question.answer 
      puts "YES! You are  correct."
      puts "#{P1.name}: #{P1.life}/3 vs #{P2.name}: #{P2.life}/3"
      @whose_turn += 1
    else
      P2.wrong_answer
      puts "Seriously? No!"
      puts "#{P2.name}! You just lost one point!"
      puts "#{P1.name}: #{P1.life}/3 vs #{P2.name}: #{P2.life}/3"
      @whose_turn += 1
    end

  end

end until P1.life == 0 || P2.life == 0

puts "------- GAME OVER -------"

if P1.life > 0
  puts "#{P1.name} wins with the score of #{P1.life}/3"
elsif P2.life > 0
  puts "#{P2.name} wins with the score of #{P2.life}/3"
end

puts "Good bye!"