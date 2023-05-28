# top-binary-search-trees

## Quick Start

### Requirements

- Ruby 3.1.4
- RSpec (optional; only for running tests)

### How to run

```bash
ruby driver.rb
```

### How to test

```bash
# if not installed already
gem install rspec

cd specs
rspec Node.spec.rb
rspec Tree.spec.rb
```

## Assignment TODOs

1. [x] Write `Node` class
1. [x] Write `Tree` class
1. [x] Write `Tree#build_tree` method
1. [x] Write `Tree#insert` method
1. [ ] Write `Tree#delete` method
1. [x] Write `Tree#find` method
1. [ ] Write `Tree#level_order` method
1. [ ] Write `Tree#inorder` method
1. [ ] Write `Tree#preorder` method
1. [ ] Write `Tree#postorder` method
1. [ ] Write `Tree#height` method
1. [ ] Write `Tree#depth` method
1. [ ] Write `Tree#balanced?` method
1. [ ] Write `Tree#rebalance` method
1. [ ] Write `driver.rb` script that does some stuff

## My TODOs

- [x] Split `index.rb` into separate class files under a new `/classes` folder
- [x] Split `index_spec.rb` into separate test files under a new `/specs` folder
- [x] Move `spec_helper.rb` into the new `/specs` folder
- [x] Create a `driver.rb` file at the root directory
- [x] Update `Node` class to include and use `Comparable` module
- [x] Fix `Tree#build_tree` method to work
- [ ] Update `driver.rb` to execute [the 8 steps mentioned in the assignment instructions](https://www.theodinproject.com/lessons/ruby-binary-search-trees#tie-it-all-together)

## Planning Notes

- no duplicate values
  - remove duplicate values OR
  - check for existing values before inserting
- `Tree` class
  - uses a set to check for duplicate values
  - constructor(values)
    - remove all duplicate values from and sort `values`
    - @`root` = `build_tree(values)`
  - build_tree(sorted_arr)
    - recursively build BST from sorted array of ints
    - returns root node of BST
  - insert(value)
    - summary
      - find a target leaf node or node with 1 child
      - attach new node to target as target's L or R child
    - return if `value` already exists in the tree
    - if @`root` is null,
      - set @`root` to new node with `value` and return
    - parent = null
    - curr = root
    - while curr is not null
      - parent = curr
      - if curr's value < value
        - curr = curr.right
      - else curr's value > value (b/c we filtered out duplicates)
        - curr = curr.left
    - create new node `new_node` with `value`
    - if `value` > parent's value
      - parent.right = `new_node`
    - else
      - parent.left = `new_node`
  - delete(value)
    - return if @`root` is null
    - parent = null
    - curr = @`root`
    - while curr is not null
      - parent = curr
      - if curr's value == value
        - break out of loop
      - else if curr's value < value
        - curr = curr.right
      - else curr's value > value
        - curr = curr.left
    - return if curr is null (means didn't find value)
    - if curr has L & R children
      - TODO
    - else if curr has either L XOR C child only
      - save pointer `child` to curr's L or R child
      - curr.right = null
      - if parent's value > child's value
        - parent.left = child
      - else
        - parent.right = child
    - else curr is leaf node
      - isLeft? parent.left = null : parent.right = null
  - find(value)
    - TODO
  - level_order(&block)
    - TODO
  - inorder(&block)
    - TODO
  - preorder(&block)
    - TODO
  - postorder(&block)
    - TODO
  - height(node)
    - TODO
  - depth(node)
    - TODO
  - balanced?
    - TODO
  - rebalance
    - TODO

## Misc Notes

### Array slice / subarray using range `..` is not the same as `...` in certain cases e.g.

```ruby
array = [1,2,3,4,5]
array[0..0]         # => [1]
array[0...0]        # => []
```
