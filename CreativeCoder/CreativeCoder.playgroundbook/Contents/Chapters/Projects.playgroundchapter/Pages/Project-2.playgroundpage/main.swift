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
node.position = CGPoint(x: 150, y: 75)
node.zRotation = 1.3
canvas.addChild(node)

let a1 = SKAction.scaleX(to: 0.6, duration: 0.1)
let a2 = SKAction.scaleX(to: 0.2, duration: 0.2)
let a3 = SKAction.sequence([a1, a2])
let a4 = SKAction.repeatForever(a3)
node.run(a4)

//create path
let path = CGMutablePath()
path.move(to: CGPoint(x: -200, y: 75))
path.addCurve(to: CGPoint(x: 200, y: 75),
              control1: CGPoint(x: -75, y: 150),
              control2: CGPoint(x: 75, y: 0))

//create shape node using path
let node1 = ShapeNode(path: path)
node1.strokeColor = #colorLiteral(red: 0.8894588351, green: 0.1420151591, blue: 0.0, alpha: 1.0)
node1.lineWidth = 1.0
canvas.addChild(node1)

let a5 = SKAction.follow(path, speed: 60.0)
let a6 = SKAction.group([a4, a5])
node.position = node1.position
node.run(a6)
