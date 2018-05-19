//
//  wordViewController.swift
//  AlphaPuzzle
//
//  Created by Brendon Binks on 5/5/18.
//  Copyright © 2018 Brendon Binks. All rights reserved.
//

import UIKit
import AVFoundation

class wordViewController: UIViewController {
    
    //Variables
    
    var whichLevel = Int()
    var wordAudio = AVAudioPlayer()
    
    //Outlets

    @IBOutlet weak var wordToSpell: UILabel!
    @IBOutlet weak var wordTitle: UILabel!
    @IBOutlet weak var okButton: UIButton!
    
    
    //Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        levelInformation()
        do {
            if whichLevel == 1 {
                wordAudio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Pass", ofType: "mp4")!))
            }
            else if whichLevel == 2 {
                wordAudio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "School", ofType: "mp4")!))
            }
            else if whichLevel == 3 {
                wordAudio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Student", ofType: "mp4")!))
            }
            wordAudio.prepareToPlay()
        }
        catch {
            print(error)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func levelInformation() {
        if whichLevel == 1 {
            wordToSpell.text = "Pass"
        }
        else if whichLevel == 2 {
            wordToSpell.text = "School"
        }
        else if whichLevel == 3 {
            wordToSpell.text = "Student"
        }
        else if whichLevel > 3 {
            wordTitle.text = "New levels"
            wordToSpell.text = "Coming soon!"
            okButton.isHidden = true
        }
        else {
            wordTitle.text = "No level selected"
            wordToSpell.text = "Please go back"
            okButton.isHidden = true
        }
    }
    
    //Only perform if segue is for the Game Board. Implemented if statement due to issues with unwinding
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameBoardSegue" {
            let gameBoardView = segue.destination as! gameBoardViewController
            gameBoardView.whichLevel = whichLevel
        }
    }
    
    @IBAction func playWord(_ sender: UIButton) {
        wordAudio.volume = 125
        wordAudio.play()
    }
    
    @IBAction func exitWordSegue(_ sender: UIStoryboardSegue) {
        whichLevel += 1
        levelInformation()
    }
    
    //Event Handlers
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
