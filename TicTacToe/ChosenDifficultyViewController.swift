//
//  ChosenDifficultyViewController.swift
//  TicTacToe
//
//  Created by Nicole Lopez feliz on 2020-12-17.
//

import UIKit

class ChosenDifficultyViewController: UIViewController {
    
    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var gameBoardView: UIView!
    
    @IBOutlet weak var playerNameTurnLabel: UILabel!
    
    @IBOutlet weak var playerOneLabel: UILabel!
    
    @IBOutlet weak var PlayerTwoLabel: UILabel!
    
    var square = Squares()
    
    var counter = 0
    
    var xY = 0
    
    var yX = 0
    
    let squaresInRow = 3
    
    let gameSettings = GameSettings()
    
    var listOfPlayers: [Player] = []
    
    //let squareLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        addSquaresToGameBoard()
        displayPlayerName()
        
        
    }
    
    func displayPlayerName(){
        playerOneLabel.text = String(listOfPlayers[0].name ?? "NONE")
        PlayerTwoLabel.text = String(listOfPlayers[1].name ?? "NONE")
        
        playerNameTurnLabel.text = listOfPlayers[0].name
    }
    
    func addSquaresToGameBoard(){
        for i in 1...9 {
            let addedSquareLabel = createSquare(item: square)
            
            addedSquareLabel.tag = i
            
            xY += square.squareWidth + square.squareSpace
            
            gameBoardView.addSubview(addedSquareLabel)
            
            if xY == (square.squareWidth * squaresInRow) + (square.squareSpace * squaresInRow) {
                xY = 0
                yX += square.squareWidth + square.squareSpace
                
            }
            //print(i)
        }

    }
    
    //This function creates the design of the squares inside of our Game Board View in storyboard
    func createSquare (item: UIView) -> UILabel {
        let squareLabel = UILabel()
        
        //Setting board view squares size, colors and other attributes
        squareLabel.frame = CGRect(x: xY, y: yX, width: square.squareWidth, height: square.squareHeight)
        
        squareLabel.text = ""
        squareLabel.textAlignment = .center
        squareLabel.layer.cornerRadius = 5
        squareLabel.layer.borderWidth = 1
        
        //isUserInteractionEnabled is set to true so that you can tap
        squareLabel.isUserInteractionEnabled = true
        squareLabel.layer.borderColor = UIColor.lightGray.cgColor
        
        //To add tap recognizers on our squares in Game Board View 
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.handleGesture))
        squareLabel.addGestureRecognizer(labelTap)
        
        return squareLabel
    }
    
    @objc func handleGesture(sender: UITapGestureRecognizer? = nil){
        
        if sender?.state == .ended {
            print("TAPPEDY TAP")
            
            guard let viewTag = sender?.view?.tag else {return}
            
            let targetLabel = sender?.view?.viewWithTag(viewTag) as? UILabel
            
            //targetLabel?.text = "X"
            
            targetLabel?.isUserInteractionEnabled = false 
            
            //sender.self.squareLabel.text = ""
            
            switch counter {
            case 0:
                targetLabel?.text = "X"
                
                playerNameTurnLabel.text = listOfPlayers[1].name
                
                counter += 1
            
            case 1:
                targetLabel?.text = "O"
                
                playerNameTurnLabel.text = listOfPlayers[0].name
                
                counter = 0
             
            default:
                print("Vi kom hit")
                return
            }
            
            
        }
    }

}
