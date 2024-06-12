//
//  ViewController.swift
//  AscendingNumbers
//
//  Created by JIHYE SEOK on 6/3/24.
//

import UIKit

class AscendingNumStartViewController: UIViewController {
    private var viewModel: AscendingNumViewModel?
    private var startButton: UIButton!
    private var buttonThree: UIButton!
    private var buttonFour: UIButton!
    private var buttonFive: UIButton!
    
    init() {
        viewModel = AscendingNumViewModel(gridSize: 3)
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
        setDescription(title: "순서대로 얍얍", body: "N x N개의 숫자를\n순서대로 선택해보세요!")
        setButtons()
        
        NSLayoutConstraint.activate([
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
    
    private func setButtons() {
        startButton = customButton(title: "START")
        buttonThree = gridSizeButton(title: "3X3", color: "color-3X3")
        buttonThree.tag = 3
        buttonFour = gridSizeButton(title: "4X4", color: "color-4X4")
        buttonFour.tag = 4
        buttonFive = gridSizeButton(title: "5X5", color: "color-5X5")
        buttonFive.tag = 5
        
        startButton.addAction(UIAction { [weak self] _ in
            self?.startGame()
        }, for: .touchUpInside)
        
        buttonThree.addAction(UIAction { [weak self] _ in
            guard let self = self else { return }
            self.selectGameSize(self.buttonThree)
        }, for: .touchUpInside)
        
        buttonFour.addAction(UIAction { [weak self] _ in
            guard let self = self else { return }
            self.selectGameSize(self.buttonFour)
        }, for: .touchUpInside)
        
        buttonFive.addAction(UIAction { [weak self] _ in
            guard let self = self else { return }
            self.selectGameSize(self.buttonFive)
        }, for: .touchUpInside)
    }
    
    // 게임 종류 버튼 설정
    private func gridSizeButton(title: String, color: String) -> UIButton {
        let button = UIButton()
        var configuration = UIButton.Configuration.filled()
        let customFont = UIFont(name: "DNFBitBitv2", size: 17) ?? UIFont.systemFont(ofSize: 17)
        
        configuration.baseBackgroundColor = UIColor(named: color)
        configuration.background.strokeColor = .black
        configuration.background.strokeWidth = 2
        configuration.attributedTitle = AttributedString(title, attributes: AttributeContainer([.font: customFont, .kern: 1]))
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        return button
    }
    
    // MARK: - Methods
    func selectGameSize(_ sender: UIButton) {
        switch sender.tag {
        case 3:
            viewModel = AscendingNumViewModel(gridSize: 3)
            viewModel?.ascendingNumModel.isSelected = true
            sender.configuration?.background.strokeWidth = 6
            buttonFour.configuration?.background.strokeWidth = 2
            buttonFive.configuration?.background.strokeWidth = 2
        case 4:
            viewModel = AscendingNumViewModel(gridSize: 4)
            viewModel?.ascendingNumModel.isSelected = true
            sender.configuration?.background.strokeWidth = 6
            buttonThree.configuration?.background.strokeWidth = 2
            buttonFive.configuration?.background.strokeWidth = 2
        case 5:
            viewModel = AscendingNumViewModel(gridSize: 5)
            viewModel?.ascendingNumModel.isSelected = true
            sender.configuration?.background.strokeWidth = 6
            buttonFour.configuration?.background.strokeWidth = 2
            buttonThree.configuration?.background.strokeWidth = 2
        default:
            break
        }
    }
    
    func startGame() {
        guard let viewModel = viewModel, viewModel.ascendingNumModel.isSelected else {
            print("게임을 선택해주세요")
            return
        }
        let gameViewController = AscendingNumGameViewController(viewModel: viewModel)
        navigationController?.pushViewController(gameViewController, animated: true)
    }
}

