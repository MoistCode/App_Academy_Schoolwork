require "byebug"

class PolyTreeNode

  attr_reader :parent, :children, :value

  def initialize(value, parent = nil)
    @value = value
    @parent = parent
    @children = []
  end

  def parent=(parent_node) #
    if @parent == nil
      @parent = parent_node
      parent_node.children << self
    elsif parent_node == nil
      @parent.children.delete(self)
      @parent = nil
    else
      @parent.children.delete(self)
      @parent = parent_node
      parent_node.children << self
    end
  end

  def add_child(child_node)
    child_node.parent = self
    @children << child_node unless @children.include?(child_node)
  end

  def remove_child(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if @value == target_value

    @children.each do |child|
      found_value = child.dfs(target_value)
      return found_value  unless found_value == nil
    end

    return nil #if @children.length == 0
  end

  def bfs(target_value)
    searching_queue = [self]

    until searching_queue.empty?
      node = searching_queue.shift
      return node if node.value == target_value
      searching_queue.concat(node.children)
    end
  end
  # until searching_queue.length == 0 || searching_queue.first.value == target_value
  #   searching_queue += searching_queue.first.children
  #   searching_queue.shift
  # end
  #
  # return nil if searching_queue.length == 0
  # return searching_queue.first

end
