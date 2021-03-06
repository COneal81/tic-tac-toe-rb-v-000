WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

      
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i-1
end

def move(board,index,player)
  board[index] = player
end

def position_taken?(board,index)
  if board[index] == " "
    return FALSE
    elsif board[index] == ""
    return FALSE
    else board[index] == "X" || "O"
    return TRUE
  end
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board,index) 
    return TRUE
  else
    return FALSE
  end
end

def turn(board)
  puts "Please enter 1-9."
  input = gets.strip
  index = input_to_index(input)
  player = current_player(board)
  if valid_move?(board,index)
    move(board,index,player)
    display_board(board)
  else 
    turn(board)
  end
end

def turn_count(board)
  # board.count{|token| token == "X" || token == "O"}
  turn = 0
  board.each do |p| 
    if p != " "
      turn += 1
    end
  end
turn
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end


def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      win_combination
    end
  end
end

def full?(board)
  if board.detect {|p| p == " " || p == nil}
    return FALSE
  else
    return TRUE
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return TRUE
  else
    return FALSE
  end
end
  
def over?(board)
  if won?(board) || draw?(board)
    return TRUE
  else
    return FALSE
  end
end
    
def winner(board)
  if won?(board)
    board[won?(board)[0]]
  else !won?(board)
    nil
  end
end


def play(board)
  until over?(board) == TRUE
  turn(board)
end
 if won?(board) 
   puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end


