//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code

import SpriteKit

setScene()

showGrid()

canvas.color = #colorLiteral(red: 1.0, green: 0.9750056863, blue: 0.5832457542, alpha: 1.0)
let node = SpriteNode(image: #imageLiteral(resourceName: "butterfly-1"))
node.position = CGPoint(x: 0, y: 0)
node.zRotation = 1.3
canvas.addChild(node)


