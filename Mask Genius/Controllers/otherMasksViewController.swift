//
//  otherMasksViewController.swift
//  Mask Genius
//
//  Created by Alison Soong on 7/5/20.
//  Copyright © 2020 Alison Soong. All rights reserved.
//

import UIKit

class otherMasksViewController: UIViewController {

    @IBOutlet weak var otherMasksScrollView: UIScrollView!
    @IBOutlet weak var citationsView: UIView!
    @IBOutlet weak var researchPaperButton: UIButton!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // scroll  reset
        otherMasksScrollView.setContentOffset(CGPoint.zero, animated: true)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        // formatting
        researchPaperButton.layer.borderWidth = 3;
        researchPaperButton.layer.cornerRadius = researchPaperButton.frame.size.height / 5
        researchPaperButton.layer.borderColor = UIColor.init(named: "BrandWhite")?.cgColor
        
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
    @IBAction func researchButtonPressed2(_ sender: UIButton) {
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
