//
//  ViewController.swift
//  MatchImage
//
//  Created by Jungjin Park on 2024-06-03.
//

import UIKit

class MatchImageStartViewController: UIViewController {
    
    private var dNFBitBitv2: UIFont {
        guard let font = UIFont(name: "DNFBitBitv2", size: 24) else { return UIFont.systemFont(ofSize: 24) }
        return font
    }
    private var neoDunggeunmoPro: UIFont {
        guard let font = UIFont(name: "NeoDunggeunmoPro-Regular", size: 17) else { return UIFont.systemFont(ofSize: 17) }
        return font
    }
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var gameInfoContainer: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = UIColor(white: 1, alpha: 0.95)
        uiView.layer.borderWidth = 3
        uiView.layer.borderColor = UIColor.black.cgColor
        uiView.layer.cornerRadius = 25
        return uiView
    }()
    
    private lazy var gameTitle: UILabel = {
        let label = UILabel()
        label.text = "같은 그림 찾기"
        label.font = dNFBitBitv2
        return label
    }()
    
    private lazy var gameDescription: UILabel = {
        let label = UILabel()
        label.text = "도전!\n 최단 시간에 그림 쌍을 맞춰 보세요."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = neoDunggeunmoPro
        return label
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("STRAT", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 1, green: 0.48, blue: 0.11, alpha: 1)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = dNFBitBitv2
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        self.title = "Start Page"
        
        gameInfoContainer.addSubview(gameTitle)
        gameInfoContainer.addSubview(gameDescription)
        view.addSubview(backgroundImage)
        view.addSubview(gameInfoContainer)
        view.addSubview(startButton)
        view.sendSubviewToBack(backgroundImage)
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        gameTitle.translatesAutoresizingMaskIntoConstraints = false
        gameDescription.translatesAutoresizingMaskIntoConstraints = false
        gameInfoContainer.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 100),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -20),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            gameInfoContainer.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 150),
            gameInfoContainer.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            gameInfoContainer.widthAnchor.constraint(equalToConstant: 298),
            gameInfoContainer.heightAnchor.constraint(equalToConstant: 208),
            gameTitle.topAnchor.constraint(equalTo: gameInfoContainer.topAnchor, constant: 30),
            gameTitle.centerXAnchor.constraint(equalTo: gameInfoContainer.centerXAnchor),
            gameDescription.topAnchor.constraint(equalTo: gameTitle.bottomAnchor, constant: 30),
            gameDescription.leadingAnchor.constraint(equalTo: gameInfoContainer.leadingAnchor, constant: 40),
            gameDescription.trailingAnchor.constraint(equalTo: gameInfoContainer.trailingAnchor, constant: -40),
            gameDescription.bottomAnchor.constraint(equalTo: gameInfoContainer.bottomAnchor, constant: -30),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            startButton.widthAnchor.constraint(equalToConstant: 150),
            startButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
