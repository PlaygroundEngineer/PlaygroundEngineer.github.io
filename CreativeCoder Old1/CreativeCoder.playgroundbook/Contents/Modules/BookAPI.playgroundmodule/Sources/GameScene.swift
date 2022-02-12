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

open class GameScene: SKScene, SKPhysicsContactDelegate, SKSceneDelegate {
    
    public override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.physicsWorld.contactDelegate = self
        self.delegate = self
        self.camera = cameraNode
        let size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-(UIScreen.main.bounds.height/10))
        canvas = ShapeNode(rectOf: size)
        canvas.zPosition = -1
        canvas.fillColor = .systemPink
        self.addChild(canvas)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchedNodes = nodes(at: touches.first?.location(in: self) ?? .zero)
        for node in touchedNodes {
            node.touchesBegan(touches, with: event)
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchedNodes = nodes(at: touches.first?.location(in: self) ?? .zero)
        for node in touchedNodes {
            node.touchesMoved(touches, with: event)
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchedNodes = nodes(at: touches.first?.location(in: self) ?? .zero)
        for node in touchedNodes {
            node.touchesEnded(touches, with: event)
        }
    }
    
    public override func update(_ currentTime: TimeInterval) {
        //removeOutOfScreenNodes()
        onUpdate(currentTime)
    }
    
    public func didBegin(_ contact: SKPhysicsContact) {
        OnContactBegin(contact)
    }
    
    public func didEnd(_ contact: SKPhysicsContact) {
        onContactEnd(contact)
    }
    
    public override func didEvaluateActions() {
        onActionComplete()
    }
}

