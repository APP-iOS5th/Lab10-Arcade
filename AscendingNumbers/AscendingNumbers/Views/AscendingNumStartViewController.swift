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
        setDescription()
        
        let startButton = customButton(title: "START")
        let buttonThree = gridSizeButton(title: "3X3", color: "3X3")
        let buttonFour = gridSizeButton(title: "4X4", color: "4X4")
        let buttonFive = gridSizeButton(title: "5X5", color: "5X5")
        
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
    
    // 배경 이미지 설정
    private func setBackground() {
        let backgroundImage = UIImage(named: "background")
        let backgroundImageView = UIImageView(frame: self.view.bounds)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
    }
    
    // 시작/재시작 버튼 설정
    func customButton(title: String) -> UIButton {
        let button = UIButton()
        var configuration = UIButton.Configuration.filled()
        let customFont = UIFont(name: "DNFBitBitv2", size: 24) ?? UIFont.systemFont(ofSize: 24)
        
        configuration.baseBackgroundColor = UIColor(named: "buttonColor")
        configuration.background.strokeColor = .black
        configuration.background.strokeWidth = 3
        configuration.attributedTitle = AttributedString(title, attributes: AttributeContainer([.font: customFont, .kern: 1]))
        
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        return button
    }
    
    // 시작/재시작 버튼 설정
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
    
    // 게임 설명 설정
    func setDescription() {
        let cornerView = UIView()
        let titleLabel = UILabel()
        let bodyLabel = UILabel()
        
        cornerView.backgroundColor = .white.withAlphaComponent(0.95)
        cornerView.layer.cornerRadius = 40
        cornerView.layer.borderColor = UIColor.black.cgColor
        cornerView.layer.borderWidth = 3
        cornerView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = "순서대로 얍얍"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "DNFBitBitv2", size: 24) ?? UIFont.systemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        bodyLabel.text = "N x N개의 숫자를\n순서대로 선택해보세요!"
        bodyLabel.numberOfLines = 0
        bodyLabel.textAlignment = .center
        bodyLabel.font = UIFont(name: "NeoDunggeunmoPro-Regular", size: 17) ?? UIFont.systemFont(ofSize: 17)
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(cornerView)
        cornerView.addSubview(titleLabel)
        cornerView.addSubview(bodyLabel)
        
        NSLayoutConstraint.activate([
            cornerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cornerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -110),
            cornerView.widthAnchor.constraint(equalToConstant: 298),
            cornerView.heightAnchor.constraint(equalToConstant: 208),
            titleLabel.centerXAnchor.constraint(equalTo: cornerView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: cornerView.topAnchor, constant: 50),
            bodyLabel.centerXAnchor.constraint(equalTo: cornerView.centerXAnchor),
            bodyLabel.bottomAnchor.constraint(equalTo: cornerView.bottomAnchor, constant: -50)

        ])
    }
    
}

extension UINavigationController {
    func setupBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = .white
        
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]

        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.isTranslucent = false
        navigationBar.tintColor = .black
    }
}
