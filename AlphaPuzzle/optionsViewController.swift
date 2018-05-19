//
//  optionsViewController.swift
//  AlphaPuzzle
//
//  Created by Brendon Binks on 5/5/18.
//  Copyright © 2018 Brendon Binks. All rights reserved.
//

import UIKit
import AVFoundation

class optionsViewController: UIViewController {
    
    //Variables
    var audioPlayer = AVAudioPlayer()
    
    //Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Event Handlers
    
    @IBAction func volumeOnOff(_ sender: UISwitch) {
        
        if sender.isOn == false {
            audioPlayer.stop()
        }
        else {
            audioPlayer.currentTime = 0
            audioPlayer.play()
        }
    }
    
    @IBAction func volumeSlider(_ sender: UISlider) {
        audioPlayer.volume = sender.value
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
