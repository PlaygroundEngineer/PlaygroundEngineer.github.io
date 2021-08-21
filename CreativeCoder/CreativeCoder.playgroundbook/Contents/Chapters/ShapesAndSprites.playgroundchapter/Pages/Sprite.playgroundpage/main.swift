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

canvas.color = .yellow
let image = Texture(cgImage: #imageLiteral(resourceName: "butterfly-1.png").cgImage!)
let node = SpriteNode(texture: image)
node.position = CGPoint(x: 0, y: 0)
node.zRotation = 1.3
canvas.addChild(node)

