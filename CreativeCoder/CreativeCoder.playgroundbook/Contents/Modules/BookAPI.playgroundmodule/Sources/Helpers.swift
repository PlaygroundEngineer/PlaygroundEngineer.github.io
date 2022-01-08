//
//  Helpers.swift
//  GameKit
//
//  Created by Mekhala Vithala on 1/4/21.
//

import Foundation
import UIKit
import SpriteKit

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

extension UIColor {

    func lighter(by percentage: CGFloat = 30.0) -> UIColor {
        return self.adjust(by: abs(percentage) )
    }

    func darker(by percentage: CGFloat = 30.0) -> UIColor {
        return self.adjust(by: -1 * abs(percentage) )
    }

    func adjust(by percentage: CGFloat = 30.0) -> UIColor {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            if percentage < 0 {
                return UIColor.white
            } else {
                return UIColor.black
            }
        }
    }
}

public func showGrid() {
    
    let color = randomColor()
    let xAxis = CGMutablePath()
    xAxis.addLines(between: [CGPoint(x: 0, y: canvas.frame.minY), CGPoint(x: 0, y: canvas.frame.maxY)])
    let x = ShapeNode(path: xAxis)
    x.strokeColor = color
    x.zPosition = 0
    canvas.addChild(x)
    
    let yAxis = CGMutablePath()
    yAxis.addLines(between:  [CGPoint(x: canvas.frame.minX, y: 0), CGPoint(x: canvas.frame.maxX, y: 0)])
    let y = ShapeNode(path: yAxis)
    y.strokeColor = color
    y.zPosition = 0
    canvas.addChild(y)
    
    for i in -5...5 {
        
        if i == 0  { continue }
        
        let yPoint = ShapeNode(circleOfRadius: 3.0)
        yPoint.fillColor = color
        yPoint.zPosition = 0
        yPoint.position = CGPoint(x: 0, y: i * 100)
        canvas.addChild(yPoint)
        
        let xPoint = ShapeNode(circleOfRadius: 3.0)
        xPoint.fillColor = color
        xPoint.zPosition = 0
        xPoint.position = CGPoint(x: i * 100, y: 0 )
        canvas.addChild(xPoint)
        
        let yLabel = SKLabelNode(text: "\(i * 100)")
        yLabel.position = CGPoint(x: 20, y: i * 100)
        yLabel.fontName = "Georgia"
        yLabel.fontSize = 13
        yLabel.fontColor = color
        yLabel.zPosition = 0
        canvas.addChild(yLabel)
        
        let xLabel = SKLabelNode(text: "\(i * 100)")
        xLabel.position = CGPoint(x: i * 100, y: -20)
        xLabel.fontName = "Georgia"
        xLabel.fontSize = 13
        xLabel.fontColor = color
        xLabel.zPosition = 0
        canvas.addChild(xLabel)
    }
 }

public func randomColor() -> UIColor {
    let r = Double.random(in: 0...1)
    let g = Double.random(in: 0...1)
    let b = Double.random(in: 0...1)
    return UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1.0)
}

public func randomColor(withAlpha: Double) -> UIColor {
    let r = Double.random(in: 0...1)
    let g = Double.random(in: 0...1)
    let b = Double.random(in: 0...1)
    return UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(withAlpha))
}

public func random(_ a: Int, _ b: Int) -> Int {
    return Int.random(in: a...b)
}

public func random(_ a: Double, _ b: Double) -> Double {
    return Double.random(in: a...b)
}

public func random(_ a: CGFloat, _ b: CGFloat) -> CGFloat {
    return CGFloat.random(in: a...b)
}

public func point(_ x: Int, _ y: Int) -> CGPoint {
    return CGPoint(x: x, y: y)
}

public func point(_ x: Double, _ y: Double) -> CGPoint {
    return CGPoint(x: x, y: y)
}

public func point(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
    return CGPoint(x: x, y: y)
}

public func addCollisionBoarderToCanvas() {
    canvas.physicsBodyType = .path
    canvas.isDynamic = true
    canvas.affectedByGravity = false
}

public struct PlaygroundImage {
    public static var badMonster = UIImage(named: "badMonster.png")!
    public static var goodMonster = UIImage(named: "goodMonster.png")!
    public static var blueBall = UIImage(named: "blueBall.png")!
    public static var pinkBall = UIImage(named: "pinkBall.png")!
    public static var yellowBall = UIImage(named: "yellowBall.png")!
    public static var greenBall = UIImage(named: "greenBall.png")!
}

public struct PlaygroundSound {
    public static var alarmHarp = "alarm_harp_looped_002.wav"
    public static var alarmMicro = "alarm_micro_vibe_looped_007.wav"
    public static var alertBright = "alert_bright_echo_010.wav"
    public static var click = "click_011.wav"
    public static var error = "game_error_002.wav"
    public static var lose = "game_lose_001.wav"
    public static var win = "tone_alert_006"
    public static var notify = "kali_notify_001"
    public static var alertNegative = "negative_alert_007.wav"
    public static var alertPositive = "perc_positive_001.wav"
    public static var alertNegative2 = "perc_negative_005.wav"
    public static var singleBell = "perc_single_bell_001.wav"
    public static var toneBend = "tone_bend_004.wav"
    public static var swell01 = "tone_swell_001.wav"
    public static var swell02 = "tone_swell_002.wav"
    public static var swell03 = "tone_swell_003.wav"
    public static var swell04 = "tone_swell_004.wav"
}

public struct Font {
    public static var arialMT = "ArialMT"
    public static var arialBoldItalicMT = "Arial-BoldItalicMT"
    public static var arialBoldMT = "Arial-BoldMT"
    public static var arialItalicMT = "Arial-ItalicMT"
    public static var markerFeltThin = "MarkerFelt-Thin"
    public static var palatinoRoman  = "Palatino-Roman"
    public static var snellRoundhand = "SnellRoundhand"
}

public struct EmitterFile {
    public static var fire = "Fire.sks"
    public static var fireFlies = "FireFlies.sks"
    public static var rain = "Rain.sks"
    public static var smoke = "Smoke.sks"
    public static var spark = "Spark.sks"
    public static var bokeh = "Bokeh.sks"
    public static var snow = "Snow.sks"
}


extension UIImage {
    class func image(from layer: CALayer) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(layer.bounds.size,
                                               layer.isOpaque, UIScreen.main.scale)
        
        defer { UIGraphicsEndImageContext() }
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        layer.render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

public func mask(_ node: SKNode, with maskNode: SKNode) -> SKCropNode {
    let cropNode = SKCropNode()
    cropNode.maskNode = maskNode
    cropNode.addChild(node)
    return cropNode
}

public class EmitterNode: SKEmitterNode {
    
    
}

public func removeOutOfScreenNodes() {
    let screen = UIScreen.main.bounds
    for node in canvas.children {
        if abs(node.position.x) > screen.width / 2 ||
            abs(node.position.y) > screen.height / 2 {
            node.removeFromParent()
        }
    }
}

