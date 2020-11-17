//
//  endViewController.swift
//  Mask Genius
//
//  Created by Alison Soong on 7/12/20.
//  Copyright © 2020 Alison Soong. All rights reserved.
//

import UIKit

class endViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    let gameKey = "GameCheck"
    var notVisited = false
    let gameScoreKey = "GameScore"
    var gameScore = 0
    let highScoreKey = "HighScore"
    var highScore = 0

    @IBOutlet weak var backScreenButton: UIButton!
    @IBOutlet weak var newLabel: UILabel!
    @IBOutlet weak var finalScoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var endGameCommentary: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notVisited = self.defaults.bool(forKey: gameKey)
        if (notVisited){
            notVisited = false
            self.defaults.set(self.notVisited, forKey: gameKey)
        }
        
        gameScore = self.defaults.integer(forKey: self.gameScoreKey)
        highScore = self.defaults.integer(forKey: self.highScoreKey)
        if (gameScore > highScore){
            self.defaults.set(self.gameScore, forKey: highScoreKey)
            highScore = self.defaults.integer(forKey: self.highScoreKey)
            newLabel.isHidden = false
        } else {
            newLabel.isHidden = true
        }
        finalScoreLabel.text = "\(gameScore)"
        highScoreLabel.text = "\(highScore)"
        
        //get message at the end:
        if (gameScore < 200){
            endGameCommentary.text = "Try again! Remember: wearing a mask can protect you from COVID-19, and keep yourself safe by not putting yourself in unnecessary risk."
        } else if (gameScore < 325) {
            endGameCommentary.text = "Remember to always wear a mask to protect yourself (as well as the people around you). Play again and try to get an even higher score!"
        } else {
            endGameCommentary.text = "You scored exceptionally well and made good decisions! Remember to wear a mask in real life, not just in this game, and stay safe!"
        }
        
        backScreenButton.layer.cornerRadius = backScreenButton.frame.size.height / 5

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func learnMasksPressed(_ sender: UIButton) {
        self.tabBarController?.selectedIndex = 2
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
