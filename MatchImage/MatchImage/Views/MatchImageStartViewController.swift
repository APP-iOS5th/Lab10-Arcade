//
//  ViewController.swift
//  MatchImage
//
//  Created by Jungjin Park on 2024-06-03.
//

import UIKit

class MatchImageStartViewController: UIViewController {
    let backgroundImage = BackgroundImage().backgroundImage
    let gameInfoContainer = MatchImageInformation().gameInfoContainer
    let gameTitle = MatchImageInformation().gameTitle
    let gameDescription = MatchImageInformation().gameDescription
    let startButton = CustomButton().button
    
    var matrix = [3,2]
    lazy var difficultyOptions: UISegmentedControl = {
        let items = ["쉬움", "보통", "어려움"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .white
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        return segmentedControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        self.title = "시작 화면"
        
        gameDescription.text = "도전!\n 최단 시간에 같은 그림을 맞춰 보세요."
        
        // bring saved matrix
        if let savedMatrix = 
//            UserDefaults.value(forKey: "matrix") as? [Int] {
            UserDefaults.standard.array(forKey: "matrix") as? [Int] {
            matrix = savedMatrix
        }
        
        // apply saved matrix to the difficulty option
        switch matrix {
        case [3,2]:
            difficultyOptions.selectedSegmentIndex = 0
        case [3,4]:
            difficultyOptions.selectedSegmentIndex = 1
        case [3,6]:
            difficultyOptions.selectedSegmentIndex = 2
        default:
            difficultyOptions.selectedSegmentIndex = 0
        }
        
        setupLayout()
        
        difficultyOptions.addAction(UIAction { [weak self] _ in
            guard let self = self else { return }
            switch difficultyOptions.selectedSegmentIndex {
            case 0:
                matrix = [3,2]
            case 1:
                matrix = [3,4]
            case 2:
                matrix = [3,6]
            default:
                break
            }
            
            // save selected matrix
            UserDefaults.standard.set(matrix, forKey: "matrix")
        }, for: .valueChanged)
        
        startButton.setTitle("STRAT", for: .normal)
        startButton.addAction(UIAction { [weak self] _ in
            guard let self = self else { return }
            let matchImageGameViewController = MatchImageGameViewController()
            matchImageGameViewController.matrix = matrix
            navigationController?.pushViewController(matchImageGameViewController, animated: true)
        }, for: .touchUpInside)
    }
    
    private func setupLayout() {
        gameInfoContainer.addSubview(gameTitle)
        gameInfoContainer.addSubview(gameDescription)
        view.addSubview(backgroundImage)
        view.addSubview(gameInfoContainer)
        view.addSubview(difficultyOptions)
        view.addSubview(startButton)
        
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
            difficultyOptions.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            difficultyOptions.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -50),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            startButton.widthAnchor.constraint(equalToConstant: 150),
            startButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
