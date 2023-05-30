require_relative 'spec_helper'
require_relative '../classes/Tree'

RSpec.describe 'Tree class' do
  describe "initialize" do
    it "returns nil if called with no arguments" do
      bst = Tree.new
      expect(bst.root).to eq(nil)
    end

    it "returns the non-null root node with value 3 of a 5-node sized BST if called with [5,5,2,3,1,4,4,4]" do
      bst = Tree.new([5,5,2,3,1,4,4,4])
      expect(bst.unique.size).to eq(5)
      expect(bst.root.data).to eq(3)
      expect(bst.root.left.data).to eq(1)
      expect(bst.root.left.right.data).to eq(2)
      expect(bst.root.right.data).to eq(4)
      expect(bst.root.right.right.data).to eq(5)
    end
  end

  describe "insert" do
    it "does nothing if called with a value that already exists in the non-empty BST" do
      bst = Tree.new([1])
      bst.insert(1)
      expect(bst.root).to eq(1)
      expect(bst.root.left).to eq(nil)
      expect(bst.root.right).to eq(nil)
    end

    it "inserts the node correctly if called with any integer on an empty BST" do
      bst = Tree.new()
      bst.insert(1)
      expect(bst.root).to eq(1)
      expect(bst.root.left).to eq(nil)
      expect(bst.root.right).to eq(nil)
    end

    it "inserts the node correctly if called with 7 on a 5-node sized BST" do
      bst = Tree.new([1,2,3,4,5])
      bst.insert(7)
      expect(bst.root.right.right.right).to eq(7)
    end

    it "inserts the node correctly if called with 40 on a 5-node sized BST" do
      bst = Tree.new([10,20,30,100,500])
      bst.insert(40)
      expect(bst.root.right.left).to eq(40)
    end
  end

  describe "delete" do
    it "does nothing if called with a value that is not in the non-empty BST" do
      bst = Tree.new([1])
      bst.delete(0)
      expect(bst.root).to eq(1)
      expect(bst.root.left).to eq(nil)
      expect(bst.root.right).to eq(nil)
      expect(bst.unique.size).to eq(1)
      expect(bst.unique.include?(1)).to eq(true)
    end

    it "does nothing if called with any value on an empty BST" do
      bst = Tree.new
      bst.delete(0)
      expect(bst.root).to eq(nil)
      expect(bst.unique.size).to eq(0)
    end

    it "deletes the node correctly if called with the root node's value on a 1-node sized BST" do
      bst = Tree.new([1])
      bst.delete(1)
      expect(bst.root).to eq(nil)
      expect(bst.unique.size).to eq(0)
      expect(bst.unique.include?(1)).to eq(false)
    end

    it "deletes the root node correctly if called with a value of a node with a right child only on a 2-node sized BST" do
      bst = Tree.new([1,3])
      bst.delete(1)
      expect(bst.root).to eq(3)
      expect(bst.root.left).to eq(nil)
      expect(bst.root.right).to eq(nil)
      expect(bst.unique.size).to eq(1)
      expect(bst.unique.include?(1)).to eq(false)
    end

    it "deletes the node correctly if called with a value of a node with a right child only on a 5-node sized BST" do
      bst = Tree.new([1,3,5,7,9])
      bst.delete(1)
      expect(bst.root.left).to eq(3)
      expect(bst.root.left.left).to eq(nil)
      expect(bst.root.left.right).to eq(nil)
      expect(bst.unique.size).to eq(4)
      expect(bst.unique.include?(1)).to eq(false)
    end

    it "deletes the root node correctly if called with a value of a node with a left child only on a 2-node sized BST" do
      bst = Tree.new([3])
      bst.insert(1)
      bst.delete(3)
      expect(bst.root).to eq(1)
      expect(bst.root.left).to eq(nil)
      expect(bst.root.right).to eq(nil)
      expect(bst.unique.size).to eq(1)
      expect(bst.unique.include?(3)).to eq(false)
    end

    it "deletes the node correctly if called with a value of a node with a left child only on a 5-node sized BST" do
      bst = Tree.new([1,3,5,7])
      bst.insert(0)
      expect(bst.root.left.left).to eq(0)
      bst.delete(1)
      expect(bst.root.left).to eq(0)
      expect(bst.root.left.left).to eq(nil)
      expect(bst.root.left.right).to eq(nil)
      expect(bst.unique.size).to eq(4)
      expect(bst.unique.include?(1)).to eq(false)
    end

    it "deletes the node correctly if called with a value of a node that has both left and right children on a 6-node sized BST" do
      bst = Tree.new([1,3,5,7,9,11])
      bst.delete(9)
      expect(bst.root.right).to eq(11)
      expect(bst.root.right.left).to eq(7)
      expect(bst.root.right.right).to eq(nil)
      expect(bst.unique.size).to eq(5)
      expect(bst.unique.include?(9)).to eq(false)
    end

    it "deletes the root node correctly if called with a value of a node that has both left and right children on a 6-node sized BST" do
      bst = Tree.new([1,3,5,7,9,11])
      bst.delete(5)
      expect(bst.root).to eq(7)
      expect(bst.root.left).to eq(1)
      expect(bst.root.right).to eq(9)
      expect(bst.root.right.left).to eq(nil)
      expect(bst.root.right.right).to eq(11)
      expect(bst.unique.size).to eq(5)
      expect(bst.unique.include?(5)).to eq(false)
    end
  end

  describe "find" do
    it "returns nil if called with any integer value on an empty BST" do
      bst = Tree.new()
      expect(bst.find(0)).to eq(nil)
    end

    it "returns nil if called with 40 on a non-empty BST that does not have a node with value 40" do
      bst = Tree.new([10,20,30,100,500])
      expect(bst.find(40)).to eq(nil)
    end

    it "returns the found node if called with 1 on a 5-node sized BST that has a node with value 1" do
      bst = Tree.new([1,2,3,4,5])
      expect(bst.find(1).data).to eq(1)
    end

    it "returns the found node if called with 5 on a 5-node sized BST that has a node with value 5" do
      bst = Tree.new([1,2,3,4,5])
      expect(bst.find(5).data).to eq(5)
    end
  end

  describe "level_order" do
    it "returns an empty array if called with no block on an empty BST" do
      bst = Tree.new
      expect(bst.level_order).to eq([])
    end

    it "returns nil if called with a block on an empty BST" do
      bst = Tree.new
      res = bst.level_order do |node|
        node && node.data ? node.data : nil
      end
      expect(res).to eq(nil)
    end

    it "returns the correct array of ordered node values if called with no block on an 7-node sized BST" do
      bst = Tree.new([1,2,3,4,5,6,7])
      expected = [4,2,6,1,3,5,7]
      expect(bst.level_order).to eq(expected)
    end

    it "returns the correct array of ordered node values if called with no block on an 6-node sized BST" do
      bst = Tree.new([10,20,30,40,100,500])
      expected = [30,10,100,20,40,500]
      expect(bst.level_order).to eq(expected)
    end

    it "returns nil if called with a block on an 6-node sized BST" do
      bst = Tree.new([10,20,30,40,100,500])
      block_res = []
      block_expected = [30,10,100,20,40,500]
      res = bst.level_order do |node|
        block_res.push(node.data)
      end
      expect(res).to eq(nil)
      expect(block_res).to eq(block_expected)
    end
  end

  describe "inorder" do
    it "returns an empty array if called with no block on an empty BST" do
      bst = Tree.new
      expect(bst.inorder).to eq([])
    end

    it "returns nil if called with a block on an empty BST" do
      bst = Tree.new
      res = bst.inorder do |node|
        node && node.data ? node.data : nil
      end
      expect(res).to eq(nil)
    end

    it "returns the correct array of ordered node values if called with no block on an 7-node sized BST" do
      bst = Tree.new([1,2,3,4,5,6,7])
      expected = [1,2,3,4,5,6,7]
      expect(bst.inorder).to eq(expected)
    end

    it "returns the correct array of ordered node values if called with no block on an 6-node sized BST" do
      bst = Tree.new([10,20,30,40,100,500])
      expected = [10,20,30,40,100,500]
      expect(bst.inorder).to eq(expected)
    end

    it "returns nil if called with a block on an 6-node sized BST" do
      bst = Tree.new([10,20,30,40,100,500])
      block_res = []
      block_expected = [10,20,30,40,100,500]
      res = bst.inorder do |node|
        block_res.push(node.data)
      end
      expect(res).to eq(nil)
      expect(block_res).to eq(block_expected)
    end
  end

  describe "preorder" do
    it "returns an empty array if called with no block on an empty BST" do
      bst = Tree.new
      expect(bst.preorder).to eq([])
    end

    it "returns nil if called with a block on an empty BST" do
      bst = Tree.new
      res = bst.preorder do |node|
        node && node.data ? node.data : nil
      end
      expect(res).to eq(nil)
    end

    it "returns the correct array of ordered node values if called with no block on an 7-node sized BST" do
      bst = Tree.new([1,2,3,4,5,6,7])
      expected = [4,2,1,3,6,5,7]
      expect(bst.preorder).to eq(expected)
    end

    it "returns the correct array of ordered node values if called with no block on an 6-node sized BST" do
      bst = Tree.new([10,20,30,40,100,500])
      expected = [30,10,20,100,40,500]
      expect(bst.preorder).to eq(expected)
    end

    it "returns nil if called with a block on an 6-node sized BST" do
      bst = Tree.new([10,20,30,40,100,500])
      block_res = []
      block_expected = [30,10,20,100,40,500]
      res = bst.preorder do |node|
        block_res.push(node.data)
      end
      expect(res).to eq(nil)
      expect(block_res).to eq(block_expected)
    end
  end

  describe "postorder" do
    it "returns an empty array if called with no block on an empty BST" do
      bst = Tree.new
      expect(bst.postorder).to eq([])
    end

    it "returns nil if called with a block on an empty BST" do
      bst = Tree.new
      res = bst.postorder do |node|
        node && node.data ? node.data : nil
      end
      expect(res).to eq(nil)
    end

    it "returns the correct array of ordered node values if called with no block on an 7-node sized BST" do
      bst = Tree.new([1,2,3,4,5,6,7])
      expected = [1,3,2,5,7,6,4]
      expect(bst.postorder).to eq(expected)
    end

    it "returns the correct array of ordered node values if called with no block on an 6-node sized BST" do
      bst = Tree.new([10,20,30,40,100,500])
      expected = [20,10,40,500,100,30]
      expect(bst.postorder).to eq(expected)
    end

    it "returns nil if called with a block on an 6-node sized BST" do
      bst = Tree.new([10,20,30,40,100,500])
      block_res = []
      block_expected = [20,10,40,500,100,30]
      res = bst.postorder do |node|
        block_res.push(node.data)
      end
      expect(res).to eq(nil)
      expect(block_res).to eq(block_expected)
    end
  end

  describe "height" do
    it "returns -1 if called with any node on an empty BST" do
      bst = Tree.new
      node = bst.find(0)
      expect(bst.height(node)).to eq(-1)
    end

    it "returns -1 if called with a non-existent node on an 7-node sized BST" do
      bst = Tree.new([1,2,3,4,5,6,7])
      node = bst.find(8)
      expect(bst.height(node)).to eq(-1)
    end

    it "returns 0 if called with a leaf node on an 7-node sized BST" do
      bst = Tree.new([1,2,3,4,5,6,7])
      node = bst.find(1)
      expect(bst.height(node)).to eq(0)
    end

    it "returns 2 if called with the root node on an 7-node sized perfectly balanced BST with 3 levels" do
      bst = Tree.new([1,2,3,4,5,6,7])
      node = bst.root
      expect(bst.height(node)).to eq(2)
    end

    it "returns 1 if called with a node with L & R children with no indirect children on an 7-node sized BST" do
      bst = Tree.new([1,2,3,4,5,6,7])
      node = bst.find(2)
      expect(bst.height(node)).to eq(1)
    end

    it "returns 0 if called with the leaf node with value 500 on an 6-node sized BST" do
      bst = Tree.new([10,20,30,40,100,500])
      node = bst.find(500)
      expect(bst.height(node)).to eq(0)
    end
  end

  describe "depth" do
    it "returns -1 if called with any node on an empty BST" do
      bst = Tree.new
      node = bst.find(0)
      expect(bst.depth(node)).to eq(-1)
    end

    it "returns -1 if called with a non-existent node on an 7-node sized BST" do
      bst = Tree.new([1,2,3,4,5,6,7])
      node = bst.find(8)
      expect(bst.depth(node)).to eq(-1)
    end

    it "returns 0 if called with the root node on an 7-node sized BST" do
      bst = Tree.new([1,2,3,4,5,6,7])
      node = bst.root
      expect(bst.depth(node)).to eq(0)
    end

    it "returns 1 if called with the node with value 2 on an 7-node sized BST" do
      bst = Tree.new([1,2,3,4,5,6,7])
      node = bst.find(2)
      expect(bst.depth(node)).to eq(1)
    end

    it "returns 2 if called with the node with value 3 on an 7-node sized BST" do
      bst = Tree.new([1,2,3,4,5,6,7])
      node = bst.find(3)
      expect(bst.depth(node)).to eq(2)
    end

    it "returns 2 if called with the node with value 500 on an 6-node sized BST" do
      bst = Tree.new([10,20,30,40,100,500])
      node = bst.find(500)
      expect(bst.depth(node)).to eq(2)
    end
  end

  describe "balanced?" do
    it "returns true if called on an empty BST" do
      bst = Tree.new
      expect(bst.balanced?).to eq(true)
    end

    it "returns true if called with on a 1-node sized BST" do
      bst = Tree.new([1])
      expect(bst.balanced?).to eq(true)
    end

    it "returns true if called with on a 2-node sized BST" do
      bst = Tree.new([1,2])
      expect(bst.balanced?).to eq(true)
    end

    it "returns true if called with on an 7-node sized perfectly balanced BST" do
      bst = Tree.new([1,2,3,4,5,6,7])
      expect(bst.balanced?).to eq(true)
    end

    it "returns true if called with on a certain 4-node sized BST" do
      bst = Tree.new([1,3,5,7])
      expect(bst.balanced?).to eq(true)
    end

    it "returns true if called with on a certain 5-node sized BST" do
      bst = Tree.new([1,3,5,7,9])
      expect(bst.balanced?).to eq(true)
    end

    it "returns true if called on a certain 6-node sized BST" do
      bst = Tree.new([10,20,30,40,100,500])
      expect(bst.balanced?).to eq(true)
    end
  end

  describe "rebalance" do
    it "does nothing if called on an empty BST" do
      bst = Tree.new
      bst.rebalance
      expect(bst.root).to eq(nil)
    end

    it "does nothing if called with on an already balanced 1-node sized BST" do
      bst = Tree.new([1])
      bst.rebalance
      expect(bst.root).to eq(1)
      expect(bst.root.left).to eq(nil)
      expect(bst.root.right).to eq(nil)
    end

    it "does nothing if called with on an already balanced 2-node sized BST" do
      bst = Tree.new([1,2])
      bst.rebalance
      expect(bst.root).to eq(1)
      expect(bst.root.left).to eq(nil)
      expect(bst.root.right).to eq(2)
    end

    it "balances the BST if called on an unbalanced 4-node sized BST" do
      bst = Tree.new([7])
      bst.insert(5)
      bst.insert(3)
      bst.insert(1)
      expect(bst.balanced?).to eq(false)
      bst.rebalance
      expect(bst.balanced?).to eq(true)
      expect(bst.find(3)).to eq(bst.root)
    end

    it "balances the BST if called on an unbalanced 5-node sized BST" do
      bst = Tree.new([9])
      bst.insert(7)
      bst.insert(5)
      bst.insert(3)
      bst.insert(1)
      expect(bst.balanced?).to eq(false)
      bst.rebalance
      expect(bst.balanced?).to eq(true)
      expect(bst.find(5)).to eq(bst.root)
    end

    it "balances the BST if called on an unbalanced 5-node sized BST" do
      bst = Tree.new([500])
      bst.insert(100)
      bst.insert(40)
      bst.insert(30)
      bst.insert(20)
      bst.insert(10)
      expect(bst.balanced?).to eq(false)
      bst.rebalance
      expect(bst.balanced?).to eq(true)
      expect(bst.find(30)).to eq(bst.root)
    end
  end
end
