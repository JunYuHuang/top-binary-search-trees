require 'set'
require_relative 'Node'

class Tree
  def initialize(values = [])
    values = values.uniq.sort
    @unique = Set.new(values)
    @root = build_tree(values)
  end

  attr_accessor(:unique)
  attr_accessor(:root)

  def build_tree(sorted_arr = [])
    return nil if sorted_arr.empty?

    mid = (0 + sorted_arr.size - 1) / 2
    root = Node.new(sorted_arr[mid])
    root.left = build_tree(sorted_arr[0...mid])
    root.right = build_tree(sorted_arr[mid + 1..-1])

    root
  end

  def insert(value)
    # TODO
  end

  def delete(value)
    # TODO
  end

  def find(value)
    # TODO
    # returns node with whose `data`'s attribute equals `value`
  end

  def level_order(&block)
    # TODO
    # yields each node to the block `&block`
    # returns array of node values from the BST traversed in BFS level order
  end

  def inorder(&block)
    # TODO
    # yields each node to the block `&block`
    # returns array of node values from the BST traversed in inorder order
  end

  def preorder(&block)
    # TODO
    # yields each node to the block `&block`
    # returns array of node values from the BST traversed in preorder order
  end

  def postorder(&block)
    # TODO
    # yields each node to the block `&block`
    # returns array of node values from the BST traversed in postorder order
  end

  def height(node)
    # TODO
    # returns `node`'s height = #edges in path from `node` to furthest leaf node
  end

  def depth(node)
    # TODO
    # returns `node`'s depth = #edges in path from `node` to root node
  end

  def balanced?
    # TODO
    # returns true if BST is balanced else false
    # balanced IFF every height diff of L & R subtrees of every node is <= 1
  end

  def rebalance
    # TODO
    # rebalance an unbalanced tree
    # tip: call `#build_tree` method with array returned from a traversal method
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    if node.right
      right_node_prefix = "#{prefix}#{is_left ? '│   ' : '    '}"
      pretty_print(node.right, right_node_prefix, false)
    end

    puts("#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}")

    if node.left
      left_node_prefix = "#{prefix}#{is_left ? '    ' : '│   '}"
      pretty_print(node.left, left_node_prefix, true)
    end
  end
end
