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
    var whichLevel = Int() //Declared int type variable for receiving data passed in segue
    var wordAudio = AVAudioPlayer() //Declared AVAudioPlayer type variable for later use
    
    //Outlets
    @IBOutlet weak var wordToSpell: UILabel!
    @IBOutlet weak var wordTitle: UILabel!
    @IBOutlet weak var okButton: UIButton!
    
    
    //Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        levelInformation()
        selectAudio()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Custom function which uses whichLevel variable to identify which level is required and display information associated with that level. If no level selected, hide the OK button and prompt player to go back and select level
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
    
    //Custom function that works much like levelInformation function. Read whichLevel variable and determine which sound clip to play
    func selectAudio() {
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
    }
    
    //Only perform if segue is for the Game Board. Implemented if statement due to issues with unwinding
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameBoardSegue" {
            let gameBoardView = segue.destination as! gameBoardViewController
            gameBoardView.whichLevel = whichLevel
        }
    }
    
    //Event Handlers
    
    //Button to play pronunciation of word. Uses selectAudio() function to determine which sound clip to play. Increase volume to hear over background music.
    @IBAction func playWord(_ sender: UIButton) {
        selectAudio()
        wordAudio.volume = 125
        wordAudio.play()
    }
    
    //Exit segue function used to increase whichLevel variable after successfully spelling a word and use levelInformation() function to set up level again
    @IBAction func exitWordSegue(_ sender: UIStoryboardSegue) {
        whichLevel += 1
        levelInformation()
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
