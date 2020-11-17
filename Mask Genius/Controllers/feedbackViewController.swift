//
//  feedbackViewController.swift
//  Mask Genius
//
//  Created by Alison Soong on 7/4/20.
//  Copyright © 2020 Alison Soong. All rights reserved.
//

import UIKit
import MessageUI

class feedbackViewController: UIViewController {

    
    @IBOutlet weak var feedbackScrollView: UIScrollView!
    @IBOutlet weak var feedbackButton: UIButton!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // scroll reset
        feedbackScrollView.setContentOffset(CGPoint.zero, animated: true)
        
        // formatting
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        self.navigationController?.navigationBar.barTintColor = UIColor.init(named: "BrandWhite")
        
        feedbackButton.layer.cornerRadius = feedbackButton.frame.size.height / 5
       
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
    
    @IBAction func emailButtonPressed(_ sender: UIButton) {
        showMailComposer()
    }
    
    func showMailComposer() {
        // send email for feedback
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["maskgeniusapp@gmail.com"])
        composer.setSubject("Feedback on Mask Genius")
        
        present(composer, animated: true)
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

//MARK: - MFMailComposeViewControllerDelegate


extension feedbackViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error {
            controller.dismiss(animated: true)
        }
        
        controller.dismiss(animated: true)
    }
}
