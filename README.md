# knights_travails

A knight in chess can move to any square on the standard 8x8 chess board from any other square on the board, given enough turns.

This program finds the shortest path between two squares as travelled by a knight. Co-ordinates are dealt with as e.g. [0,0] (bottom-left square), [7,7] (top-right square), etc.

The basic idea is to generate a tree of all possible valid moves, add these to a queue which is moved through, adding further moves until the target location is found.

Try it out with e.g. ```knight_moves([0,2],[6,3])```

Part of [The Odin Project's](https://www.theodinproject.com/) section on [Basic Data Structures and Algorithms](https://www.theodinproject.com/courses/ruby-programming/lessons/data-structures-and-algorithms).