//
//  AscendingNumRestartViewController.swift
//  AscendingNumbers
//
//  Created by JIHYE SEOK on 6/4/24.
//

import UIKit

class AscendingNumRestartViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    

    // MARK: - UI 세팅
    private func setupUI() {
        setBackground()
        let restartButton = customButton(title: "RESTART")
        
        restartButton.addAction(UIAction { _ in
            //self.restartGame()
            print("Restart!")
        }, for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            restartButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -130),
            restartButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            restartButton.widthAnchor.constraint(equalToConstant: 180),
            restartButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    // MARK: - Methods
    func restartGame() {
        dismiss(animated: true)
    }
}


