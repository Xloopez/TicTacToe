//
//  ViewController.swift
//  TicTacToe
//
//  Created by Nicole Lopez feliz on 2020-12-16.
//

import UIKit

class ViewController: UIViewController {
    
    var segueIdentyfier = "segueToDifficultyView"

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func startBtn(_ sender: Any) {
        performSegue(withIdentifier: segueIdentyfier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentyfier {
            let destinationVC = segue.destination as! DificultyViewController
        }
    }
    


}

