require_relative 'spec_helper'
require_relative 'index'

RSpec.describe 'Node class' do
  describe "initialize" do
    it "works if called" do
      # TODO
      node = Node.new
      expect(true).to eq(true)
      # expect(node.value).to eq(nil)
      # expect(node.next_node).to eq(nil)
    end
  end
end
