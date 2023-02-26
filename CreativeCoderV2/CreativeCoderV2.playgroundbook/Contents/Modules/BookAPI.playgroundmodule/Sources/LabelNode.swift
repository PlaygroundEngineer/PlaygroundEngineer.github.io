//
//  LabelNode.swift
//  GameKit
//
//  Created by Mekhala Vithala on 3/21/21.
//

import SpriteKit

open class LabelNode: SKLabelNode {
    public var isDraggable = false
    public var currentTouchPoint = CGPoint.zero
    public var onTouchUp = {}
    public var onTouchDown = {}
    public var onTouchMoved = {}
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentTouchPoint = touches.first?.location(in: self) ?? .zero
        onTouchDown()
    }
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentTouchPoint = touches.first?.location(in: self) ?? .zero
        if isDraggable {
            if let location = touches.first?.location(in: self.parent ?? self) {
                self.position = location
            }
        }
        onTouchMoved()
    }
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentTouchPoint = touches.first?.location(in: self) ?? .zero
        onTouchUp()
    }
}
