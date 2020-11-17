//
//  GameViewController.swift
//  Mask Genius
//
//  Created by Alison Soong on 6/30/20.
//  Copyright © 2020 Alison Soong. All rights reserved.
//

import UIKit

class MasksViewController: UIViewController {
    
    @IBOutlet weak var masksScrollView: UIScrollView!
    var maskTitle: String = ""
    @IBOutlet weak var compareButton: UIButton!
    @IBOutlet weak var n95Button: UIButton!
    @IBOutlet weak var surgicalButton: UIButton!
    @IBOutlet weak var cottonButton: UIButton!
    @IBOutlet weak var otherButton: UIButton!
    
    let defaults = UserDefaults.standard
    let maskKey = "MaskCheck"
    var notVisited = false
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // scroll reset
        masksScrollView.setContentOffset(CGPoint.zero, animated: true)
        
        // formatting
        compareButton.layer.cornerRadius = compareButton.frame.size.height / 5
        n95Button.layer.borderWidth = 3;
        n95Button.layer.cornerRadius = compareButton.frame.size.height / 5
        n95Button.layer.borderColor = UIColor.init(named: "BrandGreen")?.cgColor
        surgicalButton.layer.borderWidth = 3;
        surgicalButton.layer.cornerRadius = compareButton.frame.size.height / 5
        surgicalButton.layer.borderColor = UIColor.init(named: "BrandGreen")?.cgColor
        cottonButton.layer.borderWidth = 3;
        cottonButton.layer.cornerRadius = compareButton.frame.size.height / 5
        cottonButton.layer.borderColor = UIColor.init(named: "BrandGreen")?.cgColor
        otherButton.layer.borderWidth = 3;
        otherButton.layer.cornerRadius = compareButton.frame.size.height / 5
        otherButton.layer.borderColor = UIColor.init(named: "BrandGreen")?.cgColor
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        // keeps track if screen has been visited (home screen checklist)
        notVisited = self.defaults.bool(forKey: maskKey)
        if (notVisited){
            notVisited = false
            self.defaults.set(self.notVisited, forKey: maskKey)
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
