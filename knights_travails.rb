class Node # Class for nodes of the path tree - one parent many children (possible moves)
  attr_accessor :pos, :parent
  
  def initialize (pos, parent = nil)
    @pos = pos
    @parent = parent
  end
end

def valid_moves(pos) # Returns array of valid knight moves from given starting position
  moves = [[2,1],[2,-1],[1,2],[1,-2],[-1,2],[-1,-2],[-2,1],[-2,-1]]
  valid_moves = []
  moves.each do |move|
    possible_move = [pos[0] + move[0], pos[1] + move[1]]
    valid_moves << possible_move if on_board?(possible_move)
  end
  valid_moves
end

def on_board?(pos) # Checks possible move is within board boundaries
  pos[0].between?(0,7) && pos[1].between?(0,7) ? true : false
end

def show_path(location) # Back-traces from goal node upwards through parents to generate path
  path = []
  until location.nil?
    path << location.pos
    location = location.parent
  end
  puts "Number of moves it took: #{path.length - 1}\nHere's your path:"
  p path.reverse
end

def knight_moves(start, goal) # Main function
  return "Invalid position." if !on_board?(start) || !on_board?(goal)
  return "You are already there my friend." if start == goal
  queue = [Node.new(start)] # Adds root node at start position
  until queue.empty?
    current = queue.shift
    if current.pos == goal
      show_path(current)
      break
    else
      moves = valid_moves(current.pos) # Creates child nodes for each valid move, adds all to queue
      moves.each { |move| queue << Node.new(move, current) } # 2nd arg is for parent node
    end
  end
end