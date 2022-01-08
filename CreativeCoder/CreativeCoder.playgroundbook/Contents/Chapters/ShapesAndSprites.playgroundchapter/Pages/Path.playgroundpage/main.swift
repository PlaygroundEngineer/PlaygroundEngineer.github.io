//#-hidden-code
//
//  Copyright © 2016-2022 Satyananda Corp. All rights reserved.
//
//#-code-completion(everything, show)
//#-end-hidden-code

import SpriteKit

setScene()
showGrid()

canvas.color = .white

let points = [CGPoint(x: -150, y: 0),
              CGPoint(x: -100, y: 50),
              CGPoint(x: 100, y: 50),
              CGPoint(x: 150, y: 0),
              CGPoint(x: 100, y: -50),
              CGPoint(x: -100, y: -50)]

//create path with lines
let path = CGMutablePath()
path.addLines(between: points)
path.closeSubpath()

//create a shape node
let node = ShapeNode(path: path)
node.strokeColor = #colorLiteral(red: 0.4816868901, green: 0.1280925274, blue: 0.6221188307, alpha: 1.0)
canvas.addChild(node)

// create a path with curve
let curve = CGMutablePath()
curve.move(to: CGPoint(x: 0, y: 0))
curve.addCurve(to: CGPoint(x: 0, y: 150), control1: CGPoint(x: 100, y: 100), control2: CGPoint(x: -100, y: 100))

//create a shape node
let curveNode = ShapeNode(path: curve)
curveNode.strokeColor = #colorLiteral(red: 0.2168135047, green: 0.1025053188, blue: 0.5823028088, alpha: 1.0)
curveNode.fillColor = #colorLiteral(red: 1.0, green: 0.6663846374, blue: 0.0, alpha: 1.0)
canvas.addChild(curveNode)



