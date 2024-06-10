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
    
    init(viewModel: AscendingNumViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        viewModel.startGame()
    }
    
    
    // MARK: - UI 세팅
    private func setupUI() {
        setBackground()
        let gridView = setGridView()
        gridView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(gridView)
        
        NSLayoutConstraint.activate([
            gridView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gridView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    func setGridView() -> UIView {
        let gridSize = viewModel.ascendingNumModel.gridSize
        let buttonSize = view.bounds.width / CGFloat(gridSize) - 20
        let numbers = viewModel.numbers
        print(numbers)
        
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
                button.setTitleColor(.blue, for: .normal)
                button.addAction(UIAction { [weak self] _ in
                    self?.buttonTapped(button)
                }, for: .touchUpInside)
                button.backgroundColor = .white
                button.layer.borderColor = UIColor.black.cgColor
                button.layer.borderWidth = 1.0
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
            sender.backgroundColor = .lightGray
            if number == viewModel.gridSize * viewModel.gridSize {
                viewModel.endGame()
                let restartVC = AscendingNumRestartViewController(viewModel: viewModel)
                navigationController?.pushViewController(restartVC, animated: true)
            }
        } else {
            sender.setTitleColor(.red, for: .normal)
        }
    }
    
}
