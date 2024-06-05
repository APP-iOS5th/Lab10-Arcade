//
//  GameButton.swift
//  AscendingNumbers
//
//  Created by JIHYE SEOK on 6/5/24.
//

import UIKit

extension UIViewController {
    // 시작 버튼 설정
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
    
    // 배경 이미지 설정
    func setBackground() {
        let backgroundImage = UIImage(named: "background")
        let backgroundImageView = UIImageView(frame: self.view.bounds)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
    }
    
    // 게임 설명 설정
    func setDescription(title: String, body: String) {
        let cornerView = UIView()
        let titleLabel = UILabel()
        let bodyLabel = UILabel()
        
        cornerView.backgroundColor = .white.withAlphaComponent(0.95)
        cornerView.layer.cornerRadius = 40
        cornerView.layer.borderColor = UIColor.black.cgColor
        cornerView.layer.borderWidth = 3
        cornerView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "DNFBitBitv2", size: 24) ?? UIFont.systemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        bodyLabel.text = body
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
