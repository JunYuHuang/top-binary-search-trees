# top-binary-search-trees

## Quick Start

### Requirements

- Ruby 3.1.4
- RSpec (optional; only for running tests)

### How to test

```bash
# if not installed already
gem install rspec

rspec index_spec.rb
```

## TODOs

- [ ] split `index.rb` into separate class files under a new `/classes` folder
- [ ] split `index_spec.rb` into separate test files under a new `/specs` folder
- [ ] move `spec_helper.rb` into the new `/specs` folder
- [ ] create a `driver.rb` file at the root directory that executes [the 8 steps mentioned in the assignment instructions](https://www.theodinproject.com/lessons/ruby-binary-search-trees#tie-it-all-together)

## Planning Notes

- no duplicate values
  - remove duplicate values OR
  - check for existing values before inserting
