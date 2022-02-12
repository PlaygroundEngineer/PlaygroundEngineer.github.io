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
curve.move(to: CGPoint(x: -150, y: 150))
curve.addQuadCurve(to: CGPoint(x: 150, y: 150), control: CGPoint(x: 0, y: 0))

//create a shape node
let curveNode = ShapeNode(path: curve)
curveNode.strokeColor = #colorLiteral(red: 0.2168135047, green: 0.1025053188, blue: 0.5823028088, alpha: 1.0)
canvas.addChild(curveNode)


