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
    
    var square = Squares()
    
    var xY = 0
    
    var yX = 0
    
    let squaresInRow = 3

    override func viewDidLoad() {
        super.viewDidLoad()
    
        gameBoardView.backgroundColor = UIColor.white
        
        for i in 1...9 {
            let squareLabel = createSquare(item: square)
            
            xY += square.squareWidth + square.squareSpace
            
            gameBoardView.addSubview(squareLabel)
            
            if xY == (square.squareWidth * squaresInRow) + (square.squareSpace * squaresInRow) {
                xY = 0
                yX += square.squareWidth + square.squareSpace
            }
            
            print(i)

        }
    }
    
    func createSquare (item: UIView) -> UILabel {
        let squareLabel = UILabel()
        
        squareLabel.frame = CGRect(x: xY, y: yX, width: square.squareWidth, height: square.squareHeight)
        //btn1.backgroundColor = .clear
        squareLabel.layer.cornerRadius = 5
        squareLabel.layer.borderWidth = 1
        squareLabel.isUserInteractionEnabled = true
        squareLabel.layer.borderColor = UIColor.lightGray.cgColor
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.viewDidTap))
        
        squareLabel.addGestureRecognizer(labelTap)
        
        return squareLabel
    }
    
    @objc func viewDidTap(sender: UITapGestureRecognizer? = nil){
        print("TAPPEDY TAP")
    }

}
