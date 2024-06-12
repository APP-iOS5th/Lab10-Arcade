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
        setupNavigationBar(title: "순서대로 얍얍", leftButtonTitle: "게임목록", leftButtonAction: #selector(leftButtonTappedToList))
    }
    
    
    // MARK: - UI 세팅
    private func setupUI() {
        setBackground()
        let restartButton = customButton(title: "RESTART")
        
        restartButton.addAction(UIAction { [weak self] _ in
            self?.restartGame()
        }, for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            restartButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 130),
            restartButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            restartButton.widthAnchor.constraint(equalToConstant: 180),
            restartButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        if let elapsedTime = viewModel.elapsedTime {
            let timeLabel = UILabel()
            let formattedElapsedTime = String(format: "%.2f", elapsedTime)
            timeLabel.font = UIFont(name: "DNFBitBitv2", size: 80) ?? UIFont.systemFont(ofSize: 80)
            timeLabel.textColor = .white
            if let buttonColor = UIColor(named: "color-button") {
                timeLabel.addStroke(text: formattedElapsedTime, strokeColor: buttonColor, strokeWidth: 5.0)
            }
            timeLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(timeLabel)
            NSLayoutConstraint.activate([
                timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                timeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100)
            ])
        }
    }
    
    // MARK: - Methods
    private func navigateToStartViewController() {
        if let navigationController = navigationController {
            if let startViewController = navigationController.viewControllers.first(where: { $0 is AscendingNumStartViewController }) {
                DispatchQueue.main.async {
                    navigationController.setViewControllers([startViewController], animated: true)
                }
            }
        }
    }
    
    func restartGame() {
        navigateToStartViewController()
    }
}


