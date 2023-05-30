require_relative 'classes/Tree'

# 1. Create a binary tree from an array of random numbers
bst = Tree.new(Array.new(15) { Random.new.rand(0..100) })
bst.pretty_print

# 2. Confirm that the tree is balanced by calling `Tree#balanced?`
puts("Is the BST balanced? #{bst.balanced?}")

# 3. Print all elements in level, pre, post, and in order
puts("BST level order: #{bst.level_order.to_s}")
puts("BST preorder:    #{bst.preorder.to_s}")
puts("BST postorder:   #{bst.postorder.to_s}")
puts("BST inorder:     #{bst.inorder.to_s}")

# 4. Unbalance the tree by adding several numbers > 100
10.times { |i| bst.insert(Random.new.rand(101..201)) }
puts
bst.pretty_print

# 5. Confirm that the tree is unbalanced by calling `Tree#balanced?`
puts("Is the BST unbalanced? #{!bst.balanced?}")

# 6. Balance the tree by calling `Tree#rebalance`
bst.rebalance
puts
bst.pretty_print

# 7. Confirm that the tree is balanced by calling `Tree#balanced?`
puts("Is the BST balanced? #{bst.balanced?}")

# 8. Print out all elements in level, pre, post, and in order
puts("BST level order: #{bst.level_order.to_s}")
puts("BST preorder:    #{bst.preorder.to_s}")
puts("BST postorder:   #{bst.postorder.to_s}")
puts("BST inorder:     #{bst.inorder.to_s}")
