//
//  DificultyViewController.swift
//  TicTacToe
//
//  Created by Nicole Lopez feliz on 2020-12-16.
//

import UIKit

class DificultyViewController: UIViewController {
    
    let segueToChosenDifficulty = "segueToChosenDifficulty"

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func easyBtn(_ sender: Any) {
        performSegue(withIdentifier: segueToChosenDifficulty, sender: self)
        
    }
    
    @IBAction func mediumBtn(_ sender: Any) {
        performSegue(withIdentifier: segueToChosenDifficulty, sender: self)
    }
    
    
    @IBAction func hardBtn(_ sender: Any) {
        performSegue(withIdentifier: segueToChosenDifficulty, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! ChosenDifficultyViewController
    }
    
}
