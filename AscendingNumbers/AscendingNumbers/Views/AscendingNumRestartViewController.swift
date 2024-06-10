//
//  AscendingNumRestartViewController.swift
//  AscendingNumbers
//
//  Created by JIHYE SEOK on 6/4/24.
//

import UIKit

class AscendingNumRestartViewController: UIViewController {
    var viewModel: AscendingNumViewModel
    
    init(viewModel: AscendingNumViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    // MARK: - UI 세팅
    private func setupUI() {
        setBackground()
        let restartButton = customButton(title: "RESTART")
        
        restartButton.addAction(UIAction { _ in
            self.restartGame()
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
        let startVC = AscendingNumStartViewController()
            navigationController?.pushViewController(startVC, animated: true)
    }
}


