//
//  ViewController.swift
//  Mask Genius
//
//  Created by Alison Soong on 6/30/20.
//  Copyright © 2020 Alison Soong. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var gameCheckBubble: UIView!
    @IBOutlet weak var masksCheckBubble: UIView!
    @IBOutlet weak var infoCheckBubble: UIView!
    @IBOutlet weak var gameCheck: UIImageView!
    @IBOutlet weak var masksCheck: UIImageView!
    @IBOutlet weak var infoCheck: UIImageView!
    @IBOutlet weak var homeScrollView: UIScrollView!
    @IBOutlet weak var playGameButton: UIButton!
    
    let defaults = UserDefaults.standard
    let gameKey = "GameCheck"
    let maskKey = "MaskCheck"
    let infoKey = "InfoCheck"
    var game = true
    var mask = true
    var info = true
    var notFirstTime = true
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        gameCheckBubble.layer.cornerRadius = gameCheckBubble.frame.size.height / 5
        masksCheckBubble.layer.cornerRadius = masksCheckBubble.frame.size.height / 5
        infoCheckBubble.layer.cornerRadius = infoCheckBubble.frame.size.height / 5
        
        playGameButton.layer.borderWidth = 3;
        playGameButton.layer.cornerRadius = playGameButton.frame.size.height / 5
        playGameButton.layer.borderColor = UIColor.init(named: "BrandGreen")?.cgColor
        
        
        if (!self.defaults.bool(forKey:"NotFirstTime")){
            self.defaults.set(self.notFirstTime, forKey: "NotFirstTime")
            self.defaults.set(self.game, forKey: self.gameKey)
            self.defaults.set(self.mask, forKey: self.maskKey)
            self.defaults.set(self.info, forKey: self.infoKey)
        } else {
            game = self.defaults.bool(forKey:self.gameKey)
            mask = self.defaults.bool(forKey:self.maskKey)
            info = self.defaults.bool(forKey:self.infoKey)
        }
        
        gameCheck.isHidden = game
        masksCheck.isHidden = mask
        infoCheck.isHidden = info
        
        homeScrollView.setContentOffset(CGPoint.zero, animated: true)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playGameButtonPressed(_ sender: UIButton) {
        self.tabBarController?.selectedIndex = 1
    }
    

    @IBAction func maskInfoButtonPressed(_ sender: UIButton) {
        self.tabBarController?.selectedIndex = 2
    }
    
    @IBAction func infoButtonPressed(_ sender: UIButton) {
        self.tabBarController?.selectedIndex = 3
    }
    
}

