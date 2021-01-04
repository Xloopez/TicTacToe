//
//  ViewController.swift
//  TicTacToe
//
//  Created by Nicole Lopez feliz on 2020-12-16.
//

import UIKit

class ViewController: UIViewController {
    
    //var segueIdentyfier = "segueToDifficultyView"
    
    let segueIdentyfier = "segueToPlayerView"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("VAD HÄNDER")
        
    }
    
    @IBAction func startBtn(_ sender: Any) {
        performSegue(withIdentifier: segueIdentyfier, sender: self)
        //print("VAD HÄNDER")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentyfier {
            let destinationVC = segue.destination as! PlayerViewController
            
        }
    }
    

}

