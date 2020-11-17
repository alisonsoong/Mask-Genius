//
//  AnimationsViewController.swift
//  Mask Genius
//
//  Created by Alison Soong on 7/19/20.
//  Copyright © 20,
//

import UIKit

class AnimationsViewController: UIViewController {

    @IBOutlet weak var animationScrollView: UIScrollView!
    @IBOutlet weak var n95Button: UIButton!
    @IBOutlet weak var surgicalButton: UIButton!
    @IBOutlet weak var cottonButton: UIButton!
    @IBOutlet weak var aerosolButton: UIButton!
    @IBOutlet weak var dropletsButton: UIButton!
    @IBOutlet weak var GifViewAerosol: UIImageView!
    @IBOutlet weak var GifViewDroplets: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var backImage2: UIImageView!
    @IBOutlet weak var gifAerosol2View: UIImageView!
    @IBOutlet weak var gifDroplets2View: UIImageView!
    @IBOutlet weak var maskDropletsView: UIImageView!
    @IBOutlet weak var maskAerosolView: UIImageView!
    
    var n95Press = true
    var surgicalPress = false
    var cottonPress = false
    var aerosolPress = false
    var dropletsPress = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // scroll reset
        animationScrollView.setContentOffset(CGPoint.zero, animated: true)
        
        // formatting
        GifViewAerosol.loadGif(name: "aerosolGif")
        GifViewDroplets.loadGif(name: "dropletsGif")
        gifAerosol2View.loadGif(name: "aerosol2Gif")
        gifDroplets2View.loadGif(name: "droplets2Gif")
        maskDropletsView.loadGif(name: "droplets")
        n95Button.layer.borderWidth = 3;
        n95Button.layer.cornerRadius = n95Button.frame.size.height / 5
        n95Button.layer.borderColor = UIColor.init(named: "BrandGreen")?.cgColor
        n95Button.layer.backgroundColor = UIColor.init(named: "BrandYellow")?.cgColor
        
        
        surgicalButton.layer.borderWidth = 3;
        surgicalButton.layer.cornerRadius = n95Button.frame.size.height / 5
        surgicalButton.layer.borderColor = UIColor.init(named: "BrandGreen")?.cgColor
        cottonButton.layer.borderWidth = 3;
        cottonButton.layer.cornerRadius = cottonButton.frame.size.height / 5
        cottonButton.layer.borderColor = UIColor.init(named: "BrandGreen")?.cgColor
        aerosolButton.layer.borderWidth = 3;
        aerosolButton.layer.cornerRadius = aerosolButton.frame.size.height / 5
        aerosolButton.layer.borderColor = UIColor.init(named: "BrandGreen")?.cgColor
        dropletsButton.layer.borderWidth = 3;
        dropletsButton.layer.cornerRadius = dropletsButton.frame.size.height / 5
        dropletsButton.layer.borderColor = UIColor.init(named: "BrandGreen")?.cgColor
        
        setBack()
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        self.navigationController?.navigationBar.barTintColor = UIColor.init(named: "BrandWhite")
        
             let backImage = UIImage(systemName: "chevron.left.2")
         self.navigationController?.navigationBar.backIndicatorImage = backImage
         self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
         self.navigationController?.navigationBar.backItem?.title = ""
         
         self.navigationController?.navigationBar.tintColor = UIColor.init(named: "BrandGray")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.popToRootViewController(animated: false)
    }
    
    @IBAction func n95Pressed(_ sender: UIButton) {
        if (!n95Press){
            n95Press = true
            n95Button.layer.backgroundColor = UIColor.init(named: "BrandYellow")?.cgColor
            surgicalPress = false
            surgicalButton.layer.backgroundColor = UIColor.white.cgColor
            cottonPress = false
            cottonButton.layer.backgroundColor = UIColor.white.cgColor
        }
        setBack()
    }
    @IBAction func surgicalPressed(_ sender: UIButton) {
        if (!surgicalPress){
            surgicalPress = true
            surgicalButton.layer.backgroundColor = UIColor.init(named: "BrandYellow")?.cgColor
            cottonPress = false
            cottonButton.layer.backgroundColor = UIColor.white.cgColor
            n95Press = false
            n95Button.layer.backgroundColor = UIColor.white.cgColor
        }
        setBack()
    }
    @IBAction func cottonPressed(_ sender: UIButton) {
        if (!cottonPress){
            cottonPress = true
            cottonButton.layer.backgroundColor = UIColor.init(named: "BrandYellow")?.cgColor
            surgicalPress = false
            surgicalButton.layer.backgroundColor = UIColor.white.cgColor
            n95Press = false
            n95Button.layer.backgroundColor = UIColor.white.cgColor
        }
        setBack()
    }
    @IBAction func aerosolPressed(_ sender: UIButton) {
        if (!aerosolPress){
            aerosolPress = true
            aerosolButton.layer.backgroundColor = UIColor.init(named: "BrandYellow")?.cgColor
        } else {
            aerosolPress = false
            aerosolButton.layer.backgroundColor = UIColor.white.cgColor
        }
        setBack()
    }
    @IBAction func dropletsPressed(_ sender: Any) {
        if (!dropletsPress){
            dropletsPress = true
            dropletsButton.layer.backgroundColor = UIColor.init(named: "BrandYellow")?.cgColor
        } else {
            dropletsPress = false
            dropletsButton.layer.backgroundColor = UIColor.white.cgColor
        }
        setBack()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setBack(){
        if (n95Press){
            backgroundImage.image = UIImage(named: "n95Back")
            backImage2.image = UIImage(named: "n95Back2")
            
            if (aerosolPress){
                maskAerosolView.isHidden = false
                maskAerosolView.loadGif(name: "n95aerosol")
            } else {
                maskAerosolView.isHidden = true
            }
            
        } else if (surgicalPress) {
             backgroundImage.image = UIImage(named: "surgicalBack")
            backImage2.image = UIImage(named: "surgicalBack2")
            
            if (aerosolPress){
                maskAerosolView.isHidden = false
                maskAerosolView.loadGif(name: "surgicalaerosol")
            } else {
                maskAerosolView.isHidden = true
            }
        } else {
             backgroundImage.image = UIImage(named: "cottonBack")
            backImage2.image = UIImage(named: "cottonBack2")
            
            if (aerosolPress){
                maskAerosolView.isHidden = false
                maskAerosolView.loadGif(name: "cottonaerosol")
            } else {
                maskAerosolView.isHidden = true
            }
        }
        if (aerosolPress){
            GifViewAerosol.isHidden = false
            gifAerosol2View.isHidden = false
            maskDropletsView.isHidden = false
        } else {
            GifViewAerosol.isHidden = true
            gifAerosol2View.isHidden = true
            maskDropletsView.isHidden = true
        }
        if (dropletsPress) {
            GifViewDroplets.isHidden = false
            gifDroplets2View.isHidden = false
            maskDropletsView.isHidden = false
        } else {
            GifViewDroplets.isHidden = true
            gifDroplets2View.isHidden = true
            maskDropletsView.isHidden = true
        }
        
        
    }

}
