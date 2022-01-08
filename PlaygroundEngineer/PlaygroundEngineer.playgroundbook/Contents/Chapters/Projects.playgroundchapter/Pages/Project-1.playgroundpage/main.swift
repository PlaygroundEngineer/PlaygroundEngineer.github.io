//#-hidden-code
//
//  Copyright © 2016-2022 Satyananda Corp. All rights reserved.
//
//#-code-completion(everything, show)
//#-end-hidden-code



import SpriteKit

setScene()

showGrid()

func getPath(points: [CGPoint]) -> CGPath {
    let path = CGMutablePath()
    path.addLines(between: points)
    path.closeSubpath()
    return path
}

func wheel(spokes: Int, color: UIColor, points: [CGPoint]) -> ShapeNode {
    let path = getPath(points: points)
    
    //create parent shape node
    let node = ShapeNode()
    var rotation = 0.0
    for i in 1...spokes {
        let line = ShapeNode(path: path)
        line.lineWidth = 10
        line.strokeColor = color
        line.zRotation = CGFloat(rotation)
        rotation += (2 * 3.143) / Double(spokes)
        node.addChild(line)
    }
    return node
}

let node = wheel(spokes: 5, color: .green, points: [CGPoint(x: -100, y: 0), CGPoint(x: 100, y: 0)])
canvas.addChild(node)
