//
//  GameModel.swift
//  LetsPlay
//
//  Created by John Yun on 6/11/24.
//

import UIKit

enum Games: String, CaseIterable {
    case tumok = "튜 목"
    case matchImage = "짝꿍 찾기"
    case ascendingNum = "순서대로 얍얍"
    case rockSissorPaper = "가위바위보 대결"
    
    func viewController() -> UIViewController {
        switch self {
        case .tumok:
            return StartViewController()
        case . matchImage:
            return MatchImageStartViewController()
        case .ascendingNum:
            return AscendingNumStartViewController()
        case .rockSissorPaper:
            return RockPaperScissorsViewController()
        }
    }
}
