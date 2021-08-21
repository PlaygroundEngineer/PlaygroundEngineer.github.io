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

var score = 0
let scoreLabel = addScore()

let waitAction = SKAction.wait(forDuration: 1.0)
let soundAction = SKAction.playSoundFileNamed(PlaygroundSound.click, waitForCompletion: true)
let createBalloon = SKAction.run {
    addBalloon()
}
let sequenceAction = SKAction.sequence([waitAction, createBalloon])
let startGameAction = SKAction.repeat(sequenceAction, count: 50)

canvas.run(startGameAction)

func addBalloon() {
    let balloon = ShapeNode(circleOfRadius: 50)
    balloon.color = randomColor()
    balloon.position.x = random(-300, 300)
    balloon.position.y = -300
    canvas.addChild(balloon)
    let moveAction = SKAction.move(to: point(balloon.position.x, 400), duration: random(0.5, 3.0))
    balloon.run(moveAction)
    
    balloon.onTouchUp = {
        canvas.run(soundAction)
        balloon.removeFromParent()
        score = score + 1
        scoreLabel.text = "Score: \(score) "
    }
}

func addScore() -> SKLabelNode {
    let scoreLabel = LabelNode(text: "Score: 0")
    scoreLabel.position = point(100, 200)
    scoreLabel.fontName = Font.arialBoldMT
    scoreLabel.zPosition = 10
    canvas.addChild(scoreLabel)
    return scoreLabel
}
