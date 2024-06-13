//
//  AscendingNumGameViewController.swift
//  AscendingNumbers
//
//  Created by JIHYE SEOK on 6/4/24.
//

import UIKit

class AscendingNumGameViewController: UIViewController {
    var viewModel: AscendingNumViewModel
    private var buttons: [UIButton] = []
    private var selectedButton: UIButton?
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "DNFBitBitv2", size: 30) ?? UIFont.systemFont(ofSize: 30)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    init(viewModel: AscendingNumViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateTimeLabel), name: .timeUpdated, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        viewModel.startGame()
        setupNavigationBar(title: "순서대로 얍얍", leftButtonTitle: "게임목록", leftButtonAction: #selector(leftButtonTappedToList))
    }
    
    
    // MARK: - UI 세팅
    private func setupUI() {
        setBackground()
        let gridView = setGridView()
        gridView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(gridView)
        view.addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            gridView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gridView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -35),
            timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: gridView.topAnchor, constant: -30),
        ])
        
    }
    
    func setGridView() -> UIView {
        let gridSize = viewModel.ascendingNumModel.gridSize
        let buttonSize = view.bounds.width / CGFloat(gridSize) - 20
        let numbers = viewModel.numbers
        let gridView = UIView()
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = 10
        
        for row in 0..<gridSize {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.spacing = 10
            
            for col in 0..<gridSize {
                let button = UIButton()
                button.setTitle("\(numbers[row * gridSize + col])", for: .normal)
                button.titleLabel?.font = UIFont(name: "DNFBitBitv2", size: 24) ?? UIFont.systemFont(ofSize: 24)
                button.layer.cornerRadius = 20
                button.setTitleColor(.blue, for: .normal)
                button.addAction(UIAction { [weak self] _ in
                    self?.buttonTapped(button)
                }, for: .touchUpInside)
                button.backgroundColor = .white
                button.layer.borderColor = UIColor.black.cgColor
                button.layer.borderWidth = 3.0
                rowStackView.addArrangedSubview(button)
                
                button.translatesAutoresizingMaskIntoConstraints = false
                button.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
                button.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
                
                buttons.append(button)
            }
            stackView.addArrangedSubview(rowStackView)
        }
        gridView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: gridView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: gridView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: gridView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: gridView.bottomAnchor)
        ])
        
        return gridView
    }
    
    // MARK: - Methods
    
    private func buttonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let number = Int(title) else { return }
        if viewModel.checkNumber(number) {
            sender.backgroundColor = .lightGray.withAlphaComponent(0.95)
            if number == viewModel.gridSize * viewModel.gridSize {
                viewModel.endGame()
                let restartVC = AscendingNumRestartViewController(viewModel: viewModel)
                navigationController?.pushViewController(restartVC, animated: true)
            }
        } else {
            shakeAnimation(for: sender)
        }
    }
    
    private func shakeAnimation(for button: UIButton) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.values = [-10, 10, -8, 8, -6, 6, -4, 4, -2, 2, 0]
        animation.duration = 0.5
        button.layer.add(animation, forKey: "shake")
    }
    
    @objc private func updateTimeLabel() {
        timeLabel.text = "\(viewModel.getFormattedTimeElapsed())"
    }
    
}
