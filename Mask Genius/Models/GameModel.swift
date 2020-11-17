//
//  GameModel.swift
//  Mask Genius
//
//  Created by Alison Soong on 7/10/20.
//  Copyright © 2020 Alison Soong. All rights reserved.
//

import Foundation
import UIKit

struct GameModel{
    let optionsArray = [UIImage(imageLiteralResourceName: "1"),
                       UIImage(imageLiteralResourceName: "2"),
                       UIImage(imageLiteralResourceName: "3"),
                       UIImage(imageLiteralResourceName: "4"),
                       UIImage(imageLiteralResourceName: "5"),
                       UIImage(imageLiteralResourceName: "6"),
                       UIImage(imageLiteralResourceName: "7"),
                       UIImage(imageLiteralResourceName: "8"),
                       UIImage(imageLiteralResourceName: "9"),
                       UIImage(imageLiteralResourceName: "10"),
                       UIImage(imageLiteralResourceName: "11"),
                       UIImage(imageLiteralResourceName: "12"),
                       UIImage(imageLiteralResourceName: "13"),
                       UIImage(imageLiteralResourceName: "14"),
                       UIImage(imageLiteralResourceName: "15"),
                       UIImage(imageLiteralResourceName: "16")]
    
    let riskArray = [7, 3, 3, 4, 9, 5, 5, 5, 4, 2, 2, 5, 6, 6, 7, 4]
    
    let textArray = ["Traveling by plane",
                     "Going for a walk with friends",
                     "Grocery shopping",
                     "Walking through downtown",
                     "Going to a movie theater",
                     "Shopping at a mall",
                     "Going to the beach",
                     "Eating a meal at a friend's house",
                     "Going for a hike on a crowded trail",
                     "Playing tennis",
                     "Getting restaurant takeout",
                     "Backyard barbeque with friends!",
                     "Going to school or sending your kids to school/camp/daycare",
                     "Working in an office building",
                     "Getting a haircut",
                     "Waiting inside the doctor's office"]
    
    let commentaryArray = ["Traveling by plane is a very high-risk activity. Try to avoid it unless absolutely necessary!",
    "When going for a walk with friends, remember to wear a mask! This activity is not incredibly risky, but it’s a good idea to be cautious!",
    "When grocery shopping, remember to wear a mask! This activity is not incredibly risky, but it’s a good idea to be cautious!",
    "Walking through a crowded downtown has its risks! Remember to keep a safe distance away from others.",
    "Going to a movie theater has its risks! Always wear a mask whenever in a confined space such as a movie theater.",
    "Shopping at a mall has its risks! Remember to keep a safe distance away from others.",
    "Going to the beach is not the safest activity! Even if you are outside, remember to wear a mask and keep a safe distance away from others.",
    "When having a meal at a friend's house, you should eat outside, and remember to keep a safe distance from others.",
    "When going for a hike on a crowded trail, remember to keep a safe distance from others!",
    "There is not as much risk while playing tennis compared to playing basketball, but still, it’s a good idea to be cautious!",
    "Getting restaurant takeout is not that risky! Just remember to wear a mask and keep your distance from others.",
    "When having a backyard barbeque with friends, you should eat outside, and remember to keep a safe distance from others.",
    "There is actually quite a lot of risk associated with going to school or sending your kids to school, camp, or a daycare center, but nevertheless, remember to wear a mask to protect yourself and your family!",
    "Working in an office building, especially for a whole week, is a risk to your health. Remember to keep a safe distance from others.",
    "Getting a haircut is quite risky. Nevertheless, always remember to wear a mask!",
    "Waiting inside a doctor's office is not as risky as getting a haircut! Still, remember to wear a mask and keep your distance from others."]

    
    
};
