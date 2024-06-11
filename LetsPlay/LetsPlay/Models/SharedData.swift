//
//  SharedData.swift
//  MatchImage
//
//  Created by Jungjin Park on 2024-06-11.
//

import UIKit

class SharedData{
    static let shared = SharedData()
    var matchImageGame: MatchImageGame
    
    private init() {
        matchImageGame = MatchImageGame(matrix: [3,2], playedTime: "00:00")
    }
}
