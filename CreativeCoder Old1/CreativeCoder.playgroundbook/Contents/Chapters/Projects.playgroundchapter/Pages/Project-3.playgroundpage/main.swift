//#-hidden-code
//
//  Copyright © 2016-2022 Satyananda Corp. All rights reserved.
//
//#-code-completion(everything, show)
//#-end-hidden-code

import SpriteKit

setScene()

showGrid()

//Challenge: Create checkerboard pattern

//size represents size of each square. modify it as you like
let size = 50

//row function helps to create one row in checkerboard
func row(x: Int, y: Int, first: UIColor, second: UIColor) {
    var x = x
    for i in 1 ... 4 {
        let firstSquare = ShapeNode(rectOf: CGSize(width: size, height: size))
        firstSquare.color = first
        firstSquare.position.x = CGFloat(x)
        firstSquare.position.y = CGFloat(y)
        canvas.addChild(firstSquare)
        x += size * 2
        
        let secondSquare = ShapeNode(rectOf: CGSize(width: size, height: size))
        secondSquare.color = second
        canvas.addChild(secondSquare)
        secondSquare.position.x = firstSquare.position.x + CGFloat(size)
        secondSquare.position.y = CGFloat(y)
    }
}

//use row Function and for loop to create checkerboard pattern
row(x: 0, y: 0, first: .black, second: .white)
