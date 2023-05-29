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

    it "inserts the node correctly if called with 7 on a 5-node size BST" do
      bst = Tree.new([1,2,3,4,5])
      bst.insert(7)
      expect(bst.root.right.right.right).to eq(7)
    end

    it "inserts the node correctly if called with 40 on a 5-node size BST" do
      bst = Tree.new([10,20,30,100,500])
      bst.insert(40)
      expect(bst.root.right.left).to eq(40)
    end
  end

  # TODO
  # tests for `Tree#delete`

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
end
