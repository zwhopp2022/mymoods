//
//  ViewController.swift
//  Mood-Tracker
//
//  Created by Zachary Hopp on 2/16/23.
//

import UIKit
import SwiftUI


class FacesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let happiestImage = UIImage(named: "Happiest.png")
        let happiestButton = UIButton(type: .custom)
        happiestButton.frame = CGRect(x: -20, y: 50, width: 250, height: 180)
        happiestButton.layer.cornerRadius = 0.5 * happiestButton.bounds.size.width
        happiestButton.clipsToBounds = true
        happiestButton.setImage(happiestImage, for: .normal)
        happiestButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        
        let angriestImage = UIImage(named: "Angriest.png")
        let angriestButton = UIButton(type: .custom)
        angriestButton.frame = CGRect(x: 165, y: 50, width: 250, height: 180)
        angriestButton.layer.cornerRadius = 0.5 * angriestButton.bounds.size.width
        angriestButton.clipsToBounds = true
        angriestButton.setImage(angriestImage, for: .normal)
        angriestButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        
        let neutralImage = UIImage(named: "neutral.png")
        let neutralButton = UIButton(type: .custom)
        neutralButton.frame = CGRect(x: -20, y: 225, width: 250, height: 180)
        neutralButton.layer.cornerRadius = 0.5 * neutralButton.bounds.size.width
        neutralButton.clipsToBounds = true
        neutralButton.setImage(neutralImage, for: .normal)
        neutralButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        
        let happyImage = UIImage(named: "Happy.png")
        let happyButton = UIButton(type: .custom)
        happyButton.frame = CGRect(x: 165, y: 225, width: 250, height: 180)
        happyButton.layer.cornerRadius = 0.5 * happyButton.bounds.size.width
        happyButton.clipsToBounds = true
        happyButton.setImage(happyImage, for: .normal)
        happyButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        
        let sadImage = UIImage(named: "Sad.png")
        let sadButton = UIButton(type: .custom)
        sadButton.frame = CGRect(x: -20, y: 400, width: 250, height: 180)
        sadButton.layer.cornerRadius = 0.5 * sadButton.bounds.size.width
        sadButton.clipsToBounds = true
        sadButton.setImage(sadImage, for: .normal)
        sadButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        
        let saddestImage = UIImage(named: "Saddest.png")
        let saddestButton = UIButton(type: .custom)
        saddestButton.frame = CGRect(x: 165, y: 400, width: 250, height: 180)
        saddestButton.layer.cornerRadius = 0.5 * saddestButton.bounds.size.width
        saddestButton.clipsToBounds = true
        saddestButton.setImage(saddestImage, for: .normal)
        saddestButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        
        view.addSubview(happiestButton)
        view.addSubview(angriestButton)
        view.addSubview(neutralButton)
        view.addSubview(happyButton)
        view.addSubview(sadButton)
        view.addSubview(saddestButton)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func pressed(){
        print("pressed")
    }
    
    


}
