//#-hidden-code
//
//  Copyright © 2016-2022 Satyananda Corp. All rights reserved.
//
//#-code-completion(everything, show)
//#-end-hidden-code


import SpriteKit

setScene()

addCollisionBoarderToCanvas()

//Rules
//pink ball when contacts blue ball, a new yellow ball appears.
//you can add a new pink and blue ball by touching canvas
//play it and then extend it with your own idea.
    
addCollisionBoarderToCanvas()

struct Categories {
    static var pink: UInt32 = 1
    static var blue: UInt32 = 2
    static var yellow: UInt32 = 4
}

func addPlayer(image: UIImage) -> SKNode {
    let player = SpriteNode(image: image)
    canvas.addChild(player)
    player.physicsBodyType = .circle
    player.affectedByGravity = false
    
    let frame = canvas.frame
    player.position.x = random(frame.minX, frame.maxX)
    player.position.y = random(frame.minY, frame.maxY)
    player.physicsBody?.friction = 0
    player.physicsBody?.restitution = 1.0
    player.physicsBody?.linearDamping = 0
    player.physicsBody?.angularDamping = 0
    player.physicsBody?.applyImpulse(CGVector(dx: random(-40, 40), dy: random(-40, 40)))
    return player
}

canvas.onTouchUp = {
    let pink = addPlayer(image: PlaygroundImage.pinkBall)
    pink.physicsBody?.categoryBitMask = Categories.pink
    pink.physicsBody?.contactTestBitMask = Categories.blue
    
    let blue = addPlayer(image: PlaygroundImage.blueBall)
    blue.physicsBody?.categoryBitMask = Categories.blue
    blue.physicsBody?.contactTestBitMask = Categories.pink
}

//add yellow ball
func addYellowBall(at point: CGPoint) -> SKNode {
    let yellowBall = SpriteNode(image: PlaygroundImage.yellowBall)
    canvas.addChild(yellowBall)
    yellowBall.position = point
    yellowBall.physicsBodyType = .circle
    yellowBall.physicsBody?.categoryBitMask = Categories.yellow
    return yellowBall
}

let sound = SKAction.playSoundFileNamed(PlaygroundSound.click, waitForCompletion: false)
onContactEnd = { contact in
    if contact.bodyA.categoryBitMask == Categories.blue && contact.bodyB.categoryBitMask == Categories.pink {
        if let position = contact.bodyA.node?.position {
            let node = addYellowBall(at: position)
            node.run(sound)
        }
    }
    if contact.bodyB.categoryBitMask == Categories.blue && contact.bodyA.categoryBitMask == Categories.pink {
        if let position = contact.bodyA.node?.position {
            let node = addYellowBall(at: position)
            node.run(sound)
        }
    }
}
