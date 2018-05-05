//
//  gameModeViewController.swift
//  AlphaPuzzle
//
//  Created by Brendon Binks on 5/5/18.
//  Copyright © 2018 Brendon Binks. All rights reserved.
//

import UIKit

class gameModeViewController: UIViewController {
    
    //Variables
    var whichLevel = Int() //Declared and unassigned int variable for later use
    
    //Outlets
    @IBOutlet var levelsButtons: [UIButton]!
    @IBOutlet weak var levelSelectionButton: UIButton!
    
    //enum for use in levelTapped function
    enum levels: String {
        case level1 = "Level 1"
        case level2 = "Level 2"
        case level3 = "Level 3"
        
    }
    
    //Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Unhide buttons to produce drop down menu
    @IBAction func handleSelection(_ sender: UIButton) {
        for button in levelsButtons {
            button.isHidden = false
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
    
    @IBAction func exitSegue(_ sender: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let wordView = segue.destination as! wordViewController
        wordView.whichLevel = whichLevel
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
