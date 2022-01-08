//
//  GameScene.swift
//  PlaygroundEngineer-2
//
//  Created by Mekhala Vithala on 1/2/21.
//

import Foundation
import SpriteKit

public var canvas: ShapeNode!
public var onUpdate: (_ currentTime: TimeInterval) -> Void = {currentTime in }
public var OnContactBegin: (_ contact: SKPhysicsContact) -> Void = {contact in }
public var onContactEnd: (_ contact: SKPhysicsContact) -> Void = {contact in }
public var onActionComplete = {}
public let cameraNode = SKCameraNode()

class GameScene: SKScene, SKPhysicsContactDelegate, SKSceneDelegate {
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.physicsWorld.contactDelegate = self
        self.delegate = self
        self.camera = cameraNode
        canvas = ShapeNode(rectOf: self.frame.size)
        canvas.zPosition = -1
        canvas.fillColor = .systemPink
        self.addChild(canvas)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchedNodes = nodes(at: touches.first?.location(in: self) ?? .zero)
        for node in touchedNodes {
            node.touchesBegan(touches, with: event)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchedNodes = nodes(at: touches.first?.location(in: self) ?? .zero)
        for node in touchedNodes {
            node.touchesMoved(touches, with: event)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchedNodes = nodes(at: touches.first?.location(in: self) ?? .zero)
        for node in touchedNodes {
            node.touchesEnded(touches, with: event)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        onUpdate(currentTime)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        OnContactBegin(contact)
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        onContactEnd(contact)
    }
    
    override func didEvaluateActions() {
        onActionComplete()
    }
}
