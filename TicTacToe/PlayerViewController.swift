//
//  PlayerViewController.swift
//  TicTacToe
//
//  Created by Nicole Lopez feliz on 2020-12-29.
//

import UIKit

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UITextField!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    let gameSettings = GameSettings()

    let segueIdentyfier = "segueToDifficultyView"
    
    let startGameBtnText = "START GAME"
    
    var counter = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.placeholder = "Player1 name"
        
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
        //let playerName = nameLabel.text
        
        for i in 1...2 {
            
            guard let playerName = nameLabel.text else {
                return
            }
            
            increaseCounterByOne()
            
            gameSettings.addPlayersToList(name: playerName)
            
            nameLabel.text = ""
            
            nameLabel.placeholder = "Player\(counter) name"
            
            if counter == 2 {
                nextBtn.setTitle(startGameBtnText, for: .normal)
                
                
                nextBtn.addTarget(self, action: #selector(self.handleSegue), for: .touchUpInside)
            }
        }
    }
    
    @objc func handleSegue (){
        performSegue(withIdentifier: segueIdentyfier, sender: self)
    }
    
    func increaseCounterByOne (){
        counter += 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentyfier {
            let destinationVC = segue.destination as! DificultyViewController
            
        }
    }
}
