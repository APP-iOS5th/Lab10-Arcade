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
        let listViewController = ViewController() // 메인 뷰 컨트롤러
        let navigationController = UINavigationController(rootViewController: listViewController)
        
        // UIWindowScene을 통해 루트 뷰 컨트롤러 변경
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }
}
