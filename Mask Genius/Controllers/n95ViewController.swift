//
//  maskViewController.swift
//  Mask Genius
//
//  Created by Alison Soong on 7/5/20.
//  Copyright © 2020 Alison Soong. All rights reserved.
//

import UIKit

class n95ViewController: UIViewController {

    @IBOutlet weak var n95ScrollView: UIScrollView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // scroll reset
        n95ScrollView.setContentOffset(CGPoint.zero, animated: true)
        
        // formatting
        self.navigationController?.setNavigationBarHidden(false, animated: true)

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
