class TicTacToe
   require 'pry'
    attr_accessor :board
    def initialize
        @board = board
        @board = Array.new(9, " ")
          
    end
    WIN_COMBINATIONS = [ 
        [0,1,2],  
        [3,4,5],  
        [6,7,8],  
        [0,3,6], 
        [1,4,7], 
        [2,5,8], 
        [0,4,8],  
        [6,4,2] 
        ]
    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end
         
          
    
    def input_to_index(user_input)
        user_input.to_i - 1
    end
    def move(index, player)
        board[index] = player
    end
    def position_taken?(index)
        if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
           return false 
        else
           return true
        end
     end
     def valid_move?(index)
        if index.between?(0,8) && !position_taken?(index)
           return true
        end
     end
     def turn_count
        counter = 0
        board.each do |spaces|
           if spaces == "X" || spaces == "O"
              counter += 1
           end
        end
        counter
    end
    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end
    def turn
        puts "Please enter 1-9:"
        user_input = gets.strip
        index = input_to_index(user_input)
        if valid_move?(index)
           move(index, current_player)
        else
            turn
        end
        display_board
     end
        
    def won?
         WIN_COMBINATIONS.detect do |win_combo|
            #win combo will equal [3,4,5]
            @board[win_combo[0]] == @board[win_combo[1]] &&
            @board[win_combo[1]] == @board[win_combo[2]] &&
            position_taken?(win_combo[0])            
            end
           
            #if board[win_combo[0]] == board[win_combo[1]] && board[win_combo[2]] == board[win_combo[1]]
            
            
        end
        false
    def full?
        board.none? { |piece| piece == " " }
    end
    def draw?
        
      if  self.full? &&  self.won? == nil
       true
      end
    end
    def over?
        if self.draw? || self.won?
            true
        end
    end
    def winner
        current_player 
        if self.won?
          last_player
        
        end
    end
    def last_player
        (turn_count - 1) % 2 == 0 ? "X" : "O"
    end
    def play
        until over?
            turn
        end
        if won?
        puts "Congratulations #{last_player}!"
        elsif
         puts "Cat's Game!"   
        end
       
    end
    game = self.new
      

end




