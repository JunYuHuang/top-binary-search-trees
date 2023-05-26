class Node
  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

  attr_accessor(:data)
  attr_accessor(:left)
  attr_accessor(:right)

  def data
    @data
  end

  def left
    @left
  end

  def right
    @right
  end
end

class Tree
  def initialize(values)
    # TODO
    # builds BST with `values` array
    @root = nil
  end

  def build_tree(values)
    # TODO
    # builds BST with `values` array
    # returns level-0 root node
    @root
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
