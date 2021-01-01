//
//  GameViewController.swift
//  XMonster
//
//  Created by MadJackChurchill on 2020-12-14.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GameViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
    }
override func viewWillLayoutSubviews() {
    
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "bgmusic", ofType: "mp3")!))
        
    }
    catch{
        print(error)
        
    }
    audioPlayer.numberOfLoops = -1
    audioPlayer.prepareToPlay()
    audioPlayer.play()
    
    var skView:SKView = self.view as! SKView
    skView.showsFPS = true
    skView.showsNodeCount = true
    
    var scene:SKScene = GameScene(size: skView.bounds.size)
    scene.scaleMode = SKSceneScaleMode.aspectFill
    skView.presentScene(scene)
    

}
    

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
