class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14,Array.new)
    (0...14).each {|cup| @cups[cup] = [:stone, :stone, :stone, :stone] unless cup == 6 || cup == 13}
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if !start_pos.between?(0,13)
    raise 'Starting cup is empty' if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos].length
    @cups[start_pos] = []
    finish = 0
    no_fill = 13 if current_player_name == @name1
    no_fill = 6 if current_player_name == @name2
    #p stones.to_s + '   aaaaaa'
    ((start_pos+1)...14).each do |cup| 
      unless cup == no_fill || stones == 0
        @cups[cup] << :stone
        stones -= 1
        finish = cup
      end
    end
    until stones == 0
      (0...14).each do |cup| 
        unless cup == no_fill || stones == 0
          @cups[cup] << :stone
          stones -= 1
          finish = cup
        end
      end
    end
    render
    next_turn(finish)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if @cups[ending_cup_idx].length == 1
    return ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
  end

  def winner
    if @cups[6].length > @cups[13].length
      return @name1
    elsif @cups[6].length < @cups[13].length
      return @name2
    else
      return :draw
    end
  end
end
