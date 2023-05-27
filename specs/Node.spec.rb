require_relative 'spec_helper'
require_relative '../classes/Node'

RSpec.describe 'Node class' do
  describe "initialize" do
    it "works if called" do
      node = Node.new
      expect(node).not_to eq(nil)
    end
  end

  describe "data" do
    it "works if called" do
      node = Node.new(1)
      expect(node.data).to eq(1)
    end
  end

  describe "left" do
    it "works if called" do
      left_node = Node.new(2)
      node = Node.new(1, left_node)
      expect(node.left).to eq(left_node)
    end
  end

  describe "right" do
    it "works if called" do
      right_node = Node.new(2)
      node = Node.new(1, nil, right_node)
      expect(node.right).to eq(right_node)
    end
  end

  describe "<=>" do
    it "returns 1 if called with a node with value 0 on a node with value 1" do
      expect(Node.new(1) <=> Node.new(0)).to eq(1)
    end

    it "returns -1 if called with a node with value 1 on a node with value 0" do
      expect(Node.new(0) <=> Node.new(1)).to eq(-1)
    end

    it "returns 0 if called with a node with value 3 on a node with value 3" do
      expect(Node.new(3) <=> Node.new(3)).to eq(0)
    end
  end
end
