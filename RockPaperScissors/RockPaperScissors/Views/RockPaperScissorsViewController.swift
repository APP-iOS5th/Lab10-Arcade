import UIKit

#Preview { RockPaperScissorsViewController() }

class RockPaperScissorsViewController: UIViewController {
	let backgroundImage = UIImageView()
	let startButton = UIButton()
	let optionWindow = UIView()
	let descriptionWindow = UIView()
	
}

// MARK: - LifeCycle
extension RockPaperScissorsViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		
		setupNavigationBar()
		setupBackgroundImage()
		setupStartButton()
		setupOptionWindow()
		setupDescriptionWindow()
	}
}

// MARK: - setup01_gameSetting
extension RockPaperScissorsViewController {
	func setupNavigationBar() {
		self.title = "RockPaperScissors"
		let appearence = UINavigationBarAppearance()
		appearence.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		appearence.backgroundColor = .systemBrown
		self.navigationController?.navigationBar.scrollEdgeAppearance = appearence
	}
	
	func setupBackgroundImage() {
		backgroundImage.image = UIImage(
			named: "background_multiplier_2.5")
		backgroundImage.contentMode = .scaleAspectFit
		backgroundImage.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(backgroundImage)
		view.sendSubviewToBack(backgroundImage)
		
		NSLayoutConstraint.activate([
			backgroundImage.widthAnchor.constraint(
				equalTo: view.widthAnchor),
			backgroundImage.heightAnchor.constraint(
				equalTo: backgroundImage.widthAnchor,
				multiplier: 2.5),
			backgroundImage.bottomAnchor.constraint(
				equalTo: view.bottomAnchor),
		])
	}
	
	func setupStartButton() {
		let config = configGameStyledButton("START")
		startButton.configuration = config
		startButton.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(startButton)
		
		NSLayoutConstraint.activate([
			startButton.centerXAnchor.constraint(
				equalTo: view.centerXAnchor),
			startButton.bottomAnchor.constraint(
				equalTo: view.bottomAnchor,
				constant: -100),
		])
	}
	
	func setupOptionWindow() {
		optionWindow.backgroundColor = .white
		optionWindow.layer.borderWidth = 2
		optionWindow.layer.borderColor = UIColor.black.cgColor
		optionWindow.layer.cornerRadius = 10
		optionWindow.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(optionWindow)
		
		NSLayoutConstraint.activate([
			optionWindow.leadingAnchor.constraint(
				equalTo: view.leadingAnchor,
				constant: 20),
			optionWindow.trailingAnchor.constraint(
				equalTo: view.trailingAnchor,
				constant: -20),
			optionWindow.heightAnchor.constraint(
				equalToConstant: 100),
			optionWindow.bottomAnchor.constraint(
				equalTo: startButton.topAnchor,
				constant: -50),
		])
	}
	
	func setupDescriptionWindow() {
		descriptionWindow.backgroundColor = .white
		descriptionWindow.layer.borderWidth = 2
		descriptionWindow.layer.borderColor = UIColor.black.cgColor
		descriptionWindow.layer.cornerRadius = 10
		descriptionWindow.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(descriptionWindow)
		
		print(view.bounds.height)
		
		NSLayoutConstraint.activate([
			descriptionWindow.leadingAnchor.constraint(
				equalTo: view.leadingAnchor,
				constant: 20),
			descriptionWindow.trailingAnchor.constraint(
				equalTo: view.trailingAnchor,
				constant: -20),
			descriptionWindow.heightAnchor.constraint(
				equalToConstant: 200),
			descriptionWindow.bottomAnchor.constraint(
				equalTo: optionWindow.topAnchor,
				constant: -50),
		])
		
		
	}
}

// MARK: - setup02_gameReady
extension RockPaperScissorsViewController {
	
}



// MARK: - Configuration Style
extension RockPaperScissorsViewController {
	func configGameStyledButton(_ title:String) -> UIButton.Configuration {
		var config = UIButton.Configuration.filled()
		config.title = title
		config.baseForegroundColor = .white
		config.baseBackgroundColor = .systemOrange
		config.background.strokeWidth = 2
		config.background.strokeColor = .black
		config.cornerStyle = .large
		config.contentInsets = NSDirectionalEdgeInsets(
			top: 10, leading: 20,
			bottom: 10, trailing: 20)
		config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer {
			var attribute = $0
			attribute.font = UIFont(
				name: "DNFBitBitv2", size: 25)
			return attribute
		}
		
		return config
	}
}
