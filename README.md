# Binary Search Tree

Below is the console output of a `driver.rb` run.

```
$ ruby driver.rb
> 1. Create a binary tree from an array of random numbers
│           ┌── 97
│       ┌── 89
│       │   └── 84
│   ┌── 77
│   │   │   ┌── 70
│   │   └── 68
│   │       └── 52
└── 48
    │       ┌── 36
    │   ┌── 30
    │   │   └── 27
    └── 20
        │   ┌── 17
        └── 7

> 2. Confirm that the tree is balanced by calling `Tree#balanced?`
Is the BST balanced? true

> 3. Print all elements in level, pre, post, and in order
BST level order: [48, 20, 77, 7, 30, 68, 89, 17, 27, 36, 52, 70, 84, 97]
BST preorder:    [48, 20, 7, 17, 30, 27, 36, 77, 68, 52, 70, 89, 84, 97]
BST postorder:   [17, 7, 27, 36, 30, 20, 52, 70, 68, 84, 97, 89, 77, 48]
BST inorder:     [7, 17, 20, 27, 30, 36, 48, 52, 68, 70, 77, 84, 89, 97]

> 4. Unbalance the tree by adding several numbers > 100
│                   ┌── 197
│               ┌── 192
│               │   │   ┌── 176
│               │   │   │   │   ┌── 168
│               │   │   │   └── 164
│               │   │   │       │   ┌── 156
│               │   │   │       └── 144
│               │   │   │           └── 135
│               │   └── 128
│               │       └── 102
│           ┌── 97
│       ┌── 89
│       │   └── 84
│   ┌── 77
│   │   │   ┌── 70
│   │   └── 68
│   │       └── 52
└── 48
    │       ┌── 36
    │   ┌── 30
    │   │   └── 27
    └── 20
        │   ┌── 17
        └── 7

> 5. Confirm that the tree is unbalanced by calling `Tree#balanced?`
Is the BST unbalanced? true

> 6. Balance the tree by calling `Tree#rebalance`
│               ┌── 197
│           ┌── 192
│           │   └── 176
│       ┌── 168
│       │   │   ┌── 164
│       │   └── 156
│   ┌── 144
│   │   │       ┌── 135
│   │   │   ┌── 128
│   │   └── 102
│   │       │   ┌── 97
│   │       └── 89
└── 84
    │           ┌── 77
    │       ┌── 70
    │   ┌── 68
    │   │   │   ┌── 52
    │   │   └── 48
    └── 36
        │       ┌── 30
        │   ┌── 27
        └── 20
            │   ┌── 17
            └── 7

> 7. Confirm that the tree is balanced by calling `Tree#balanced?`
Is the BST balanced? true

> 8. Print all elements in level, pre, post, and in order
BST level order: [84, 36, 144, 20, 68, 102, 168, 7, 27, 48, 70, 89, 128, 156, 192, 17, 30, 52, 77, 97, 135, 164, 176, 197]
BST preorder:    [84, 36, 20, 7, 17, 27, 30, 68, 48, 52, 70, 77, 144, 102, 89, 97, 128, 135, 168, 156, 164, 192, 176, 197]
BST postorder:   [17, 7, 30, 27, 20, 52, 48, 77, 70, 68, 36, 97, 89, 135, 128, 102, 164, 156, 176, 197, 192, 168, 144, 84]
BST inorder:     [7, 17, 20, 27, 30, 36, 48, 52, 68, 70, 77, 84, 89, 97, 102, 128, 135, 144, 156, 164, 168, 176, 192, 197]
```

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
1. [x] Write `Tree#level_order` method
1. [x] Write `Tree#inorder` method
1. [x] Write `Tree#preorder` method
1. [x] Write `Tree#postorder` method
1. [x] Write `Tree#height` method
1. [x] Write `Tree#depth` method
1. [x] Write `Tree#balanced?` method
1. [x] Write `Tree#rebalance` method
1. [x] Write `driver.rb` script that does some stuff

## My TODOs

- [x] Split `index.rb` into separate class files under a new `/classes` folder
- [x] Split `index_spec.rb` into separate test files under a new `/specs` folder
- [x] Move `spec_helper.rb` into the new `/specs` folder
- [x] Create a `driver.rb` file at the root directory
- [x] Update `Node` class to include and use `Comparable` module
- [x] Fix `Tree#build_tree` method to work
- [x] Update `driver.rb` to execute [the 8 steps mentioned in the assignment instructions](https://www.theodinproject.com/lessons/ruby-binary-search-trees#tie-it-all-together)

## Planning Notes

- no duplicate values
  - remove duplicate values OR
  - check for existing values before inserting
- `Tree` class
  - checks a set for duplicate values before inserting new nodes
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
    - TODO

## Misc Notes

### Array slice / subarray using range `..` is not the same as `...` in certain cases e.g.

```ruby
array = [1,2,3,4,5]
array[0..0]         # => [1]
array[0...0]        # => []
```
