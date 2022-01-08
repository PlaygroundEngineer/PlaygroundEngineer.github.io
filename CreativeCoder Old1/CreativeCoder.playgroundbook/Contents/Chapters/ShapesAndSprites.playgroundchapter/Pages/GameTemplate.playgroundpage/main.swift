//#-hidden-code
//
//  Copyright © 2016-2022 Satyananda Corp. All rights reserved.
//
//#-code-completion(everything, show)
//#-end-hidden-code

import SpriteKit

setScene()

showGrid()


//This is only a template. Remove any code that is not needed for your game.

//Adds collision boarder to the canvas.
addCollisionBoarderToCanvas()

//Triggers when you start touching the screen or place the fingure on the screen
canvas.onTouchDown = {
    let currentTouchPoint = canvas.currentTouchPoint
}

//Triggers when screen touch ends or you lift the fingure from the screen
canvas.onTouchUp = {
    let currentTouchPoint = canvas.currentTouchPoint
}

//Categorize the nodes in your game. Add/delete/modify the variables player and opponent in the struct as needed. Use even numbers like 2, 4, 6 etc to represent categories.
struct Categories {
    static var player = 2
    static var opponent = 4
}

//Triggers when two physics bodies come into contact. OnContactBegin triggers at the start of the contact.
OnContactBegin = { contact in
    if contact.bodyA.categoryBitMask == Categories.player {
        
    }
}

//Triggers when two physics bodies come into contact. OnContactEnd triggers at the end of the contact.
onContactEnd = { contact in
    if contact.bodyA.categoryBitMask == Categories.player {
        
    }
}

//OnUpdate triggers once for every frame. FPS = 60 means, 60 frames per sec. Add code to this closure if you want to update or check state of your game continuously.
onUpdate = { currentTime in
    
}



