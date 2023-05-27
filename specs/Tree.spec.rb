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
end
