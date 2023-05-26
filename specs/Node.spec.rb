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
end
