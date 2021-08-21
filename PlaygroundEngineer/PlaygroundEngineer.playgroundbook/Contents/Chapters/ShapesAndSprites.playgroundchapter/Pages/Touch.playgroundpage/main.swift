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

canvas.color = #colorLiteral(red: 0.800970614, green: 0.9103804827, blue: 0.7090534568, alpha: 1.0)

canvas.onTouchUp = {
    let image = Texture(cgImage: #imageLiteral(resourceName: "butterfly-1.png").cgImage!)
    let node = SpriteNode(texture: image)
    node.position = canvas.currentTouchPoint
    node.zRotation = CGFloat(random(0.1, 0.5))
    node.setScale(CGFloat(random(0.2, 0.6)))
    canvas.addChild(node)
}
