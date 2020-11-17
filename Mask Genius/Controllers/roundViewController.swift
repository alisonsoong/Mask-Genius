//
//  roundViewController.swift
//  Mask Genius
//
//  Created by Alison Soong on 7/7/20.
//  Copyright © 2020 Alison Soong. All rights reserved.
//

import UIKit

class roundViewController: UIViewController {

    
    @IBOutlet weak var roundScrollView: UIScrollView!
    
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    
    @IBOutlet weak var situationLabel: UILabel!
    @IBOutlet weak var situationImage: UIImageView!
    
    let defaults = UserDefaults.standard
    let roundKey = "Round"
    var round = 1
    let roundScoreKey = "RoundScore"
    var score = 0
    let situationsKey = "Situations"
    let resultView = resultViewController()
    let endView = endViewController()
    var index: Int = 0
    let optionIndexKey = "OptionIndex" // 0 is n95, 1 is surgical, 2 is cotton, 3 is no mask
    
    let gameModel = GameModel()
    let optionsArray = [#imageLiteral(resourceName: "n95"),#imageLiteral(resourceName: "surgical"),#imageLiteral(resourceName: "cotton"),#imageLiteral(resourceName: "no")]
    let types = ["n95", "surgical", "cotton", "no"]
    var options = ["n95", "surgical", "cotton"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // setting round
        round = 1
        roundScrollView.setContentOffset(CGPoint.zero, animated: true)
        
        setUp()
        
        self.defaults.set(self.score, forKey: roundScoreKey)
        
        // formatting
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        self.navigationController?.navigationBar.barTintColor = UIColor.init(named: "BrandGreen")
       
        self.navigationItem.hidesBackButton = true;
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.init(named: "BrandWhite") as Any]
        
        option1Button.layer.borderWidth = 3;
        option1Button.layer.cornerRadius = option1Button.frame.size.height / 8
        option1Button.layer.borderColor = UIColor.init(named: "BrandGreen")?.cgColor
        
        option2Button.layer.borderWidth = 3;
        option2Button.layer.cornerRadius = option1Button.frame.size.height / 8
        option2Button.layer.borderColor = UIColor.init(named: "BrandGreen")?.cgColor
        
        option3Button.layer.borderWidth = 3;
        option3Button.layer.cornerRadius = option1Button.frame.size.height / 8
        option3Button.layer.borderColor = UIColor.init(named: "BrandGreen")?.cgColor
        
        
        self.navigationController?.navigationBar.tintColor = UIColor.init(named: "BrandWhite")

        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func option1Pressed(_ sender: UIButton) {
        //calculate score and set it to RoundScore user default value
        calculateScore(1)
        var index = 0
        if (options[index] == "n95"){
            index = 0
        } else if (options[index] == "surgical"){
            index = 1
        } else if (options[index] == "cotton"){
            index = 2
        } else if (options[index] == "no"){
            index = 3
        }
        self.defaults.set(index, forKey: optionIndexKey)
    }
    @IBAction func option2Pressed(_ sender: UIButton) {
        //calculate score and set it to RoundScore user default value
        calculateScore(2)
        var index = 1
        if (options[index] == "n95"){
            index = 0
        } else if (options[index] == "surgical"){
            index = 1
        } else if (options[index] == "cotton"){
            index = 2
        } else if (options[index] == "no"){
            index = 3
        }
        self.defaults.set(index, forKey: optionIndexKey)
    }
    @IBAction func option3Pressed(_ sender: UIButton) {
        //calculate score and set it to RoundScore user default value
        calculateScore(3)
        var index = 2
        if (options[index] == "n95"){
            index = 0
        } else if (options[index] == "surgical"){
            index = 1
        } else if (options[index] == "cotton"){
            index = 2
        } else if (options[index] == "no"){
            index = 3
        }
        self.defaults.set(index, forKey: optionIndexKey)
    }
    
    func calculateScore(_ option: Int) {
        var risk = 0
        let indexOfOptions = option - 1
        let mask = options[indexOfOptions]
        if let array = self.defaults.array(forKey: self.situationsKey){
            index = array[round-1] as! Int
            let p: Float = Float(gameModel.riskArray[index])/Float(10) * Float(45)
            risk = risk + Int(p)
        }
        
        var percentage = 0
        if (mask == "n95"){
            percentage = 100 - (85 + Int.random(in: -15...15))
        } else if (mask == "surgical"){
            percentage = 100 - (76 + Int.random(in: -22...22))
        } else if (mask == "cotton"){
            percentage = 100 - (82 + Int.random(in: -19...19))
        } else {
            percentage = 100
        }
        let a = Float(percentage)/Float(100) * Float(55)
        risk = risk + Int(a)
        
        let score = 100 - risk
        self.defaults.set(score, forKey: roundScoreKey)
    }
    
    
    func setUp(){
        // set options
        var arr = [0, 1, 2, 3]
        let ignore = arr[Int.random(in: 0...3)]
        arr.remove(at: ignore)
        arr.shuffle()
        option1Button.setBackgroundImage(optionsArray[arr[0]], for: .normal)
        options[0] = types[arr[0]]
        option2Button.setBackgroundImage(optionsArray[arr[1]], for: .normal)
        options[1] = types[arr[1]]
        option3Button.setBackgroundImage(optionsArray[arr[2]], for: .normal)
        options[2] = types[arr[2]]
        
        // set round
        round = self.defaults.integer(forKey: self.roundKey)
        self.navigationItem.title = "Round: " + String(round);
        
        // setting round situation
        if let array = self.defaults.array(forKey: self.situationsKey){
            index = array[round-1] as! Int
            situationLabel.text = gameModel.textArray[index]
            situationImage.image = gameModel.optionsArray[index]
        }
        
    }
    
    
    
    
    
}
