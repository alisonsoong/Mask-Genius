//
//  researchViewController.swift
//  Mask GeniusresearchViewController
//
//  Created by Alison Soong on 7/4/20.
//  Copyright © 2020 Alison Soong. All rights reserved.
//

import UIKit

class researchViewController: UIViewController {

    @IBOutlet weak var researchScrollView: UIScrollView!
    @IBOutlet weak var researchPaperButton: UIButton!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // scroll reset
        researchScrollView.setContentOffset(CGPoint.zero, animated: true)
        
        // formatting
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        researchPaperButton.layer.cornerRadius = researchPaperButton.frame.size.height / 5
        
        self.navigationController?.navigationBar.barTintColor = UIColor.init(named: "BrandWhite")
       
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
    @IBAction func researchButtonPressed(_ sender: UIButton) {
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
