//
//  AscendingNumRestartViewController.swift
//  AscendingNumbers
//
//  Created by JIHYE SEOK on 6/4/24.
//

import UIKit

class AscendingNumRestartViewController: UIViewController {
    var viewModel: AscendingNumViewModel
    
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
        setupNavigationBar(title: "순서대로 얍얍", leftButtonTitle: "게임목록", leftButtonAction: #selector(leftButtonTappedToList))
    }
    
    
    // MARK: - UI 세팅
    private func setupUI() {
        setBackground()
        setGameResult()
        
        let restartButton = customButton(title: "RESTART")
        restartButton.addAction(UIAction { [weak self] _ in
            self?.viewModel.resetGame()
            self?.navigateToStartViewController()
        }, for: .touchUpInside)
        
    }
    
    private func setGameResult() {
        let cornerView = UIView()
        let titleLabel = UILabel()
        let timeTextView = UITextView()
        let elapsedTime = viewModel.elapsedTime
        
        let formattedElapsedTime = String(format: "소요시간\n%.2f초", elapsedTime)
        timeTextView.translatesAutoresizingMaskIntoConstraints = false
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "NeoDunggeunmoPro-Regular", size: 20) ?? UIFont.systemFont(ofSize: 20), .paragraphStyle: paragraphStyle]
        let attributedString = NSAttributedString(
            string: formattedElapsedTime, attributes: attributes)
        timeTextView.attributedText = attributedString
        timeTextView.isEditable = false
        timeTextView.isScrollEnabled = false
        timeTextView.backgroundColor = .white.withAlphaComponent(0)
        timeTextView.textAlignment = .center
        timeTextView.translatesAutoresizingMaskIntoConstraints = false
        
        
        cornerView.backgroundColor = .white.withAlphaComponent(0.95)
        cornerView.layer.cornerRadius = 40
        cornerView.layer.borderColor = UIColor.black.cgColor
        cornerView.layer.borderWidth = 3
        cornerView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = "순서대로 얍얍"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "DNFBitBitv2", size: 24) ?? UIFont.systemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        view.addSubview(cornerView)
        cornerView.addSubview(titleLabel)
        cornerView.addSubview(timeTextView)
        
        NSLayoutConstraint.activate([
            cornerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cornerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -110),
            cornerView.widthAnchor.constraint(equalToConstant: 298),
            cornerView.heightAnchor.constraint(equalToConstant: 208),
            titleLabel.centerXAnchor.constraint(equalTo: cornerView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: cornerView.topAnchor, constant: 30),
            timeTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timeTextView.trailingAnchor.constraint(equalTo: cornerView.trailingAnchor, constant: 30),
            timeTextView.leadingAnchor.constraint(equalTo: cornerView.leadingAnchor, constant: -30),
            timeTextView.bottomAnchor.constraint(equalTo: cornerView.bottomAnchor, constant: -30)
        ])
    }
    
    // MARK: - Methods
    private func navigateToStartViewController() {
        let startViewController = AscendingNumStartViewController()
        let viewController = ViewController()
        navigationController?.setViewControllers([viewController, startViewController], animated: true)
    }
}


