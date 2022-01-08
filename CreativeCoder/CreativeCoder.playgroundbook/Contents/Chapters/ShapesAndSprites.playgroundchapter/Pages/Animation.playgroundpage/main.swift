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

let sprite1 = SpriteNode(color: #colorLiteral(red: 0.0, green: 0.3813630939, blue: 0.9982447028, alpha: 1.0), size: CGSize(width: 100, height: 100))
canvas.addChild(sprite1)
let move1 = SKAction.move(to: CGPoint(x: 150, y: 0), duration: 2.0)
sprite1.run(move1)

let sprite2 = SpriteNode(color: #colorLiteral(red: 0.5998241305, green: 0.1623607874, blue: 0.7411823869, alpha: 1.0), size: CGSize(width: 100, height: 100))
canvas.addChild(sprite2)
let rotate2 = SKAction.rotate(byAngle: 1.0, duration: 2.0)
sprite2.run(rotate2)

let sprite3 = SpriteNode(color: #colorLiteral(red: 0.9994556308, green: 0.9863594174, blue: 0.2532016337, alpha: 1.0), size: CGSize(width: 100, height: 100))
sprite3.position = CGPoint(x: -150, y: 0)
canvas.addChild(sprite3)
let wait3 = SKAction.wait(forDuration: 2.0)
let move3 = SKAction.move(to: CGPoint(x: -150, y: -150), duration: 2.0)
let rotate3 = SKAction.rotate(byAngle: 2.0, duration: 0.5)
let moveAndRotate = SKAction.sequence([wait3, move3, rotate3])
sprite3.run(moveAndRotate)

let sprite4 = SpriteNode(color: #colorLiteral(red: 0.5875531435, green: 0.8266115785, blue: 0.3729653656, alpha: 1.0), size: CGSize(width: 100, height: 100))
sprite4.position = CGPoint(x: -150, y: 150)
canvas.addChild(sprite4)
let move4 = SKAction.move(to: CGPoint(x: 150, y: 150), duration: 2.0)
let rotate4 = SKAction.rotate(byAngle: 2.0, duration: 0.5)
let rotate4ever = SKAction.repeatForever(rotate4)
let moveWhileRotating = SKAction.group([move4, rotate4ever])
sprite4.run(moveWhileRotating)


