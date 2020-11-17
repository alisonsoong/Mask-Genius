//
//  resultViewController.swift
//  Mask Genius
//
//  Created by Alison Soong on 7/12/20.
//  Copyright © 2020 Alison Soong. All rights reserved.
//

import UIKit

class resultViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    let roundKey = "Round"
    var round = 1
    let roundScoreKey = "RoundScore"
    var score = 0
    let gameScoreKey = "GameScore"
    var gameScore = 0
    let situationsKey = "Situations"
    let optionIndexKey = "OptionIndex" // 0 is n95, 1 is surgical, 2 is cotton, 3 is no mask
    
    let commentaryOnMask = ["You chose to wear an N95 mask. N95's can filter out about 85 (±15) percent of the particles in the air!", "You chose to wear a surgical mask. These masks can filter out about 76 (±22) percent of the particles in the air.", "You chose to wear a two-layered cotton mask. Cotton masks will protect you from about 82 (±19) percent of the particles in the air.", "You chose not to wear a mask, which is not a good decision! Masks can protect you from particles in the air, including droplets that could contain COVID-19. By wearing one, you can also protect your friends and family!"]
    
    let maskImage = [UIImage(imageLiteralResourceName: "n95Ef"), UIImage(imageLiteralResourceName: "surgicalEf"), UIImage(imageLiteralResourceName: "cottonEf"), UIImage(imageLiteralResourceName: "noEf")]
    
    let gameModel = GameModel()

    @IBOutlet weak var maskImageCom: UIImageView!
    @IBOutlet weak var nextRoundButton: UIButton!
    @IBOutlet weak var endGameButton: UIButton!
    @IBOutlet weak var roundTitle: UILabel!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var roundScoreLabel: UILabel!
    @IBOutlet weak var riskBar: UIProgressView!
    @IBOutlet weak var commentaryLabel: UILabel!
    @IBOutlet weak var maskCommentary: UILabel!
    
    @IBOutlet weak var resultScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // scroll reset
        resultScrollView.setContentOffset(CGPoint.zero, animated: true)
        
        // formatting
        nextRoundButton.layer.cornerRadius = nextRoundButton.frame.size.height / 5
        endGameButton.layer.cornerRadius = nextRoundButton.frame.size.height / 5
        innerView.layer.cornerRadius = borderView.frame.size.height / 6
        borderView.layer.cornerRadius = borderView.frame.size.height / 5
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        // before increment round, get commentary and set title
        round = self.defaults.integer(forKey: self.roundKey)
        roundTitle.text = "Round \(round) Results"
        if let array = self.defaults.array(forKey: self.situationsKey){
            let index = array[round-1] as! Int
            commentaryLabel.text = gameModel.commentaryArray[index]
        }
        
        // increment round
        if (round == 5){
            endGameButton.isHidden = false
            nextRoundButton.isHidden = true
        } else {
            endGameButton.isHidden = true
            nextRoundButton.isHidden = false
        }
        
        score = self.defaults.integer(forKey: self.roundScoreKey)
        roundScoreLabel.text = "\(score)"
        
        gameScore = self.defaults.integer(forKey: self.gameScoreKey) + self.defaults.integer(forKey: self.roundScoreKey)
        self.defaults.set(self.gameScore, forKey: gameScoreKey)
        
        riskBar.setProgress(Float(100 - score)/Float(100), animated: true)
        
        let indexOfCommentary = self.defaults.integer(forKey: self.optionIndexKey)
        maskCommentary.text = commentaryOnMask[indexOfCommentary]
        maskImageCom.image = maskImage[indexOfCommentary]
        
        // Do any additional setup after loading the view.
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        round = self.defaults.integer(forKey: self.roundKey) + 1
        self.defaults.set(self.round, forKey: roundKey)

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
