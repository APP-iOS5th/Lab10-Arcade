//
//  ViewController.swift
//  LetsPlay
//
//  Created by JIHYE SEOK on 6/11/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
	let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let viewControllers = self.navigationController?.viewControllers
        {
            print("debug: \(viewControllers)")
        }
        
        self.title = "게임선택"
        view.backgroundColor = .white

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "gameCell")
        
		let backgroundImageView = UIImageView()
		backgroundImageView.image = UIImage(named: BACKGROUND_IMAGE)
		backgroundImageView.contentMode = .scaleAspectFit
		backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
		tableView.backgroundView = backgroundImageView
		
        // characters
        let tunaImage = UIImage(named: "RPS/image-tuna")
        let tunaImageView = UIImageView(image: tunaImage)
        tunaImageView.contentMode = .scaleAspectFill
        tunaImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let manduImage = UIImage(named: "RPS/image-mandu")
        let manduImageView = UIImageView(image: manduImage)
        manduImageView.contentMode = .scaleAspectFill
        manduImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
			
			backgroundImageView.widthAnchor.constraint(
				equalTo: view.widthAnchor),
			backgroundImageView.heightAnchor.constraint(
				equalTo: backgroundImageView.widthAnchor,
				multiplier: 2.5),
			backgroundImageView.centerXAnchor.constraint(
				equalTo: view.centerXAnchor),
			backgroundImageView.bottomAnchor.constraint(
				equalTo: view.bottomAnchor),
        ])
        self.navigationItem.hidesBackButton = true
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Games.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath)
        let game = Games.allCases[indexPath.row]
        cell.textLabel?.text = game.rawValue
		cell.textLabel?.font = UIFont(name: FONT_DNF, size: 16)
		cell.layer.borderColor = UIColor.black.cgColor
		cell.layer.borderWidth = 1.2
		cell.backgroundColor = UIColor(named: "color-background-green")
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedGame = Games.allCases[indexPath.row]
        let viewController = selectedGame.viewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

