# BST-Haskell
Implementation of BST in Haskell
This implementation of Binary Search Tree in Haskell supports the following functions :
	
	insert :: Ord a => BST a -> a -> BST a	
	
	inTree :: Ord a => BST a -> a -> Bool
	
	delete :: Ord a => BST a -> a -> BST a

Helper functions are not included in this list.

	inserter :: Ord a => [a] -> BST a

inserter accepts a list and produces a new Binary Search Tree with all of the elements inserted sequentially into an initially empty tree.
