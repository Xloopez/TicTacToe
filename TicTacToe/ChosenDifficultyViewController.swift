//
//  ChosenDifficultyViewController.swift
//  TicTacToe
//
//  Created by Nicole Lopez feliz on 2020-12-17.
//

import UIKit

class ChosenDifficultyViewController: UIViewController {
    
    @IBOutlet weak var playAgainBtn: UIButton!
    
    @IBOutlet weak var gameBoardView: UIView!
    
    @IBOutlet weak var playerNameTurnLabel: UILabel!
    
    @IBOutlet weak var playerOneLabel: UILabel!
    
    @IBOutlet weak var PlayerTwoLabel: UILabel!
    
    @IBOutlet weak var playerOnePointLabel: UILabel!
    
    @IBOutlet weak var playerTwoPointLabel: UILabel!
    
    let firstViewControllerSegue = "rootViewController"
    
    let gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var listOfPlayers: [Player] = []
    
    var square = Squares()
    
    var counter = 0
    
    var xY = 0
    
    var yX = 0
    
    var chosenDifficulty = ""
    
    var winner = ""
    
    var gameStateDifficulty: (Int?, Int?)
    
    var squaresInGameBoardView = [UILabel]()
    
    let playerGameState = GameState()

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        
        playAgainBtn.isHidden = true
        
        displayPlayerName()
        
        gameStateDifficulty = playerGameState.whatDificultyToDisplay(playersDificulty: chosenDifficulty, square: square)
        
        addSquaresToGameBoard(amountOfSqares: gameStateDifficulty.0 ?? 0, squaresInRow: gameStateDifficulty.1 ?? 0)
        
    }
    
    @IBAction func quitBtn(_ sender: Any) {
        quitAlert()
        
    }
    func quitAlert (){
        //Gets the plaayer with most points
        let winnerName = quitGameWinner()
        
        var alert = UIAlertController()
        
        if winnerName.1 == 0 {
            //creates alert message
            alert = UIAlertController(
                title: "Are you sure that you",
                message: "want to quit?",
                preferredStyle: .alert
            )
            
        } else {
            //creates alert message
            alert = UIAlertController(
                title: "\(String(winnerName.0 ?? ""))",
                message: "Winns with \(winnerName.1) points",
                preferredStyle: .alert)
        }
        
        //Creates quit button for alert message
        let quitAction = UIAlertAction(title: "Quit", style: .destructive) { action in
            //Adds action to quit button - preforms swgue, takes player back to rootViewController
            self.performSegue(withIdentifier: self.firstViewControllerSegue, sender: self)
        }
        
        //Adds the quit button to alert message
        alert.addAction(quitAction)
        
        //Presents alert message
        present(alert, animated: true)
        
        self.navigationController?.popToRootViewController(animated: true)
        
        //print(winnerName.0 ?? "")
        //print(winnerName.1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ViewController
    }
    
    @IBAction func playAgainBtn(_ sender: Any) {
        winner = ""
        clearGameboard()
        playAgainBtn.isHidden = true
    }
    
    func quitGameWinner() -> (String?, Int) {
        
        if listOfPlayers[0].points > listOfPlayers[1].points {
            return (listOfPlayers[0].name, listOfPlayers[0].points)
            
        } else if listOfPlayers[1].points > listOfPlayers[0].points {
            return (listOfPlayers[1].name, listOfPlayers[1].points)
        }
        
        return ("", 0)
    }
    
    func clearGameboard() {
        //winner = ""
        
        for square in squaresInGameBoardView {
            square.text = ""
            square.isUserInteractionEnabled = true
        }
        
        playerGameState.gameState = gameState
    }
    
    func enableGameboard() {
        //print("WINNER IS: ")
        //print(winner)
        
        if winner != "" {
            for square in squaresInGameBoardView {
                square.isUserInteractionEnabled = false
            }
        }
    }

    func displayPlayerName(){
        //Displays right player and their points
        playerOneLabel.text = String(listOfPlayers[0].name ?? "NONE")
        playerOnePointLabel.text = "Points: \(String(describing: listOfPlayers[0].points))"
        
        PlayerTwoLabel.text = String(listOfPlayers[1].name ?? "NONE")
        playerTwoPointLabel.text = "Points: \(String(describing: listOfPlayers[1].points))"
        
        playerNameTurnLabel.text = listOfPlayers[0].name
        
        showWinner()
    }
    
    func addSquaresToGameBoard(amountOfSqares: Int, squaresInRow: Int){
        //Creates the amount of squares that is sent in to the func in variable amountOfSqares
        for i in 0...amountOfSqares {
            let addedSquareLabel = createSquare(item: square)
            
            //Adds tag to square
            addedSquareLabel.tag = i
            
            //Adding squares tag to array to enableUserInteraction in enableGameBoard()
            squaresInGameBoardView.append(addedSquareLabel)
            
            //Addes squares vertically
            xY += square.squareWidth + square.squareSpace
            
            gameBoardView.addSubview(addedSquareLabel)
            
            //Addes squares horizontally
            if xY == (square.squareWidth * squaresInRow) + (square.squareSpace * squaresInRow) {
                xY = 0
                yX += square.squareWidth + square.squareSpace
                
            }
            
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
        //Function that handles tap gesture in the created UILables
        
        if sender?.state == .ended {
            
            //if view tag != nil we enable user interaction so that when we press the button we can do things
            guard let viewTag = sender?.view?.tag else {return}
            
            let targetLabel = sender?.view?.viewWithTag(viewTag) as? UILabel
            
            targetLabel?.isUserInteractionEnabled = false
            
            switch counter {
            case 0:
                //When counter is 0 it displays player 1 turn
                
                targetLabel?.text = "X"
                targetLabel?.textColor = playAgainBtn.currentTitleColor

                if let labelTag = targetLabel?.tag {
                    //Saves the players chosen tag so that we can determine the winner in func checkWinner
                    //Player X lables is saved as 1 to compare to winning combos
                    playerGameState.gameState[labelTag] = 1
                }
                
                playerNameTurnLabel.text = listOfPlayers[1].name
                
                counter += 1
            
            case 1:
                targetLabel?.text = "O"
                targetLabel?.textColor = .white
                
                if let labelTag = targetLabel?.tag {
                    //Saves the players chosen tag so that we can determine the winner in func checkWinner
                    //Player O lables is saved as 2 to compare to winning combos
                    playerGameState.gameState[labelTag] = 2
                }
                
                playerNameTurnLabel.text = listOfPlayers[0].name
                
                counter = 0
             
            default:
                print("Why did we get here?")
                return
            }
            //print("KOllar vinnaren")
            
            checksForWinner()
            
        }
        
    }
    
    func checksForWinner (){
        //checks for the winner
        if chosenDifficulty == "easy" {
            winner = playerGameState.checkWinnerEasy()
            enableGameboard()
            
            print("WINNER")
            print(winner)
            
        } else if chosenDifficulty == "medium" {
            winner = playerGameState.checkWinnerMedium()
            enableGameboard()
            
        } else if chosenDifficulty == "hard" {
            winner = playerGameState.checkWinnerHard()
            enableGameboard()
        }
        
        addPointsToPlayer(winner: winner)
    }
    
    func showWinner(){
        if winner == "X" {
            playerNameTurnLabel.text = "\(String(describing: listOfPlayers[0].name ?? "NONE")) WINS"
            
            playAgainBtn.isHidden = false
            
            //winner = ""
        } else if winner == "O" {
            playerNameTurnLabel.text = "\(String(describing: listOfPlayers[1].name ?? "NONE")) WINS"
            
            playAgainBtn.isHidden = false
            
            //winner = ""
        } else if winner == "draw" {
            print("NU ÄR VI HÄR")
            
            playerNameTurnLabel.text = "It's a draw!"
            
            playAgainBtn.isHidden = false
        }
    }
    
    func addPointsToPlayer (winner: String) {
        if winner == "X" {
            listOfPlayers[0].points += 1
        
            displayPlayerName()
            
        } else if winner == "O" {
            listOfPlayers[1].points += 1
            
            displayPlayerName()
        } else if winner == "draw" {
            displayPlayerName()
        }
    }

}
