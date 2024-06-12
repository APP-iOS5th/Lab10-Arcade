//
//  MainViewController.swift
//  AscendingNumbers
//
//  Created by JIHYE SEOK on 6/11/24.
//

import UIKit

class MainViewController: UIViewController {

    private var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI 세팅
    private func setupUI() {
        splashBackground()
        setButtons()
        
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -130),
            startButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 144),
            startButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    private func setButtons() {
        startButton = customButton(title: "START")
       
        startButton.addAction(UIAction { [weak self] _ in
            self?.navigateToListViewController()
        }, for: .touchUpInside)
    }
    
    // MARK: - Methods
    
    private func navigateToListViewController() {
        let listViewController = ViewController()
        self.navigationController?.pushViewController(listViewController, animated: true)
    }
}
