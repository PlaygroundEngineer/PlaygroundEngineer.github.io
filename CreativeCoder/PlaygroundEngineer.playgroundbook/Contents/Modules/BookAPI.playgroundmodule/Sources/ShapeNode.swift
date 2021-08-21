//
//  ShapeNode.swift
//  GameKit
//
//  Created by Mekhala Vithala on 1/14/21.
//

import Foundation
import SpriteKit

public class ShapeNode: SKShapeNode {
    
    public var currentTouchPoint = CGPoint.zero
    public enum PhysicsBodyType {
        case circle, rectangle, path
    }
    public var onTouchUp = {}
    public var onTouchDown = {}
    public var onTouchMoved = {}
    public var isDraggable = false
    public var physicsBodyType: PhysicsBodyType = .circle {
        didSet {
            switch physicsBodyType {
            case .rectangle:
                self.physicsBody = SKPhysicsBody(rectangleOf: self.frame.size)
                break
            case .circle:
                self.physicsBody = SKPhysicsBody(circleOfRadius: self.frame.width / 2, center: .zero)
                break
            case .path:
                self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.path ?? CGMutablePath())
            }
            self.affectedByGravity = true
        }
    }
    public var color: UIColor = .blue {
        didSet {
            self.fillColor = color
        }
    }
    public var bounce = 0.2 {
        didSet {
            self.physicsBody?.restitution = CGFloat(bounce)
        }
    }
    public var isDynamic = false {
        didSet {
            self.physicsBody?.isDynamic = isDynamic
        }
    }
    public var pinned = false {
        didSet {
            self.physicsBody?.pinned = pinned
        }
    }
    public var allowsRotation = false {
        didSet {
            self.physicsBody?.allowsRotation = allowsRotation
        }
    }
    public var affectedByGravity: Bool? = nil {
        didSet {
            if let affectedByGravity = affectedByGravity {
                if physicsBody == nil {
                    self.physicsBody = SKPhysicsBody(rectangleOf: self.frame.size)
                }
                if affectedByGravity {
                    self.physicsBody?.affectedByGravity = true
                } else {
                    self.physicsBody?.affectedByGravity = false
                }
            } else {
                self.physicsBody = nil
            }
        }
    }
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
    public override init() {
        super.init()
        self.zPosition = 1
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

public class SpriteNode: SKSpriteNode {
    public var currentTouchPoint = CGPoint.zero
    public enum PhysicsBodyType {
        case circle, rectangle, texture
    }
    public var onTouchUp = {}
    public var onTouchDown = {}
    public var onTouchMoved = {}
    public var isDraggable = false
    public var physicsBodyType: PhysicsBodyType = .circle {
        didSet {
            switch physicsBodyType {
            case .rectangle:
                self.physicsBody = SKPhysicsBody(rectangleOf: self.frame.size)
                break
            case .circle:
                self.physicsBody = SKPhysicsBody(circleOfRadius: self.frame.width / 2, center: .zero)
                break
            case .texture:
                if let texture = self.texture {
                    self.physicsBody = SKPhysicsBody(texture: texture,
                                                     size: self.frame.size)
                } else {
                    self.physicsBody = SKPhysicsBody(circleOfRadius: self.frame.width / 2, center: .zero)
                }
            }
            self.affectedByGravity = true
        }
    }
    
    public var bounce = 0.2 {
        didSet {
            self.physicsBody?.restitution = CGFloat(bounce)
        }
    }
    public var isDynamic = false {
        didSet {
            self.physicsBody?.isDynamic = isDynamic
        }
    }
    public var pinned = false {
        didSet {
            self.physicsBody?.pinned = pinned
        }
    }
    public var allowsRotation = false {
        didSet {
            self.physicsBody?.allowsRotation = allowsRotation
        }
    }
    public var affectedByGravity: Bool? = nil {
        didSet {
            if let affectedByGravity = affectedByGravity {
                if physicsBody == nil {
                    self.physicsBody = SKPhysicsBody(rectangleOf: self.frame.size)
                }
                if affectedByGravity {
                    self.physicsBody?.affectedByGravity = true
                } else {
                    self.physicsBody?.affectedByGravity = false
                }
            } else {
                self.physicsBody = nil
            }
        }
    }
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
    public override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    public convenience init(image: UIImage) {
        if let cgImage = image.cgImage {
            let texture = SKTexture(cgImage: cgImage)
            self.init(texture: texture, color: .clear, size: image.size)
        } else {
            self.init(texture: nil, color: .blue, size: CGSize(width: 100, height: 100))
        }
    }
    public convenience init(image: UIImage, size: CGSize) {
        if let cgImage = image.cgImage {
            let texture = SKTexture(cgImage: cgImage)
            self.init(texture: texture, color: .clear, size: size)
        } else {
            self.init(texture: nil, color: .blue, size: CGSize(width: 100, height: 100))
        }
    }
    public convenience init(image: UIImage, color: UIColor, size: CGSize) {
        if let cgImage = image.cgImage {
            let texture = SKTexture(cgImage: cgImage)
            self.init(texture: texture, color: color, size: size)
        } else {
            self.init(texture: nil, color: .blue, size: CGSize(width: 100, height: 100))
        }
    }
    public convenience init(gradient: [UIColor], size: CGSize) {
        let gradientLayer = CAGradientLayer()
        var gradientColors: [CGColor] = []
        for color in gradient {
            gradientColors.append(color.cgColor)
        }
        gradientLayer.colors = gradientColors
        gradientLayer.frame.size = size
        if let image = UIImage.image(from: gradientLayer) {
            self.init(image: image, size: size)
        } else {
            self.init(texture: nil, color: .blue, size: size)
        }
    }
}

public class PhysicsBody: SKPhysicsBody {
    
}

public class TileMapNode: SKTileMapNode {
    
}

public class FieldNode: SKFieldNode {
    
}

public class Texture: SKTexture {

}

public class LabelNode: SKLabelNode {
    
}

extension SKAction {
    public class func repeatForever(wait sec: TimeInterval, action: @escaping () -> ()) {
        let a1 = SKAction.wait(forDuration: sec)
        let a2 = SKAction.run {
            action()
        }
        let a3 = SKAction.sequence([a1, a2])
        let a4 = SKAction.repeatForever(a3)
        canvas.run(a4)
    }
}





