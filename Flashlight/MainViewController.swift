//
//  MainViewController.swift
//  Flashlight
//
//  Created by Luis Puentes on 9/12/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var isOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return isOn ? .default : .lightContent
    }
    
    @IBOutlet weak var onOffButton: UIButton!
    @IBAction func onOffButtonTapped(_ sender: Any) {
        if isOn == false {
            
            isOn = true
            
            onOffButton.setTitle("OFF", for: .normal)
            onOffButton.setTitleColor(.black, for: .normal)
            
            view.backgroundColor = .white
            
            self.setNeedsStatusBarAppearanceUpdate()
            
        } else {
            
            isOn = false
            
            onOffButton.setTitle("ON", for: .normal)
            onOffButton.setTitleColor(.white, for: .normal)
            
            view.backgroundColor = .black
            
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
}
