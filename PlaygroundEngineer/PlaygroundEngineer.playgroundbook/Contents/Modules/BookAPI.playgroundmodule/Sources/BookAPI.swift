//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Contains classes/structs/enums/functions which are part of a module that is
//  automatically imported into user-editable code.
//

import BookCore

// Implement any classes/structs/enums/functions in the BookAPI module which you
// want to be automatically imported and visible for users on playground pages
// and in user modules.
//
// This is controlled via the book-level `UserAutoImportedAuxiliaryModules`
// Manifest.plist key.

import SpriteKit
import PlaygroundSupport
import GameplayKit

public func setScene() {
    PlaygroundPage.current.liveView = LiveViewController()
}

extension LiveViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        let centerView = SKView(frame: view.frame)
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.backgroundColor = .systemGray
        view.addSubview(centerView)
        
        let c1 = NSLayoutConstraint(item: centerView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        
        let c2 = NSLayoutConstraint(item: centerView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        
        let c3 = NSLayoutConstraint(item: centerView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.9, constant: 0)
        
        let c4 = NSLayoutConstraint(item: centerView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.7, constant: 0)
        
        let c5 = NSLayoutConstraint(item: centerView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.7, constant: 0)
        
        let c6 = NSLayoutConstraint(item: centerView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.9, constant: 0)
       
        if view.frame.size.height > view.frame.size.width {
            NSLayoutConstraint.activate([c1, c2, c3, c4])
        } else {
            NSLayoutConstraint.activate([c1, c2, c5, c6])
        }
        
        let scene = GameScene(size: centerView.frame.size)
        scene.scaleMode = .resizeFill
        centerView.presentScene(scene)
        
        centerView.ignoresSiblingOrder = true
        
        centerView.showsFPS = true
        centerView.showsNodeCount = true
        centerView.showsPhysics = true
    }
    
    public override var shouldAutorotate: Bool {
        return true
    }

    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    public override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
