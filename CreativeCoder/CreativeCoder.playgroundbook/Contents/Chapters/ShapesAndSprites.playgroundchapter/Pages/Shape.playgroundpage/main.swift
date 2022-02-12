
//#-hidden-code
//  Copyright © 2016-2022 Satyananda Corp. All rights reserved.
//
//#-code-completion(everything, show)
//#-end-hidden-code

import SpriteKit

setScene()

showGrid()

let circle = ShapeNode(circleOfRadius: 50.0)
circle.fillColor = #colorLiteral(red: 0.9994556308, green: 0.9863594174, blue: 0.2532016337, alpha: 1.0)
circle.lineWidth = 2
circle.zPosition = 1
circle.glowWidth = 10
circle.position = CGPoint(x: 0, y: 150)
canvas.addChild(circle)

let rect = ShapeNode(rectOf: CGSize(width: 80, height: 200))
rect.fillColor = #colorLiteral(red: 1.0, green: 0.8871788383, blue: 0.8403217196, alpha: 1.0)
rect.zPosition = 2
canvas.addChild(rect)

let ellipse = ShapeNode(ellipseIn: CGRect(x: -100, y: -150, width: 200, height: 75))
ellipse.fillColor = #colorLiteral(red: 0.9999875426, green: 0.8514947295, blue: 0.6595712304, alpha: 1.0)
ellipse.zPosition = 1
canvas.addChild(ellipse)
