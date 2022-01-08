//#-hidden-code
//
//  Copyright © 2016-2022 Satyananda Corp. All rights reserved.
//
//#-code-completion(everything, show)
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

