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
        // Override the back button
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "게임시작", style: .plain, target: self, action: #selector(backButton))
        self.navigationItem.leftBarButtonItem = newBackButton
    }
    
    
    // MARK: - UI 세팅
    private func setupUI() {
        setBackground()
        let restartButton = customButton(title: "RESTART")
        
        restartButton.addAction(UIAction { [weak self] _ in
            self?.restartGame()
        }, for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            restartButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -130),
            restartButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            restartButton.widthAnchor.constraint(equalToConstant: 180),
            restartButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        if let elapsedTime = viewModel.elapsedTime {
            let timeLabel = UILabel()
            timeLabel.text = "Elapsed Time: \(elapsedTime.formatted())"
            timeLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(timeLabel)
        }
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        if self.isMovingFromParent, let navigationController = navigationController {
//            if let startViewController = navigationController.viewControllers.first(where: { $0 is AscendingNumStartViewController }) {
//                var viewControllers = navigationController.viewControllers
//                if let startVCIndex = viewControllers.firstIndex(of: startViewController) {
//                    viewControllers.removeSubrange((startVCIndex + 1)..<viewControllers.count)
//                }
//                DispatchQueue.main.async {
//                    navigationController.setViewControllers([startViewController], animated: false)
//                }
//            }
//        }
//    }
    
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
    @objc func backButton() {
        navigateToStartViewController()
    }
    
    func restartGame() {
        navigateToStartViewController()
    }
}


