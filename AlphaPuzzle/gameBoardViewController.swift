//
//  gameBoardViewController.swift
//  AlphaPuzzle
//
//  Created by Brendon Binks on 6/5/18.
//  Copyright © 2018 Brendon Binks. All rights reserved.
//

import UIKit

class gameBoardViewController: UIViewController {
    
    //Variables
    
    var whichLevel = Int()
    var imgs : [UIImage] = //Image array used to set correct image according to player turn
        [
            UIImage(named : "P purple")!,//0
            UIImage(named : "A green")!,//1
            UIImage(named : "S blue")!,//2
            UIImage(named : "S red")!,//3
            UIImage(named: "H orange")!,//4
            UIImage(named: "O blue")!,//5
            UIImage(named: "O purple")!,//6
            UIImage(named: "L brown")!,//7
            UIImage(named: "T purple")!,//8
            UIImage(named: "U green")!,//9
            UIImage(named: "D blue")!,//10
            UIImage(named: "E coral")!,//11
            UIImage(named: "O blue")!,//12
            UIImage(named: "N yellow")!,//13
            UIImage(named: "C green")!//14
        ]
    
    var firstButtonSelected = Bool()
    var secondButtonSelected = Bool()
    
    var firstLocation = CGPoint(x: 0, y: 0)
    var secondLocation = CGPoint(x: 0, y: 0)
    
    var playButtonOne : UIButton!
    var playButtonTwo : UIButton!
    
    //Outlets
    
    @IBOutlet weak var letterOneButton: UIButton!
    @IBOutlet weak var letterTwoButton: UIButton!
    @IBOutlet weak var letterThreeButton: UIButton!
    @IBOutlet weak var letterFourButton: UIButton!
    @IBOutlet weak var letterFiveButton: UIButton!
    @IBOutlet weak var letterSixButton: UIButton!
    @IBOutlet weak var letterSevenButton: UIButton!
    
    @IBOutlet weak var blankOneButton: UIButton!
    @IBOutlet weak var blankTwoButton: UIButton!
    @IBOutlet weak var blankThreeButton: UIButton!
    @IBOutlet weak var blankFourButton: UIButton!
    @IBOutlet weak var blankFiveButton: UIButton!
    @IBOutlet weak var blankSixButton: UIButton!
    @IBOutlet weak var blankSevenButton: UIButton!
    
    @IBOutlet weak var didTheyWin: UILabel!
    @IBOutlet weak var levelTitle: UILabel!
    @IBOutlet weak var nextLevelButton: UIButton!
    
    //Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        levelTitle.text = "Level \(whichLevel)"
        
        levelSetup()
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateButtonValues(button: UIButton) -> UIButton {
        button.layer.borderWidth = 5
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.orange.cgColor
        
        return button
    }
       
    func levelSetup() {
        
        if whichLevel == 1 {
            
            let buttonArray = [letterFiveButton, letterSixButton, letterSevenButton, blankFiveButton, blankSixButton, blankSevenButton]
            
            for button in buttonArray {
                button?.isHidden = true
            }
            
            letterOneButton.setImage(imgs[2], for: .normal)
            letterTwoButton.setImage(imgs[3], for: .normal)
            letterThreeButton.setImage(imgs[0], for: .normal)
            letterFourButton.setImage(imgs[1], for: .normal)
        }
        
        if whichLevel == 2 {
            letterSevenButton.isHidden = true
            blankSevenButton.isHidden = true
            
            letterOneButton.setImage(imgs[6], for: .normal)
            letterTwoButton.setImage(imgs[7], for: .normal)
            letterThreeButton.setImage(imgs[5], for: .normal)
            letterFourButton.setImage(imgs[2], for: .normal)
            letterFiveButton.setImage(imgs[4], for: .normal)
            letterSixButton.setImage(imgs[14], for: .normal)
        }
        
        if whichLevel == 3 {
            letterOneButton.setImage(imgs[10], for: .normal)
            letterTwoButton.setImage(imgs[8], for: .normal)
            letterThreeButton.setImage(imgs[13], for: .normal)
            letterFourButton.setImage(imgs[3], for: .normal)
            letterFiveButton.setImage(imgs[11], for: .normal)
            letterSixButton.setImage(imgs[9], for: .normal)
            letterSevenButton.setImage(imgs[8], for: .normal)
        }
        
    }
    
    func checkWin() {
        didTheyWin.text = "That is correct!"
        nextLevelButton.isHidden = false
        didTheyWin.isHidden = false
    }
    
    //Event Handlers

    @IBAction func buttonIsTapped(_ sender: UIButton) {
        playButtonOne = updateButtonValues(button: sender)
    }
    
    
    @IBAction func blankIsTapped(_ sender: UIButton) {
        playButtonTwo = updateButtonValues(button: sender)
    }
    
    @IBAction func swapButtons(_ sender: UIButton) {
        playButtonOne.center = playButtonTwo.center
        playButtonTwo.isHidden = true
        playButtonOne.layer.borderWidth = 0
        playButtonOne.layer.cornerRadius = 0
        playButtonOne.layer.borderColor = nil
        playButtonTwo.layer.borderWidth = 0
        playButtonTwo.layer.cornerRadius = 0
        playButtonTwo.layer.borderColor = nil
        playButtonTwo.tag = playButtonOne.tag
        playButtonOne = nil
        playButtonTwo = nil
    }
    
    @IBAction func winCondition(_ sender: UIButton) {
        
        if whichLevel == 1 {
            
            if blankOneButton.tag == 3 && blankTwoButton.tag == 4 {
                    if blankThreeButton.tag == 1 && blankFourButton.tag == 2 || blankThreeButton.tag == 2 && blankFourButton.tag == 1 {
                            checkWin()
                        }
                }
        }
        
        if whichLevel == 2 {
            
            if blankOneButton.tag == 4 && blankTwoButton.tag == 6 && blankThreeButton.tag == 5 && blankSixButton.tag == 2 {
                if blankFourButton.tag == 1 && blankFiveButton.tag == 3 || blankFourButton.tag == 3 && blankFiveButton.tag == 1 {
                    checkWin()
                }
            }
        }
        
        if whichLevel == 3 {
            
            if blankOneButton.tag == 4 && blankThreeButton.tag == 6 && blankFourButton.tag == 1 && blankFiveButton.tag == 5 && blankSixButton.tag == 3 {
                if blankTwoButton.tag == 2 && blankSevenButton.tag == 7 || blankTwoButton.tag == 7 && blankSevenButton.tag == 2 {
                    checkWin()
                }
            }
        }
        
    }
    
    @IBAction func resetBoard(_ sender: UIButton) {
        
        letterOneButton.center = CGPoint(x: 28, y: 351)
        letterTwoButton.center = CGPoint(x: 81, y: 351)
        letterThreeButton.center = CGPoint(x: 134, y: 351)
        letterFourButton.center = CGPoint(x: 187, y: 351)
        letterFiveButton.center = CGPoint(x: 240, y: 351)
        letterSixButton.center = CGPoint(x: 294, y: 351)
        letterSevenButton.center = CGPoint(x: 348, y: 351)
        
        blankOneButton.tag = 0
        blankTwoButton.tag = 0
        blankThreeButton.tag = 0
        blankFourButton.tag = 0
        blankFiveButton.tag = 0
        blankSixButton.tag = 0
        blankSevenButton.tag = 0
        
        if whichLevel == 1 {
            blankOneButton.isHidden = false
            blankTwoButton.isHidden = false
            blankThreeButton.isHidden = false
            blankFourButton.isHidden = false
        }
        else if whichLevel == 2 {
            blankOneButton.isHidden = false
            blankTwoButton.isHidden = false
            blankThreeButton.isHidden = false
            blankFourButton.isHidden = false
            blankFiveButton.isHidden = false
            blankSixButton.isHidden = false
        }
        else if whichLevel == 3 {
            blankOneButton.isHidden = false
            blankTwoButton.isHidden = false
            blankThreeButton.isHidden = false
            blankFourButton.isHidden = false
            blankFiveButton.isHidden = false
            blankSixButton.isHidden = false
            blankSevenButton.isHidden = false
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
