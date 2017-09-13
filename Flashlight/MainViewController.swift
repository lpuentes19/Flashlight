//
//  MainViewController.swift
//  Flashlight
//
//  Created by Luis Puentes on 9/12/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {

    var isOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Changes the status bar color from black to white depending on the background color of the view
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return isOn ? .default : .lightContent
    }
    
    // This function incorporates AVFoundation. This function specifically makes it possible for the user to turn their flashlight on, on their device
    func toggleTorch(on: Bool) {
        
        guard let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo) else { return }
        
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
                
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used.")
            }
        } else {
            print("Torch is not available.")
        }
    }
    
    @IBOutlet weak var onOffButton: UIButton!
    @IBAction func onOffButtonTapped(_ sender: Any) {
        if isOn == false {
            
            isOn = true
            toggleTorch(on: true)
            
            onOffButton.setTitle("OFF", for: .normal)
            onOffButton.setTitleColor(.black, for: .normal)
            
            view.backgroundColor = .white
            
            self.setNeedsStatusBarAppearanceUpdate()
            
        } else {
            
            isOn = false
            toggleTorch(on: false)
            
            onOffButton.setTitle("ON", for: .normal)
            onOffButton.setTitleColor(.white, for: .normal)
            
            view.backgroundColor = .black
            
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
}
