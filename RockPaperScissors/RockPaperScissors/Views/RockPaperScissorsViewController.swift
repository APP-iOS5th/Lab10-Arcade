import UIKit

#Preview { RockPaperScissorsViewController() }

class RockPaperScissorsViewController: UIViewController {
	let backgroundImage = UIImageView()
	let startButton = UIButton()
}

// MARK: - LifeCycle
extension RockPaperScissorsViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		
		setupNavigationBar()
		setupBackgroundImage()
		setupStartButton()
	}
}

// MARK: - setup
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
}

// MARK: - Configuration
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
