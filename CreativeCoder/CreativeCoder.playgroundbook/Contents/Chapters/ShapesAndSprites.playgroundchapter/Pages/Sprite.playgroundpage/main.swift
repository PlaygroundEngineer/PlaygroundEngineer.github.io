
//#-hidden-code
//  Copyright © 2016-2022 Satyananda Corp. All rights reserved.
//
//#-code-completion(everything, show)
//#-end-hidden-code

import SpriteKit

setScene()

showGrid()

canvas.color = #colorLiteral(red: 1.0, green: 0.9750056863, blue: 0.5832457542, alpha: 1.0)
let node = SpriteNode(image: #imageLiteral(resourceName: "butterfly-1"))
node.position = CGPoint(x: 0, y: 0)
node.zRotation = 1.3
canvas.addChild(node)


