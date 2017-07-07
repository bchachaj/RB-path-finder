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


  def add_children(child_node)

  end


  def remove_child(child_node)

  end



end
