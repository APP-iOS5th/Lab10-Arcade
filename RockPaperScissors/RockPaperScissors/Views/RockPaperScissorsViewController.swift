import UIKit

#Preview { RockPaperScissorsViewController() }

class RockPaperScissorsViewController: UIViewController {
	typealias rpsVM = RockPaperScissorsViewModel
	
	// setup00
	let backgroundImage = UIImageView()
	
	// setup01 - gameStart
	let startButton = UIButton()
	let optionWindow = UIView()
	let optionWindowSegmentedControl = UISegmentedControl()
	let optionWindowImage0 = UIImageView()
	let optionWindowImage1 = UIImageView()
	let descriptionWindow = UIView()
	let descriptionWindowTitle = UITextView()
	let descriptionWindowContent = UITextView()
	
	// setup02 - gameReady
	let playButton = UIButton()
	let gameBoardWindow = UIView()
	let rockImage = UIButton()
	let paperImage = UIButton()
	let scissorsImage = UIButton()
	let arrowYour = UILabel()
	
	// setup03 - gamePlay
	let count321 = UILabel()
	
	// setup04 - gameResult
	let restartButton = UIButton()
	let yourSelectedRPS = UIImageView()
	let comSelectedRPS = UIImageView()
	let yourResult = UILabel()
	let comResult = UILabel()
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
		
		setupPlayButton()
	}
}

// // MARK: - setup00 GameSetting
extension RockPaperScissorsViewController {
	func setupNavigationBar() {
		self.title = "RockPaperScissors"
		let appearance = UINavigationBarAppearance()
		appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		appearance.backgroundColor = .systemGreen
		self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
	}
	
	func setupBackgroundImage() {
		view.addSubview(backgroundImage)
		view.sendSubviewToBack(backgroundImage)
		backgroundImage.image = UIImage(
			named: "background_multiplier_2.5")
		backgroundImage.contentMode = .scaleAspectFit
		backgroundImage.translatesAutoresizingMaskIntoConstraints = false
		
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
}


// MARK: - Setup01 GameSetting
extension RockPaperScissorsViewController {
	func setupStartButton() {
		view.addSubview(startButton)
		let config = configGameStyledButton("START")
		startButton.configuration = config
		startButton.addTarget(self, action: #selector(gameStart), for: .touchUpInside)
		startButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			startButton.centerXAnchor.constraint(
				equalTo: view.centerXAnchor),
			startButton.bottomAnchor.constraint(
				equalTo: view.bottomAnchor,
				constant: -100),
		])
	}
	
	func setupOptionWindow() {
		// MARK: optionWindow
		view.addSubview(optionWindow)
		optionWindow.backgroundColor = .white
		optionWindow.layer.borderWidth = 2
		optionWindow.layer.borderColor = UIColor.black.cgColor
		optionWindow.layer.cornerRadius = 30
		optionWindow.translatesAutoresizingMaskIntoConstraints = false
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
				constant: -((view.bounds.height - 450) / 5)),
		])
		
		// MARK: optionWindowSegmentedControl
		view.addSubview(optionWindowSegmentedControl)
		optionWindowSegmentedControl.insertSegment(withTitle: "튜나", at: 0, animated: false)
		optionWindowSegmentedControl.insertSegment(withTitle: "만두", at: 1, animated: false)
		optionWindowSegmentedControl.selectedSegmentIndex = 0
		optionWindowSegmentedControl.addTarget(self, action: #selector(playerSelect(_:)), for: .valueChanged)
		
		optionWindowSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			optionWindowSegmentedControl.widthAnchor.constraint(equalToConstant: 280),
			optionWindowSegmentedControl.centerXAnchor.constraint(equalTo: optionWindow.centerXAnchor),
			optionWindowSegmentedControl.centerYAnchor.constraint(equalTo: optionWindow.centerYAnchor, constant: 20),
		])
		
		// MARK: optionWindowImage
		view.addSubview(optionWindowImage0)
		view.addSubview(optionWindowImage1)
		optionWindowImage0.image = UIImage(named: IMAGE_TUNA)
		optionWindowImage1.image = UIImage(named: IMAGE_MANDU)
		optionWindowImage0.contentMode = .scaleAspectFit
		optionWindowImage1.contentMode = .scaleAspectFit
		optionWindowImage0.translatesAutoresizingMaskIntoConstraints = false
		optionWindowImage1.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			optionWindowImage0.heightAnchor.constraint(equalToConstant: 30),
			optionWindowImage1.heightAnchor.constraint(equalToConstant: 30),
			
			optionWindowImage0.centerXAnchor.constraint(equalTo: optionWindow.centerXAnchor, constant: -70),
			optionWindowImage0.centerYAnchor.constraint(equalTo: optionWindow.centerYAnchor, constant: -20),
			
			optionWindowImage1.centerXAnchor.constraint(equalTo: optionWindow.centerXAnchor, constant: 70),
			optionWindowImage1.centerYAnchor.constraint(equalTo: optionWindow.centerYAnchor, constant: -20),
		])
		
	}
	
	func setupDescriptionWindow() {
		// MARK: descriptionWindow
		view.addSubview(descriptionWindow)
		descriptionWindow.backgroundColor = .white
		descriptionWindow.layer.borderWidth = 2
		descriptionWindow.layer.borderColor = UIColor.black.cgColor
		descriptionWindow.layer.cornerRadius = 30
		descriptionWindow.translatesAutoresizingMaskIntoConstraints = false
		
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
				constant: -((view.bounds.height - 450) / 5)),
		])
		
		// MARK: descriptionWindowTitle
		view.addSubview(descriptionWindowTitle)
		descriptionWindowTitle.text = "가위바위보 대결"
		descriptionWindowTitle.font = UIFont(
			name: FONT_DNF, size: 30)
		descriptionWindowTitle.isScrollEnabled = false
		descriptionWindowTitle.isEditable = false
		descriptionWindowTitle.textAlignment = .center
		
		descriptionWindowTitle.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			descriptionWindowTitle.centerXAnchor.constraint(
				equalTo: view.centerXAnchor),
			descriptionWindowTitle.centerYAnchor.constraint(
				equalTo: descriptionWindow.centerYAnchor,
				constant: -30),
		])
		
		// MARK: descriptionWindowContent
		view.addSubview(descriptionWindowContent)
		descriptionWindowContent.text = "플레이어를 선택 후\n대결을 시작해보세요!"
		descriptionWindowContent.isScrollEnabled = false
		descriptionWindowContent.isEditable = false
		descriptionWindowContent.textAlignment = .center
		descriptionWindowContent.font = UIFont(
			name: FONT_NEO, size: 20)
		descriptionWindowContent.textContainer
			.lineBreakMode = .byTruncatingTail
		
		descriptionWindowContent.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			descriptionWindowContent.centerXAnchor.constraint(
				equalTo: view.centerXAnchor),
			descriptionWindowContent.centerYAnchor.constraint(
				equalTo: descriptionWindow.centerYAnchor,
				constant: 30),
		])
		
	}
}

// MARK: - Setup02 GameReady
extension RockPaperScissorsViewController {
	func setupPlayButton() {
		view.addSubview(playButton)
		let config = configGameStyledButton("PLAY")
		playButton.configuration = config
		playButton.addTarget(self, action: #selector(gamePlay), for: .touchUpInside)
		playButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			playButton.centerXAnchor.constraint(
				equalTo: view.centerXAnchor,
				constant: view.bounds.width),
			playButton.bottomAnchor.constraint(
				equalTo: view.bottomAnchor,
				constant: -100),
		])
	}
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
				name: FONT_DNF, size: 25)
			return attribute
		}
		
		return config
	}
}

// MARK: - Action Selector
extension RockPaperScissorsViewController {
	
	@objc func playerSelect(_ sender: UISegmentedControl) {
		let index = sender.selectedSegmentIndex
		rpsVM.shared.selectedPlayer(index)
	}
	
	@objc func gameStart() {
		UIView.animate(withDuration: 0.5, animations: {
			[weak self] in
			self?.locationLeft(self?.startButton)
			self?.locationLeft(self?.playButton)
		}, completion: {_ in
			self.locationInitRight(self.startButton)
		})
	}
	
	@objc func gamePlay() {
		UIView.animate(withDuration: 0.5, animations: {
			[weak self] in
			self?.locationLeft(self?.startButton)
			self?.locationLeft(self?.playButton)
		}, completion: {_ in
			self.locationInitRight(self.playButton)
		})
	}
}

// MARK: - View Hidden
extension RockPaperScissorsViewController {
	func hiddenSetup01(_ value: Bool) {
		startButton.isHidden = value
		optionWindow.isHidden = value
		optionWindowSegmentedControl.isHidden = value
		optionWindowImage0.isHidden = value
		optionWindowImage1.isHidden = value
		descriptionWindow.isHidden = value
		descriptionWindowTitle.isHidden = value
		descriptionWindowContent.isHidden = value
	}
	
	func alphaSetup02(_ value: CGFloat) {
		playButton.alpha = value
	}
	
	func hiddenSetup02(_ value: Bool) {
		playButton.isHidden = value
	}
}

// MARK: - View Location
extension RockPaperScissorsViewController {
	func locationLeft(_ target: UIView?) {
		target?.center.x -= view.bounds.width
		target?.isHidden = false
	}
	
	func locationInitRight(_ target: UIView?) {
		target?.center.x = view.bounds.width * 1.5
		target?.isHidden = true
	}
}
