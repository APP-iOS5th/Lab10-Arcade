//
//  ViewController.swift
//  LetsPlay
//
//  Created by JIHYE SEOK on 6/11/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    
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
        
        // characters
        let tunaImage = UIImage(named: "RPS/image-tuna")
        let tunaImageView = UIImageView(image: tunaImage)
        tunaImageView.contentMode = .scaleAspectFill
        tunaImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let manduImage = UIImage(named: "RPS/image-mandu")
        let manduImageView = UIImageView(image: manduImage)
        manduImageView.contentMode = .scaleAspectFill
        manduImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(tunaImageView)
        self.view.addSubview(manduImageView)
        
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -150),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tunaImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30),
            tunaImageView.trailingAnchor.constraint(equalTo: manduImageView.leadingAnchor, constant: -10),
            tunaImageView.widthAnchor.constraint(equalToConstant: 55),
            tunaImageView.heightAnchor.constraint(equalToConstant: 63),
            manduImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30),
            manduImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            manduImageView.widthAnchor.constraint(equalToConstant: 50),
            manduImageView.heightAnchor.constraint(equalToConstant: 45),
            
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
        
        cell.backgroundColor = .clear
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedGame = Games.allCases[indexPath.row]
        let viewController = selectedGame.viewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

