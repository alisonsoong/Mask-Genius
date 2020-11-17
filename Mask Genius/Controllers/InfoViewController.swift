//
//  InfoViewController.swift
//  Mask Genius
//
//  Created by Alison Soong on 7/1/20.
//  Copyright © 2020 Alison Soong. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var infoScrollView: UIScrollView!
    @IBOutlet weak var citeView: UIView!
    @IBOutlet weak var noteView: UIView!
    @IBOutlet weak var researchButton3: UIButton!
    
    let defaults = UserDefaults.standard
    let infoKey = "InfoCheck"
    var notVisited = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // scroll reset
        infoScrollView.setContentOffset(CGPoint.zero, animated: true)
        
        // formatting
        noteView.layer.cornerRadius = researchButton3.frame.size.height / 5
        noteView.layer.borderWidth = 3;
        noteView.layer.borderColor = UIColor.init(named: "BrandGreen")?.cgColor
        citeView.layer.cornerRadius = researchButton3.frame.size.height / 5
        
        researchButton3.layer.borderWidth = 3;
        researchButton3.layer.cornerRadius = researchButton3.frame.size.height / 5
        researchButton3.layer.borderColor = UIColor.init(named: "BrandWhite")?.cgColor
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // checklist
        notVisited = self.defaults.bool(forKey: infoKey)
        if (notVisited){
            notVisited = false
            self.defaults.set(self.notVisited, forKey: infoKey)
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func researchButton3Pressed(_ sender: UIButton) {
        // go to research paper (exits app)
        UIApplication.shared.open(URL(string:"https://pubs.acs.org/doi/full/10.1021/acsnano.0c03252")! as URL, options: [:], completionHandler: nil)
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
