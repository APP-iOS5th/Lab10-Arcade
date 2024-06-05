//
//  ViewController.swift
//  AscendingNumbers
//
//  Created by JIHYE SEOK on 6/3/24.
//

import UIKit

class AscendingNumStartViewController: UIViewController {
//    private let viewModel = AscendingNumViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI 세팅
    private func setupUI() {
        setBackground()
        setDescription(title: "순서대로 얍얍", body: "N x N개의 숫자를\n순서대로 선택해보세요!")
        
        let startButton = customButton(title: "START")
        let buttonThree = gridSizeButton(title: "3X3", color: "3X3")
        let buttonFour = gridSizeButton(title: "4X4", color: "4X4")
        let buttonFive = gridSizeButton(title: "5X5", color: "5X5")
    
        startButton.addAction(UIAction { _ in
            print("Start!")
        }, for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -130),
            startButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 144),
            startButton.heightAnchor.constraint(equalToConstant: 60),
            buttonFour.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buttonFour.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -60),
            buttonFour.widthAnchor.constraint(equalToConstant: 70),
            buttonFour.heightAnchor.constraint(equalToConstant: 70),
            buttonThree.trailingAnchor.constraint(equalTo: buttonFour.leadingAnchor, constant: -30),
            buttonThree.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -60),
            buttonThree.widthAnchor.constraint(equalToConstant: 70),
            buttonThree.heightAnchor.constraint(equalToConstant: 70),
            buttonFive.leadingAnchor.constraint(equalTo: buttonFour.trailingAnchor, constant: 30),
            buttonFive.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -60),
            buttonFive.widthAnchor.constraint(equalToConstant: 70),
            buttonFive.heightAnchor.constraint(equalToConstant: 70),
        ])
    }
    
    // 게임 종류 버튼 설정
    func gridSizeButton(title: String, color: String) -> UIButton {
        let button = UIButton()
        var configuration = UIButton.Configuration.filled()
        let customFont = UIFont(name: "DNFBitBitv2", size: 17) ?? UIFont.systemFont(ofSize: 17)
        
        configuration.baseBackgroundColor = UIColor(named: color)
        configuration.background.strokeColor = .black
        configuration.background.strokeWidth = 3
        configuration.attributedTitle = AttributedString(title, attributes: AttributeContainer([.font: customFont, .kern: 1]))
        
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        return button
    }
 
    // MARK: - game Methods
    func selectGameSize(_ sender: UIButton) {
        
    }
}

