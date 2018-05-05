//
//  wordViewController.swift
//  AlphaPuzzle
//
//  Created by Brendon Binks on 5/5/18.
//  Copyright © 2018 Brendon Binks. All rights reserved.
//

import UIKit

class wordViewController: UIViewController {
    
    //Variables
    
    var whichLevel = Int()
    
    //Outlets

    @IBOutlet weak var wordToSpell: UILabel!
    @IBOutlet weak var wordTitle: UILabel!
    
    //Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if whichLevel == 1 {
            wordToSpell.text = "Pass"
        }
        else if whichLevel == 2 {
            wordToSpell.text = "School"
        }
        else if whichLevel == 3 {
            wordToSpell.text = "Student"
        }
        else {
            wordTitle.text = "No level selected"
            wordToSpell.text = "Please go back"
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gameBoardView = segue.destination as! gameBoardViewController
        gameBoardView.whichLevel = whichLevel
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
