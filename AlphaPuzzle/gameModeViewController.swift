//
//  gameModeViewController.swift
//  AlphaPuzzle
//
//  Created by Brendon Binks on 5/5/18.
//  Copyright © 2018 Brendon Binks. All rights reserved.
//

import UIKit
import AVFoundation

class gameModeViewController: UIViewController {
    
    //Variables
    var whichLevel = Int() //Declared and unassigned int variable for later use
    var currentLevel = 1 //Current level when first playing the game
    var audioPlayer = AVAudioPlayer() //Audio player variable created for use in AVFoundation API functions (Audio)
    
    let defaults = UserDefaults.standard //UserDefaults variable for save game functionality
    let savedCurrentlevel = "savedCurrentLevel" //Key for use in UserDefaults
    
    //Outlets
    @IBOutlet var levelsButtons: [UIButton]!
    @IBOutlet weak var levelSelectionButton: UIButton!
    @IBOutlet weak var welcomeMessage: UILabel!
    
    //enum for use in levelTapped function
    enum levels: String {
        case level1 = "Level 1"
        case level2 = "Level 2"
        case level3 = "Level 3"
        
    }
    
    //Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* USED TO RESET USER DEFAULTS IN TESTING
         if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }*/
        
        gameProgress()
        loadSave()
        
        //Set audio player to play background music and begin playing on view load
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "background", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }
        catch {
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Unhide buttons to produce drop down menu. If the button tag is equal to or less than currentLevel variable, display in drop down menu. Used to ensure user can only proceed to unlocked levels.
    @IBAction func handleSelection(_ sender: UIButton) {
        for button in levelsButtons {
            if button.tag <= currentLevel {
                button.isHidden = false
            }
        }
    }
    
    //Custom function to change welcome message text to current level. If stored user default has a value, display this otherwise display the current level in the current game
    func gameProgress() {
        if let savedCurrentLevel = defaults.value(forKey: "savedCurrentLevel") {
            welcomeMessage.text = "Game progress: Level \(savedCurrentLevel)!"
        }
            
        else {
            welcomeMessage.text = "Game progress: Level \(currentLevel)!"
        }
        loadSave()
    }
    
    //Custom function to load save game. Declare and set temp variable using value stored in UserDefaults. If temp is does not contain a nil value and is greater than the currentLevel variable, store the value of temp in currentLevel
    func loadSave() {
        let temp = defaults.value(forKey: "savedCurrentLevel") as? Int;()
        if temp != nil && currentLevel < temp! {
            currentLevel = temp!
        }
    }
    
    
    //Event Handlers
    
    //Handles event for user clicking on button in drop down menu. Takes enum list uses it in case statement which changes button at top of the list with button clicked on and hides the buttons again
    @IBAction func levelTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let level = levels(rawValue: title) else {
            return
        }
        
        switch level {
        case .level1:
            whichLevel = 1
            levelSelectionButton.setTitle("Level 1", for: .normal)
        case .level2:
            whichLevel = 2
            levelSelectionButton.setTitle("Level 2", for: .normal)
        case .level3:
            whichLevel = 3
            levelSelectionButton.setTitle("Level 3", for: .normal)
        }
        
        for button in levelsButtons {
            button.isHidden = true
        }
        
    }
    
    //Exit segue which takes whichLevel variable from wordViewController and stores the value in UserDefaults and currentLevel variable. Execute gameProgress function
    @IBAction func exitSegue(_ sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? wordViewController {
            currentLevel = sourceViewController.whichLevel
            defaults.set(currentLevel, forKey: "savedCurrentLevel")
            gameProgress()
        }
    }

    //On segue, pass whichLevel value to wordViewController and pass audioPlayer to optionsViewController.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "wordViewSegue" {
            let wordView = segue.destination as! wordViewController
            wordView.whichLevel = whichLevel
        }
        if segue.identifier == "optionsSegue" {
            let options = segue.destination as! optionsViewController
            options.audioPlayer = audioPlayer
        }
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
