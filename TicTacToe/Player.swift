//
//  Player.swift
//  TicTacToe
//
//  Created by Nicole Lopez feliz on 2020-12-23.
//

import Foundation

class Player {
    let name: String?
    
    var points: Int?
    
    init (name: String, points: Int){
        self.name = name
        self.points = points
        //self.points = points
    }
}
