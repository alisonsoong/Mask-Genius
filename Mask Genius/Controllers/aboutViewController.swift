//
//  aboutViewController.swift
//  Mask Genius
//
//  Created by Alison Soong on 7/4/20.
//  Copyright © 2020 Alison Soong. All rights reserved.
//

import UIKit

class aboutViewController: UIViewController {

    @IBOutlet weak var aboutScrollView: UIScrollView!
    @IBOutlet weak var privacyPolicyButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // scroll reset
        aboutScrollView.setContentOffset(CGPoint.zero, animated: true)
        
        // formatting
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        self.navigationController?.navigationBar.barTintColor = UIColor.init(named: "BrandWhite")
        
        privacyPolicyButton.layer.cornerRadius = privacyPolicyButton.frame.size.height / 5
        infoButton.layer.cornerRadius = infoButton.frame.size.height / 5
       
            let backImage = UIImage(systemName: "chevron.left.2")
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        self.navigationController?.navigationBar.backItem?.title = ""
        
        self.navigationController?.navigationBar.tintColor = UIColor.init(named: "BrandGray")
        
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.popToRootViewController(animated: false)
    }
    
    @IBAction func privacyPolicyButton(_ sender: UIButton) {
        // go to privacy policy
        UIApplication.shared.open(URL(string:"https://alisonsoong.com/Privacy-Policy/")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func infoAppButton(_ sender: UIButton) {
        // go to website
        UIApplication.shared.open(URL(string:"https://alisonsoong.com/Fresh-Air/")! as URL, options: [:], completionHandler: nil)
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
