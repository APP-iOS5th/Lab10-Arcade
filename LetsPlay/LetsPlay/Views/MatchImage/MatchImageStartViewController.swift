//
//  ViewController.swift
//  MatchImage
//
//  Created by Jungjin Park on 2024-06-03.
//

import UIKit

class MatchImageStartViewController: UIViewController {
    let gameInfoContainer = MatchImageInformation().gameInfoContainer
    let gameTitle = MatchImageInformation().gameTitle
    let gameDescription = MatchImageInformation().gameDescription
    private var startButton: UIButton!
    
    lazy var difficultyOptions: UISegmentedControl = {
        let items = ["쉬움", "보통", "어려움"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .white
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        let normalTextAttributes: [NSAttributedString.Key: Any] = [
            .font: CustomFonts().neoDunggeunmoPro
        ]
        
        segmentedControl.setTitleTextAttributes(normalTextAttributes, for: .normal)
        
        let selectedTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
        segmentedControl.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        
        segmentedControl.selectedSegmentTintColor = UIColor(red: 1, green: 0.48, blue: 0.11, alpha: 1)
        
        return segmentedControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .red
        
        self.title = "짝꿍 찾기"
        setupNavigationBar(title: "짝꿍 찾기", leftButtonTitle: "게임목록", leftButtonAction: #selector(leftButtonTappedToList))
        
        gameDescription.text = "도전!\n 최단 시간에 같은 그림을 맞춰 보세요."
        
        setBackground()
        startButton = customButton(title: "START")
        
        SharedData.shared.matchImageGame.matrix = [3,2]
        // apply saved matrix to the difficulty option
        switch SharedData.shared.matchImageGame.matrix {
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
                SharedData.shared.matchImageGame.matrix = [3,2]
            case 1:
                SharedData.shared.matchImageGame.matrix = [3,4]
            case 2:
                SharedData.shared.matchImageGame.matrix = [3,6]
            default:
                break
            }
        }, for: .valueChanged)
        
        startButton.addAction(UIAction { [weak self] _ in
            guard let self = self else { return }
            let matchImageGameViewController = MatchImageGameViewController()
            navigationController?.pushViewController(matchImageGameViewController, animated: true)
        }, for: .touchUpInside)
    }
    
    private func setupLayout() {
        gameInfoContainer.addSubview(gameTitle)
        gameInfoContainer.addSubview(gameDescription)
        view.addSubview(gameInfoContainer)
        view.addSubview(difficultyOptions)
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
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
            difficultyOptions.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -70),
        ])
    }
}
