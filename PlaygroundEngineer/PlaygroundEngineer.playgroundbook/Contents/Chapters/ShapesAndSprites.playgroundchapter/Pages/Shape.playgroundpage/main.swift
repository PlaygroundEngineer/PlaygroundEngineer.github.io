//#-hidden-code
//
//  Copyright © 2016-2022 Satyananda Corp. All rights reserved.
//
//#-code-completion(everything, show)
//#-end-hidden-code

import SpriteKit

setScene()

showGrid()

let circle = ShapeNode(circleOfRadius: 50.0)
canvas.addChild(circle)
circle.fillColor = #colorLiteral(red: 0.9994556308, green: 0.9863594174, blue: 0.2532016337, alpha: 1.0)
circle.lineWidth = 2
circle.zPosition = 1
circle.glowWidth = 10
circle.position = CGPoint(x: 0, y: 0)


let rect = ShapeNode(rect: CGRect(x: -170, y: -200, width: 100, height: 200))
rect.fillColor = #colorLiteral(red: 0.4791436195, green: 0.2884480059, blue: 0.0, alpha: 1.0)
rect.zPosition = 1
canvas.addChild(rect)

let ellipse = ShapeNode(ellipseIn: CGRect(x: -170, y: -50, width: 100, height: 75))
ellipse.fillColor = #colorLiteral(red: 0.9443791509, green: 0.7896900177, blue: 0.9972682595, alpha: 1.0)
ellipse.zPosition = 1
canvas.addChild(ellipse)
