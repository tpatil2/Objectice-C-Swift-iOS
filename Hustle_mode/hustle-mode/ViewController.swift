//
//  ViewController.swift
//  hustle-mode
//
//  Created by Tejas Patil on 12/21/17.
//  Copyright © 2017 Tejas Patil. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var Rocket: UIImageView!
    @IBOutlet weak var hustleLbl: UILabel!
    @IBOutlet weak var onLbl: UILabel!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }


    @IBAction func powerBtnPress(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerBtn.isHidden = true
        
    player.play()

    UIView.animate(withDuration: 4.3, animations: {
    self.Rocket.frame = CGRect(x: 0, y: 40, width: 375, height: 402)
    }) { (finished) in
    self.hustleLbl.isHidden = false
    self.onLbl.isHidden = false
    }
}
}

