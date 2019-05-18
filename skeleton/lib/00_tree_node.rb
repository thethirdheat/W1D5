require "byebug"

class PolyTreeNode
  attr_reader :parent, :children
  attr_writer :parent, :children

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

  def value
    @value
  end

  # def ==(node)
  #   return true if self.value == node.value
  #   false
  # end

  def parent=(root)
    
    if self.parent != nil
      self.parent.children.select! {|child| child!=self }
    end
    @parent = root
    unless root.nil?
      root.children << self
    end
  end

  def add_child(child_node)
    unless self.children.include?(child_node)
      child_node.parent = self 
    end
  end

  def remove_child(child_node)
    raise "Node is not a child" unless self.children.include?(child_node)


    self.children.delete(child_node) 
    child_node.parent=nil 
  end
  def dfs(targ)
    return self if self.value==targ
    puts "#{self.value}, #{self.children.map{|el|el.value}}"


    #self.children=self.children.sort{|a,b|a-b}
    self.children.each do |child| 
      child.dfs(targ) 
    end

    return nil

  end
  
  #def inspect
  #  puts "#{self.value} , #{self.parent.value}"
  #end

end

# n1 = PolyTreeNode.new("root1")
# n2 = PolyTreeNode.new("root2")
# n3 = PolyTreeNode.new("root3")
# n4 = PolyTreeNode.new("root4")


# n3.parent = n1
# n4.parent = n1
# n3.parent = n2


# p "N1= #{n1.children.map { |child| child.value }}"
# p "N2= #{n2.children.map { |child| child.value }}"
# p "N3= #{n3.parent.value}"

# # this should work
# raise "Bad parent=!" unless n3.parent == n2
# raise "Bad parent=!" unless n2.children == [n3]

# # this probably doesn't
# raise "Bad parent=!" unless n1.children == []