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
    
    //let gameSettings = GameSettings()

    let segueIdentyfier = "segueToDifficultyView"
    
    let startGameBtnText = "START GAME"
    
    var counter = 0
    
    var listOfPlayers: [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nameLabel.placeholder = "Player 1 name"
        
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
        guard let playerName = nameLabel.text else {
            return
        }
        
        //increaseCounterByOne()
        
        //gameSettings.addPlayersToList(name: playerName)
        listOfPlayers.append(Player(name: playerName, points: 0))
        print("Player name \(playerName))")
        print("Counter \(counter))")
        
        increaseCounterByOne()
        
        nameLabel.text = ""
        
        nameLabel.placeholder = "Player 2 name"
        
        if counter == 1 {
            //print("ANTALET SPELARE: \(gameSettings.listOfPlayers.count)")
            //print("ANTALET SPELARE: \(String(describing: gameSettings.listOfPlayers[0].name))")
            //print("ANTALET SPELARE: \(String(describing: gameSettings.listOfPlayers[1].name))")
            
            nextBtn.setTitle(startGameBtnText, for: .normal)
            
            
            nextBtn.addTarget(self, action: #selector(self.handleSegue), for: .touchUpInside)
            
            /*for player in gameSettings.listOfPlayers {
                print("ALLA spelare i listan namn: \(String(player.name ?? "NONE"))")
            }*/
            
            
        }
        
        /*for player in gameSettings.listOfPlayers {
            print("ALLA spelare i listan namn: \(String(player.name ?? "NONE"))")
        }*/
        
        
        
        /*switch counter {
        case 0...1:
            guard let playerName = nameLabel.text else {
                return
            }
            gameSettings.addPlayersToList(name: playerName)
            print("Player name \(playerName))")
            print("Counter \(counter))")
            
            increaseCounterByOne()
            
            nameLabel.text = ""
            
            nameLabel.placeholder = "Player\(counter) name"
            
            if counter == 1 {
                increaseCounterByOne()
            }
        case 2:
            
            //print("ANTALET SPELARE: \(gameSettings.listOfPlayers.count)")
            //print("ANTALET SPELARE: \(String(describing: gameSettings.listOfPlayers[0].name))")
            //print("ANTALET SPELARE: \(String(describing: gameSettings.listOfPlayers[1].name))")
            
            nextBtn.setTitle(startGameBtnText, for: .normal)
            
            
            nextBtn.addTarget(self, action: #selector(self.handleSegue), for: .touchUpInside)
            
            for player in gameSettings.listOfPlayers {
                print("ALLA spelare i listan namn: \(String(player.name ?? "NONE"))")
            }
            
        default:
            return
        }*/
        
        
        
        
        //let playerName = nameLabel.text
        /*
        for _ in 0...2 {
            
            guard let playerName = nameLabel.text else {
                return
            }
            
            //increaseCounterByOne()
            
            gameSettings.addPlayersToList(name: playerName)
            print("Player name \(playerName))")
            print("Counter \(counter))")
            
            increaseCounterByOne()
            
            nameLabel.text = ""
            
            nameLabel.placeholder = "Player\(counter) name"
            
            if counter == 3 {
                //print("ANTALET SPELARE: \(gameSettings.listOfPlayers.count)")
                //print("ANTALET SPELARE: \(String(describing: gameSettings.listOfPlayers[0].name))")
                //print("ANTALET SPELARE: \(String(describing: gameSettings.listOfPlayers[1].name))")
                
                nextBtn.setTitle(startGameBtnText, for: .normal)
                
                
                nextBtn.addTarget(self, action: #selector(self.handleSegue), for: .touchUpInside)
                
                for player in gameSettings.listOfPlayers {
                    print("ALLA spelare i listan namn: \(String(player.name ?? "NONE"))")
                }
                
                counter = 0
            }
        }*/
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
            
            destinationVC.listOfPlayers = listOfPlayers
            
        }
    }
}
