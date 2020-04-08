require 'spec_helper'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []

  end

  def play
    until @game_over == true
      self.take_turn
      if game_over == true
      p game_over_message
      self.reset_game
      
    
      end
    end
  end

  

  def take_turn
      self.show_sequence
      self.require_sequence
       self.round_success_message
       unless @game_over
      @sequence_length += 1
    end

    
  end

  def show_sequence
    self.add_random_color

  end

  def require_sequence

  end

  def add_random_color
    color = COLORS.sample(1)
    seq << color.last
    
    
  end
    
    
    

  
  def round_success_message
    "Round WON !"

  end

  def game_over_message
    p "Game Over!"

  end

  def reset_game
    # @game_over = false
   

      
    
    @seq = []
    @sequence_length = 1
    
  
end
end
