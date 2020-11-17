//
//  GameViewController.swift
//  Mask Genius
//
//  Created by Alison Soong on 7/1/20.
//  Copyright © 2020 Alison Soong. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var gameHomeScrollView: UIScrollView!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var highScoreView: UIView!
    @IBOutlet weak var highScoreTitle: UILabel!
    
    let defaults = UserDefaults.standard
    let roundKey = "Round"
    var round = 1
    let gameScoreKey = "GameScore"
    let gameScore = 0
    let situationsKey = "Situations"
    let highScoreKey = "HighScore"
    let gameKey = "GameCheck"
    var highScore = 0
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // scroll reset
        gameHomeScrollView.setContentOffset(CGPoint.zero, animated: true)
        
        // formatting
        startGameButton.layer.cornerRadius = startGameButton.frame.size.height / 5
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        // round info
        self.defaults.set(self.round, forKey: roundKey)
        self.defaults.set(self.gameScore, forKey: gameScoreKey)
        
        // high score
        if (!self.defaults.bool(forKey: gameKey)){
            highScoreView.isHidden = false
            highScoreTitle.isHidden = false
            highScoreLabel.isHidden = false
            highScoreLabel.text = "\(self.defaults.integer(forKey: highScoreKey))"
        } else {
            highScoreView.isHidden = true
            highScoreTitle.isHidden = true
            highScoreLabel.isHidden = true
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startGamePressed(_ sender: UIButton) {
        // get three random rounds
        var arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
        var ignore = 0
        var terms = 15
        for _ in 0...10{
            ignore = Int.random(in: 0...(terms))
            arr.remove(at: ignore)
            arr.shuffle()
            terms = terms - 1;
        }
        self.defaults.set(arr, forKey: situationsKey)
        
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
