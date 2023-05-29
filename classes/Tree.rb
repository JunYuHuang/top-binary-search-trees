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
    return if @unique.include?(value)

    new_node = Node.new(value)

    unless @root
      @root = new_node
      return
    end

    parent = nil
    curr = @root
    while curr
      parent = curr
      if curr < value
        curr = curr.right
      else # curr > value
        curr = curr.left
      end
    end

    if parent < value
      parent.right = new_node
    else
      parent.left = new_node
    end

    @unique.add(value)
    nil
  end

  # helper method for `Tree#delete` method
  def replace(node)
    return if !root or !@unique.include?(node.data)

    # TODO
  end

  def delete(value)
    return unless @root

    parent = nil
    curr = @root
    while curr
      if curr == value
        break
      elsif curr < value
        parent = curr
        curr = curr.right
      else # curr > value
        parent = curr
        curr = curr.left
      end
    end

    return unless curr

    if curr.left && curr.right
      replace(curr)
    elsif curr.left
      child = curr.left
      if curr == @root
        @root = child
      elsif parent
        parent > curr ? parent.left = child : parent.right = child
      end
      curr.left = nil
    elsif curr.right
      child = curr.right
      if curr == @root
        @root = child
      elsif parent
        parent > curr ? parent.left = child : parent.right = child
      end
      curr.right = nil
    else # curr is leaf node
      if curr == @root
        @root = nil
      else
        parent > curr ? parent.left = nil : parent.right = nil
      end
    end

    @unique.delete(value)
    nil
  end

  def find(value)
    return nil unless @root

    curr = @root
    while curr
      if curr == value
        return curr
      elsif curr < value
        curr = curr.right
      else # curr > value
        curr = curr.left
      end
    end

    nil
  end

  def level_order(&block)
    return block_given? ? nil : [] unless @root

    queue = [@root]
    res = []
    while queue.size > 0
      queue_len = queue.size
      queue_len.times do |i|
        curr = queue.shift
        block.call(curr) if block_given?
        res.push(curr.data)
        queue.push(curr.left) if curr.left
        queue.push(curr.right) if curr.right
      end
    end
    block_given? ? nil : res
  end

  def inorder(&block)
    # inorder = L -> root -> R
    return block_given? ? nil : [] unless @root

    def dfs(curr, &block)
      return [] unless curr

      res = []
      res.concat(dfs(curr.left, &block))
      block_given? ? block.call(curr) : res.push(curr.data)
      res.concat(dfs(curr.right, &block))
      res
    end

    res = dfs(@root, &block)

    block_given? ? nil : res
  end

  def preorder(&block)
    # preorder = root -> L -> R
    return block_given? ? nil : [] unless @root

    def dfs(curr, &block)
      return [] unless curr

      res = []
      block_given? ? block.call(curr) : res.push(curr.data)
      res.concat(dfs(curr.left, &block))
      res.concat(dfs(curr.right, &block))
      res
    end

    res = dfs(@root, &block)

    block_given? ? nil : res
  end

  def postorder(&block)
    # postorder = L -> R -> root
    return block_given? ? nil : [] unless @root

    def dfs(curr, &block)
      return [] unless curr

      res = []
      res.concat(dfs(curr.left, &block))
      res.concat(dfs(curr.right, &block))
      block_given? ? block.call(curr) : res.push(curr.data)
      res
    end

    res = dfs(@root, &block)

    block_given? ? nil : res
  end

  def height(node)
    # height = #edges in path from `node` to its furthest descendant leaf node
    return -1 if !@root or !node

    def dfs(root, hei = -1)
      return hei unless root

      left = dfs(root.left, hei + 1)
      right = dfs(root.right, hei + 1)
      [left, right].max
    end

    [dfs(node.left), dfs(node.right)].max + 1
  end

  def depth(node)
    # depth = #edges in path from `node` to root node
    return -1 unless @root

    curr = @root
    res = 0
    while curr
      if curr == node
        return res
      elsif curr < node
        curr = curr.right
        res += 1
      else # curr > node
        curr = curr.left
        res += 1
      end
    end

    -1
  end

  def balanced?
    # height balanced IFF every height diff of L & R subtrees of every node is <= 1
    # define null nodes as having height 0
    return true unless @root

    def dfs(node)
      return { balanced: true, height: 0 } unless node

      left = dfs(node.left)
      right = dfs(node.right)
      is_balanced = (
        left[:balanced] &&
        right[:balanced] &&
        (left[:height] - right[:height]).abs <= 1
      )

      {
        balanced: is_balanced,
        height: 1 + [left[:height], right[:height]].max
      }
    end

    dfs(@root)[:balanced]
  end

  def rebalance
    return if !@root or balanced?
    @root = build_tree(inorder)
    nil
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
