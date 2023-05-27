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

## TODOs

- [x] split `index.rb` into separate class files under a new `/classes` folder
- [x] split `index_spec.rb` into separate test files under a new `/specs` folder
- [x] move `spec_helper.rb` into the new `/specs` folder
- [x] create a `driver.rb` file at the root directory
- [x] update `Node` class to include and use `Comparable` module
- [x] fix `Tree#build_tree` method to work
- [ ] update `driver.rb` to execute [the 8 steps mentioned in the assignment instructions](https://www.theodinproject.com/lessons/ruby-binary-search-trees#tie-it-all-together)

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

## Misc Notes

### Array slice / subarray using range `..` is not the same as `...` in certain cases e.g.

```ruby
array = [1,2,3,4,5]
array[0..0]         # => [1]
array[0...0]        # => []
```
