require_relative '00_tree_node'


class KnightPathFinder
  attr_reader :move_tree
  # attr_accessor :starting_pos

  def initialize(pos)
    @starting_pos = pos
    @visited_positions = [@starting_pos]
    self.build_move_tree
  end

  # def build_move_tree
  #
  # end
  def new_move_positions(pos = starting_pos)
    new_moves = []
    self.class.valid_moves(pos).each do |move|
      new_moves << move unless @visited_positions.include?(move)
    end
    @visited_positions += new_moves
    new_moves
  end

  def self.arr_sum(arr1, arr2)
    new_arr = []
    new_arr << arr1[0] + arr2[0]
    new_arr << arr1[1] + arr2[1]
  end

  def self.valid_moves(pos)
    move_perms = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [-1, 2], [1, -2], [-1, -2]]
    valid_range = (0..7).to_a
    new_moves = []
    move_perms.each do |arr|
      potential_move = self.arr_sum(pos, arr)
      new_moves << potential_move if potential_move.all? {|num| valid_range.include?(num)}
    end
    new_moves
  end


  def build_move_tree

    queue = []
    temp_array = []
    @root = PolyTreeNode.new(@starting_pos)
    queue << @root
    until queue.empty?# do |node|
      node = queue.shift
      temp_array = new_move_positions(node.value)
      temp_array.each do |pos|
        child_node = PolyTreeNode.new(pos)
        node.add_child(child_node)
        queue << child_node
      end
    end
     nil
  end

  def find_path(end_pos)
    final_node = @root.dfs(end_pos)
    trace_path_back(final_node)
  end

  def trace_path_back(node)
    path = []
    until node.parent.parent.nil?

      path.unshift(node.value)

      node = node.parent

    end
    [@starting_pos] + path
  end

end
