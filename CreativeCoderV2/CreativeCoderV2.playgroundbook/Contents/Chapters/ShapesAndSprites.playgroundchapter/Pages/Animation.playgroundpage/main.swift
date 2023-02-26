
//#-hidden-code
//  Copyright © 2016-2022 Satyananda Corp. All rights reserved.
//
//#-code-completion(everything, show)
//#-end-hidden-code

import SpriteKit

setScene()

showGrid()

canvas.color = #colorLiteral(red: 0.6933748722, green: 0.8683621287, blue: 0.5471815467, alpha: 1.0)
let butterFly = SpriteNode(image: #imageLiteral(resourceName: "butterfly-1"))
canvas.addChild(butterFly)

let s1 = SKAction.scaleX(to: 1.0, duration: 0.1)
let s2 = SKAction.scaleX(to: 0.1, duration: 0.1)
let s3 = SKAction.sequence([s1, s2, s1])
let s4 = SKAction.repeatForever(s3)
butterFly.run(s4)

let curve = CGMutablePath()
curve.move(to: CGPoint(x: -150, y: 150))
curve.addQuadCurve(to: CGPoint(x: 150, y: 150),
                   control: CGPoint(x: 0, y: 0))

let s5 = SKAction.follow(curve, speed: 40.0)
butterFly.run(s5)
