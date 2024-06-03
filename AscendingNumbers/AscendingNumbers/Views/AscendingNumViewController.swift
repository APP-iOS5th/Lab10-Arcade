//
//  ViewController.swift
//  AscendingNumbers
//
//  Created by JIHYE SEOK on 6/3/24.
//

import UIKit

class AscendingNumViewController: UIViewController {
    private let viewModel = AscendingNumViewModel()
    private let startButton: UIButton = {
        let startButton = UIButton()
        startButton.frame = CGRect(x: 100, y: 300, width: 144, height: 60)
        
        var configuration = UIButton.Configuration.filled()
        
        configuration.baseBackgroundColor = UIColor(named: "buttonColor")
        configuration.background.strokeColor = .black
        configuration.background.strokeWidth = 3
        
        startButton.configuration = configuration
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        return startButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - UI 세팅
    private func setupUI() {
        setBackground()
        let startButton = customButton(title: "START")
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -110),
            startButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 144),
            startButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
    }
    
    // 배경 이미지 설정
    private func setBackground() {
        
        let backgroundImage = UIImage(named: "background")
        let backgroundImageView = UIImageView(frame: self.view.bounds)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleToFill
        
        self.view.addSubview(backgroundImageView)
        self.view.sendSubviewToBack(backgroundImageView)
    }
    
    // 버튼 설정
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
        
        return button
    }
    
    
}

