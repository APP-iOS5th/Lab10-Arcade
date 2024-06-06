import UIKit

#Preview { RockPaperScissorsViewController() }

class RockPaperScissorsViewController: UIViewController {
	typealias PlayerCase = RPSGamePlayerCase
	typealias RPSCase = RPSGameRockPaperScissorsCase
	typealias ResultCase = RPSGameResultCase
	typealias rpsVM = RockPaperScissorsViewModel
	
	// setup00
	let backgroundImage = UIImageView()
	
	// setup01 - gameSetting
	let startButton = UIButton()
	let optionWindow = UIView()
	let optionWindowSegmentedControl = UISegmentedControl()
	let optionWindowImage0 = UIImageView()
	let optionWindowImage1 = UIImageView()
	let descriptionWindow = UIView()
	let descriptionWindowTitle = UITextView()
	let descriptionWindowContent = UITextView()
	
	// setup02 - gameStart
	let playButton = UIButton()
	let gameBoardWindow = UIView()
	let comCharacterImage = UIImageView()
	let comRockImage = UIImageView()
	let comPaperImage = UIImageView()
	let comScissorsImage = UIImageView()
	let youCharacterImage = UIImageView()
	let youRockImage = UIImageView()
	let youPaperImage = UIImageView()
	let youScissorsImage = UIImageView()
	let youArrow = UILabel()
	
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
		
		// setup0 GameBackground
		setupNavigationBar()
		setupBackgroundImage()
		
		// setup1 GameSetting
		setupStartButton()
		setupOptionWindow()
		setupOptionWindowSegmentedControl()
		setupOptionWindowImages()
		setupDescriptionWindow()
		setupDescriptionWindowTitle()
		setupDescriptionWindowContent()
		
		// setup2 GameReady
		setupPlayButton()
		setupGameBoardWindow()
		setupComImages()
		setupYouImages()
	}
}

// MARK: - setup00 GameBackground
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
			backgroundImage.centerXAnchor.constraint(
				equalTo: view.centerXAnchor),
			backgroundImage.bottomAnchor.constraint(
				equalTo: view.bottomAnchor),
		])
	}
}

// MARK: - Setup01 GameSetting
extension RockPaperScissorsViewController {
	func setup01() {
		
	}
	
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
	}
	
	func setupOptionWindowSegmentedControl(){
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
	}
	
	func setupOptionWindowImages() {
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
	}
	
	func setupDescriptionWindowTitle() {
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
	}
	
	func setupDescriptionWindowContent() {
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
	
	func setupGameBoardWindow() {
		view.addSubview(gameBoardWindow)
		gameBoardWindow.backgroundColor = .white
		gameBoardWindow.layer.borderWidth = 2
		gameBoardWindow.layer.borderColor = UIColor.black.cgColor
		gameBoardWindow.layer.cornerRadius = 30
		gameBoardWindow.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			gameBoardWindow.widthAnchor.constraint(
				equalTo: view.widthAnchor, constant: -40),
			gameBoardWindow.heightAnchor.constraint(
				equalToConstant: 380),
			gameBoardWindow.centerXAnchor.constraint(
				equalTo: playButton.centerXAnchor),
			gameBoardWindow.bottomAnchor.constraint(
				equalTo: playButton.topAnchor,
				constant: -((view.bounds.height - 450) / 5)),
		])
	}

	func setupComImages() {
		view.addSubview(comCharacterImage)
		comCharacterImage.image = UIImage(
			named: rpsVM.shared.com.playerImageName())
		comCharacterImage.contentMode = .scaleAspectFit
		comCharacterImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			comCharacterImage.heightAnchor.constraint(
				equalToConstant: 50),
			comCharacterImage.topAnchor.constraint(
				equalTo: gameBoardWindow.topAnchor, 
				constant: 20),
			comCharacterImage.centerXAnchor.constraint(
				equalTo: playButton.centerXAnchor),
		])
		
		view.addSubview(comRockImage)
		comRockImage.image = UIImage(
			named: IMAGE_RPS_DOWN_ROCK)
		comRockImage.contentMode = .scaleAspectFit
		comRockImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			comRockImage.heightAnchor.constraint(
				equalToConstant: 50),
			comRockImage.topAnchor.constraint(
				equalTo: gameBoardWindow.topAnchor,
				constant: 90),
			comRockImage.centerXAnchor.constraint(
				equalTo: playButton.centerXAnchor,
				constant: -80),
		])
		
		view.addSubview(comPaperImage)
		comPaperImage.image = UIImage(
			named: IMAGE_RPS_DOWN_PAPER)
		comPaperImage.contentMode = .scaleAspectFit
		comPaperImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			comPaperImage.heightAnchor.constraint(
				equalToConstant: 50),
			comPaperImage.topAnchor.constraint(
				equalTo: gameBoardWindow.topAnchor,
				constant: 90),
			comPaperImage.centerXAnchor.constraint(
				equalTo: playButton.centerXAnchor,
				constant: 0),
		])
		
		view.addSubview(comScissorsImage)
		comScissorsImage.image = UIImage(
			named: IMAGE_RPS_DOWN_SCISSORS)
		comScissorsImage.contentMode = .scaleAspectFit
		comScissorsImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			comScissorsImage.heightAnchor.constraint(
				equalToConstant: 50),
			comScissorsImage.topAnchor.constraint(
				equalTo: gameBoardWindow.topAnchor,
				constant: 90),
			comScissorsImage.centerXAnchor.constraint(
				equalTo: playButton.centerXAnchor,
				constant: 80),
		])
	}
	
	func setupYouImages() {
		view.addSubview(youCharacterImage)
		youCharacterImage.image = UIImage(
			named: rpsVM.shared.you.playerImageName())
		youCharacterImage.contentMode = .scaleAspectFit
		youCharacterImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			youCharacterImage.heightAnchor.constraint(
				equalToConstant: 50),
			youCharacterImage.bottomAnchor.constraint(
				equalTo: gameBoardWindow.bottomAnchor,
				constant: -20),
			youCharacterImage.centerXAnchor.constraint(
				equalTo: playButton.centerXAnchor),
		])
		
		view.addSubview(youRockImage)
		youRockImage.image = UIImage(
			named: IMAGE_RPS_UP_ROCK)
		youRockImage.contentMode = .scaleAspectFit
		youRockImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			youRockImage.heightAnchor.constraint(
				equalToConstant: 50),
			youRockImage.bottomAnchor.constraint(
				equalTo: gameBoardWindow.bottomAnchor,
				constant: -90),
			youRockImage.centerXAnchor.constraint(
				equalTo: playButton.centerXAnchor,
				constant: -80),
		])
		
		view.addSubview(youPaperImage)
		youPaperImage.image = UIImage(
			named: IMAGE_RPS_UP_PAPER)
		youPaperImage.contentMode = .scaleAspectFit
		youPaperImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			youPaperImage.heightAnchor.constraint(
				equalToConstant: 50),
			youPaperImage.bottomAnchor.constraint(
				equalTo: gameBoardWindow.bottomAnchor,
				constant: -90),
			youPaperImage.centerXAnchor.constraint(
				equalTo: playButton.centerXAnchor,
				constant: 0),
		])
		
		view.addSubview(youScissorsImage)
		youScissorsImage.image = UIImage(
			named: IMAGE_RPS_UP_SCISSORS)
		youScissorsImage.contentMode = .scaleAspectFit
		youScissorsImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			youScissorsImage.heightAnchor.constraint(
				equalToConstant: 50),
			youScissorsImage.bottomAnchor.constraint(
				equalTo: gameBoardWindow.bottomAnchor,
				constant: -90),
			youScissorsImage.centerXAnchor.constraint(
				equalTo: playButton.centerXAnchor,
				constant: 80),
		])
		
		
		view.addSubview(youArrow)
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


// MARK: - View Location
extension RockPaperScissorsViewController {
	func locationLeft(_ target: UIView?) {
		let move = -(view.bounds.width)
		
		let t2 = CGAffineTransform(translationX: move, y: 0)
		let tConcat = target?.transform.concatenating(t2)
		target?.transform = tConcat!
	}
	
	func locationInitRight(_ target: UIView?) {
		let move = (view.bounds.width) * 2
		
		let t2 = CGAffineTransform(translationX: move, y: 0)
		let tConcat = target?.transform.concatenating(t2)
		target?.transform = tConcat!
	}
}

// MARK: - Action Selector
extension RockPaperScissorsViewController {
	@objc func playerSelect(_ sender: UISegmentedControl) {
		let index = sender.selectedSegmentIndex
		rpsVM.shared.selectedPlayer(index)
		comCharacterImage.image = UIImage(
			named: rpsVM.shared.com.playerImageName())
		youCharacterImage.image = UIImage(
			named: rpsVM.shared.you.playerImageName())
	}
	
	@objc func gameStart() {
		UIView.animate(withDuration: 0.5, animations: {
			self.setup01LocationLeft()
			self.setup02LocationLeft()
			self.setup03LocationLeft()
			self.setup04LocationLeft()
		}, completion: {_ in
			self.setup01LocationInitRight()
		})
	}
	
	@objc func gamePlay() {
		UIView.animate(withDuration: 0.5, animations: {
			self.setup01LocationLeft()
			self.setup02LocationLeft()
			self.setup03LocationLeft()
			self.setup04LocationLeft()
		}, completion: {_ in
			self.setup02LocationInitRight()
		})
	}
	
	
}

extension RockPaperScissorsViewController {
	func setup01LocationLeft() {
		self.locationLeft(self.startButton)

		self.locationLeft(self.optionWindow)
		self.locationLeft(self.optionWindowSegmentedControl)
		self.locationLeft(self.optionWindowImage0)
		self.locationLeft(self.optionWindowImage1)
		
		self.locationLeft(self.descriptionWindow)
		self.locationLeft(self.descriptionWindowTitle)
		self.locationLeft(self.descriptionWindowContent)
	}
	func setup01LocationInitRight() {
		self.locationInitRight(self.startButton)
		
		self.locationInitRight(self.optionWindow)
		self.locationInitRight(self.optionWindowSegmentedControl)
		self.locationInitRight(self.optionWindowImage0)
		self.locationInitRight(self.optionWindowImage1)
		
		self.locationInitRight(self.descriptionWindow)
		self.locationInitRight(self.descriptionWindowTitle)
		self.locationInitRight(self.descriptionWindowContent)
	}
	
	func setup02LocationLeft() {
		self.locationLeft(self.playButton)
		self.locationLeft(self.gameBoardWindow)
		
		self.locationLeft(self.comCharacterImage)
		self.locationLeft(self.comRockImage)
		self.locationLeft(self.comPaperImage)
		self.locationLeft(self.comScissorsImage)
		
		self.locationLeft(self.youCharacterImage)
		self.locationLeft(self.youRockImage)
		self.locationLeft(self.youPaperImage)
		self.locationLeft(self.youScissorsImage)
	}
	func setup02LocationInitRight() {
		self.locationInitRight(self.playButton)
		self.locationInitRight(self.gameBoardWindow)
		
		self.locationInitRight(self.comCharacterImage)
		self.locationInitRight(self.comRockImage)
		self.locationInitRight(self.comPaperImage)
		self.locationInitRight(self.comScissorsImage)
		
		self.locationInitRight(self.youCharacterImage)
		self.locationInitRight(self.youRockImage)
		self.locationInitRight(self.youPaperImage)
		self.locationInitRight(self.youScissorsImage)
	}
	
	func setup03LocationLeft() {
	}
	func setup03LocationInitRight() {
	}
	
	func setup04LocationLeft() {
	}
	func setup04LocationInitRight() {
	}
}








// ---------- //

// MARK: - View Hidden (now not use)
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
