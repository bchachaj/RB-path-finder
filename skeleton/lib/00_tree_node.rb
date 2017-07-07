require 'byebug'

class PolyTreeNode
  attr_accessor :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def parent=(node)
    if node == nil
      @parent = nil
    else
      parent.children.delete(self) unless parent == nil
      @parent = node
      parent.children << self unless parent.children.include?(self)
    end
  end


  def add_child(child_node)
    child_node.parent = self

  end

  def inspect
    @value.inspect

  end

  def remove_child(child_node)
    # raise "Error" if @children.include?(child_node)
    child_node.parent = nil
    raise "Error" if !(@children.include?(child_node))
  end

  def dfs(target_value)
    return self if self.value == target_value

    @children.each do |child|

      search_result = child.dfs(target_value)

      return search_result unless search_result.nil?
    end
    nil

  end



  def bfs(target_value)
    queue = [self]

    until queue.empty?

      current_node = queue.shift


      if current_node.value == target_value
        return current_node
      else
        current_node.children.each {|child| queue << child}

      end

    end
    nil
  end

end
