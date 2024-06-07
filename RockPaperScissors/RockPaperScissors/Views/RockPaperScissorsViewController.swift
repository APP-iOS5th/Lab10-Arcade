import UIKit

#Preview { RockPaperScissorsViewController() }

class RockPaperScissorsViewController: UIViewController {
	typealias PlayerCase = RPSGamePlayerCase
	typealias RPSCase = RPSGameRockPaperScissorsCase
	typealias ResultCase = RPSGameResultCase
	typealias rpsVM = RockPaperScissorsViewModel
	
	// viewGroup0 - gameBackground
	let backgroundImage = UIImageView()
	
	// viewGroup1 - gameSetting
	let startButton = UIButton()
	let optionWindow = UIView()
	let optionWindowSegControl = UISegmentedControl()
	let optionWindowImage0 = UIImageView()
	let optionWindowImage1 = UIImageView()
	let descriptionWindow = UIView()
	let descriptionWindowTitle = UITextView()
	let descriptionWindowContent = UITextView()
	
	// viewGroup2 - gameStart
	let selectButton = UIButton()
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
	
	// viewGroup3 - gameResult
	let restartButton = UIButton()
	let youSelectedRPSImage = UIImageView()
	let comSelectedRPSImage = UIImageView()
	let youResult = UILabel()
	let comResult = UILabel()
}

// MARK: - LifeCycle
extension RockPaperScissorsViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground

		setupViewGroup0()
		setupViewGroup1()
		setupViewGroup2()
		setupViewGroup3()
	}
}

// MARK: - setup - viewGroup0 - GameBackground
extension RockPaperScissorsViewController {
	func setupViewGroup0() {
		setupNavigationBar()
		setupBackgroundImage()
	}
	
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

// MARK: - setup - viewGroup1 - GameSetting
extension RockPaperScissorsViewController {
	func setupViewGroup1() {
		setupStartButton()
		setupOptionWindow()
		setupOptionWindowSegmentedControl()
		setupOptionWindowImages()
		setupDescriptionWindow()
		setupDescriptionWindowTitle()
		setupDescriptionWindowContent()
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
		view.addSubview(optionWindowSegControl)
		optionWindowSegControl.insertSegment(withTitle: "튜나", at: 0, animated: false)
		optionWindowSegControl.insertSegment(withTitle: "만두", at: 1, animated: false)
		optionWindowSegControl.selectedSegmentIndex = 0
		optionWindowSegControl.addTarget(self, action: #selector(playerSelect(_:)), for: .valueChanged)
		
		optionWindowSegControl.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			optionWindowSegControl.widthAnchor.constraint(equalToConstant: 280),
			optionWindowSegControl.centerXAnchor.constraint(equalTo: optionWindow.centerXAnchor),
			optionWindowSegControl.centerYAnchor.constraint(equalTo: optionWindow.centerYAnchor, constant: 20),
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

// MARK: - setup - viewGroup2 - GameReady
extension RockPaperScissorsViewController {
	func setupViewGroup2() {
		setupSelectButton()
		setupGameBoardWindow()
		setupComImages()
		setupYouImages()
	}
	
	func setupSelectButton() {
		view.addSubview(selectButton)
		let config = configGameStyledButton("SELECT")
		selectButton.configuration = config
		selectButton.addTarget(self, action: #selector(gameRpsSelect), for: .touchUpInside)
		selectButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			selectButton.centerXAnchor.constraint(
				equalTo: view.centerXAnchor,
				constant: view.bounds.width),
			selectButton.bottomAnchor.constraint(
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
				equalTo: selectButton.centerXAnchor),
			gameBoardWindow.bottomAnchor.constraint(
				equalTo: selectButton.topAnchor,
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
			comCharacterImage.widthAnchor.constraint(
				equalToConstant: 50),
			comCharacterImage.heightAnchor.constraint(
				equalToConstant: 50),
			comCharacterImage.topAnchor.constraint(
				equalTo: gameBoardWindow.topAnchor, 
				constant: 20),
			comCharacterImage.centerXAnchor.constraint(
				equalTo: selectButton.centerXAnchor),
		])
		
		view.addSubview(comRockImage)
		comRockImage.image = UIImage(
			named: IMAGE_RPS_ROCK_DOWN)
		comRockImage.contentMode = .scaleAspectFit
		comRockImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			comRockImage.widthAnchor.constraint(
				equalToConstant: 50),
			comRockImage.heightAnchor.constraint(
				equalToConstant: 50),
			comRockImage.topAnchor.constraint(
				equalTo: gameBoardWindow.topAnchor,
				constant: 90),
			comRockImage.centerXAnchor.constraint(
				equalTo: selectButton.centerXAnchor,
				constant: -80),
		])
		
		view.addSubview(comPaperImage)
		comPaperImage.image = UIImage(
			named: IMAGE_RPS_PAPER_DOWN)
		comPaperImage.contentMode = .scaleAspectFit
		comPaperImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			comPaperImage.widthAnchor.constraint(
				equalToConstant: 50),
			comPaperImage.heightAnchor.constraint(
				equalToConstant: 50),
			comPaperImage.topAnchor.constraint(
				equalTo: gameBoardWindow.topAnchor,
				constant: 90),
			comPaperImage.centerXAnchor.constraint(
				equalTo: selectButton.centerXAnchor,
				constant: 0),
		])
		
		view.addSubview(comScissorsImage)
		comScissorsImage.image = UIImage(
			named: IMAGE_RPS_SCISSORS_DOWN)
		comScissorsImage.contentMode = .scaleAspectFit
		comScissorsImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			comScissorsImage.widthAnchor.constraint(
				equalToConstant: 50),
			comScissorsImage.heightAnchor.constraint(
				equalToConstant: 50),
			comScissorsImage.topAnchor.constraint(
				equalTo: gameBoardWindow.topAnchor,
				constant: 90),
			comScissorsImage.centerXAnchor.constraint(
				equalTo: selectButton.centerXAnchor,
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
			youCharacterImage.widthAnchor.constraint(
				equalToConstant: 50),
			youCharacterImage.heightAnchor.constraint(
				equalToConstant: 50),
			youCharacterImage.bottomAnchor.constraint(
				equalTo: gameBoardWindow.bottomAnchor,
				constant: -20),
			youCharacterImage.centerXAnchor.constraint(
				equalTo: selectButton.centerXAnchor),
		])
		
		view.addSubview(youRockImage)
		youRockImage.image = UIImage(
			named: IMAGE_RPS_ROCK_UP)
		youRockImage.contentMode = .scaleAspectFit
		youRockImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			youRockImage.widthAnchor.constraint(
				equalToConstant: 50),
			youRockImage.heightAnchor.constraint(
				equalToConstant: 50),
			youRockImage.bottomAnchor.constraint(
				equalTo: gameBoardWindow.bottomAnchor,
				constant: -90),
			youRockImage.centerXAnchor.constraint(
				equalTo: selectButton.centerXAnchor,
				constant: -80),
		])
		
		view.addSubview(youPaperImage)
		youPaperImage.image = UIImage(
			named: IMAGE_RPS_PAPER_UP)
		youPaperImage.contentMode = .scaleAspectFit
		youPaperImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			youPaperImage.widthAnchor.constraint(
				equalToConstant: 50),
			youPaperImage.heightAnchor.constraint(
				equalToConstant: 50),
			youPaperImage.bottomAnchor.constraint(
				equalTo: gameBoardWindow.bottomAnchor,
				constant: -90),
			youPaperImage.centerXAnchor.constraint(
				equalTo: selectButton.centerXAnchor,
				constant: 0),
		])
		
		view.addSubview(youScissorsImage)
		youScissorsImage.image = UIImage(
			named: IMAGE_RPS_SCISSORS_UP)
		youScissorsImage.contentMode = .scaleAspectFit
		youScissorsImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			youScissorsImage.widthAnchor.constraint(
				equalToConstant: 50),
			youScissorsImage.heightAnchor.constraint(
				equalToConstant: 50),
			youScissorsImage.bottomAnchor.constraint(
				equalTo: gameBoardWindow.bottomAnchor,
				constant: -90),
			youScissorsImage.centerXAnchor.constraint(
				equalTo: selectButton.centerXAnchor,
				constant: 80),
		])
		
		
		view.addSubview(youArrow)
	}
}

// MARK: - setup - viewGroup3 - GameCount
extension RockPaperScissorsViewController {
	func setupViewGroup3() {
		setupRestartButton()
		setupYouSelectedRPS()
		setupComSelectedRPS()
		setupYouResult()
		setupComResult()
	}
	
	func setupRestartButton() {
		view.addSubview(restartButton)
		let config = configGameStyledButton("RESTART")
		restartButton.configuration = config
		restartButton.addTarget(self, action: #selector(gameRestart), for: .touchUpInside)
		restartButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			restartButton.centerXAnchor.constraint(
				equalTo: view.centerXAnchor,
				constant: view.bounds.width * 2),
			restartButton.bottomAnchor.constraint(
				equalTo: view.bottomAnchor,
				constant: -100),
		])
	}
	
	func setupYouSelectedRPS() {
		view.addSubview(youSelectedRPSImage)
		youSelectedRPSImage.image = UIImage(
			named: IMAGE_RPS_PAPER_UP)
		youSelectedRPSImage.contentMode = .scaleAspectFit
		youSelectedRPSImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			youSelectedRPSImage.widthAnchor.constraint(
				equalToConstant: 50),
			youSelectedRPSImage.heightAnchor.constraint(
				equalToConstant: 50),
			youSelectedRPSImage.bottomAnchor.constraint(
				equalTo: gameBoardWindow.bottomAnchor,
				constant: -90),
			youSelectedRPSImage.centerXAnchor.constraint(
				equalTo: selectButton.centerXAnchor,
				constant: view.bounds.width),
		])
	}
	
	func setupComSelectedRPS() {
		view.addSubview(comSelectedRPSImage)
		comSelectedRPSImage.image = UIImage(
			named: IMAGE_RPS_PAPER_DOWN)
		comSelectedRPSImage.contentMode = .scaleAspectFit
		comSelectedRPSImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			comSelectedRPSImage.widthAnchor.constraint(
				equalToConstant: 50),
			comSelectedRPSImage.heightAnchor.constraint(
				equalToConstant: 50),
			comSelectedRPSImage.topAnchor.constraint(
				equalTo: gameBoardWindow.topAnchor,
				constant: 90),
			comSelectedRPSImage.centerXAnchor.constraint(
				equalTo: selectButton.centerXAnchor,
				constant: view.bounds.width),
		])
	}
	
	func setupYouResult() {
		view.addSubview(youResult)
		youResult.text = rpsVM.shared.you.resultText()
		youResult.font = UIFont(name: FONT_DNF, size: 20)
		youResult.textColor = .systemTeal
		youResult.shadowColor = .gray
		youResult.shadowOffset = CGSize(width: 1, height: 1)
		
		youResult.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			youResult.centerXAnchor.constraint(
				equalTo: restartButton.centerXAnchor,
				constant: 100),
			youResult.centerYAnchor.constraint(
				equalTo: youCharacterImage.centerYAnchor),
		])
	}
	
	func setupComResult() {
		view.addSubview(comResult)
		comResult.text = rpsVM.shared.com.resultText()
		comResult.font = UIFont(name: FONT_DNF, size: 20)
		comResult.textColor = .systemTeal
		comResult.shadowColor = .gray
		comResult.shadowOffset = CGSize(width: 1, height: 1)
		
		comResult.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			comResult.centerXAnchor.constraint(
				equalTo: restartButton.centerXAnchor,
				constant: 100),
			comResult.centerYAnchor.constraint(
				equalTo: comCharacterImage.centerYAnchor),
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


// MARK: - func - view location
extension RockPaperScissorsViewController {
	func locationLeft(_ target: UIView?) {
		let move = -(view.bounds.width)
		
		let t2 = CGAffineTransform(translationX: move, y: 0)
		let tConcat = target?.transform.concatenating(t2)
		target?.transform = tConcat!
	}
	
	func locationRightEnd(_ target: UIView?) {
		let move = (view.bounds.width) * 3
		
		let t2 = CGAffineTransform(translationX: move, y: 0)
		let tConcat = target?.transform.concatenating(t2)
		target?.transform = tConcat!
	}
}

// MARK: - action selector
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
			self.locationLeftGroup1()
		}, completion: {_ in
			self.locationRightEndGroup1()
		})
	}
	
	@objc func gameRpsSelect() {
		UIView.animate(withDuration: 0.5, animations: {
			self.locationLeftGroup2()
		}, completion: {_ in
			self.locationRightEndGroup2()
		})
	}
	
	@objc func gameRestart() {
		UIView.animate(withDuration: 0.5, animations: {
			self.locationLeftGroup3()
		}, completion: {_ in
			self.locationRightEndGroup3()
		})
	}
}

// MARK: - SetupLocation Function
extension RockPaperScissorsViewController {
	func locationLeftGroup1() {
		// viewGroup1
		self.locationLeft(self.startButton)
		self.locationLeft(self.optionWindow)
		self.locationLeft(self.optionWindowSegControl)
		self.locationLeft(self.optionWindowImage0)
		self.locationLeft(self.optionWindowImage1)
		self.locationLeft(self.descriptionWindow)
		self.locationLeft(self.descriptionWindowTitle)
		self.locationLeft(self.descriptionWindowContent)
		
		// viewGroup2
		self.locationLeft(self.selectButton)
		self.locationLeft(self.gameBoardWindow)
		self.locationLeft(self.comCharacterImage)
		self.locationLeft(self.comRockImage)
		self.locationLeft(self.comPaperImage)
		self.locationLeft(self.comScissorsImage)
		self.locationLeft(self.youCharacterImage)
		self.locationLeft(self.youRockImage)
		self.locationLeft(self.youPaperImage)
		self.locationLeft(self.youScissorsImage)
		
		// viewGroup3
		self.locationLeft(self.restartButton)
		self.locationLeft(self.youSelectedRPSImage)
		self.locationLeft(self.comSelectedRPSImage)
		self.locationLeft(self.youResult)
		self.locationLeft(self.comResult)
	}
	func locationRightEndGroup1() {
		// viewGroup1
		self.locationRightEnd(self.startButton)
		self.locationRightEnd(self.optionWindow)
		self.locationRightEnd(self.optionWindowSegControl)
		self.locationRightEnd(self.optionWindowImage0)
		self.locationRightEnd(self.optionWindowImage1)
		self.locationRightEnd(self.descriptionWindow)
		self.locationRightEnd(self.descriptionWindowTitle)
		self.locationRightEnd(self.descriptionWindowContent)
	}
	
	func locationLeftGroup2() {
		// viewGroup1
		self.locationLeft(self.startButton)
		self.locationLeft(self.optionWindow)
		self.locationLeft(self.optionWindowSegControl)
		self.locationLeft(self.optionWindowImage0)
		self.locationLeft(self.optionWindowImage1)
		self.locationLeft(self.descriptionWindow)
		self.locationLeft(self.descriptionWindowTitle)
		self.locationLeft(self.descriptionWindowContent)
		
		// viewGroup2
		self.locationLeft(self.selectButton)
		// self.locationLeft(self.gameBoardWindow)
		// self.locationLeft(self.comCharacterImage)
		self.locationLeft(self.comRockImage)
		self.locationLeft(self.comPaperImage)
		self.locationLeft(self.comScissorsImage)
		// self.locationLeft(self.youCharacterImage)
		self.locationLeft(self.youRockImage)
		self.locationLeft(self.youPaperImage)
		self.locationLeft(self.youScissorsImage)
		
		// viewGroup3
		self.locationLeft(self.restartButton)
		self.locationLeft(self.youSelectedRPSImage)
		self.locationLeft(self.comSelectedRPSImage)
		self.locationLeft(self.youResult)
		self.locationLeft(self.comResult)
	}
	func locationRightEndGroup2() {
		// viewGroup2
		self.locationRightEnd(self.selectButton)
		// self.locationRightEnd(self.gameBoardWindow)
		// self.locationRightEnd(self.comCharacterImage)
		self.locationRightEnd(self.comRockImage)
		self.locationRightEnd(self.comPaperImage)
		self.locationRightEnd(self.comScissorsImage)
		// self.locationRightEnd(self.youCharacterImage)
		self.locationRightEnd(self.youRockImage)
		self.locationRightEnd(self.youPaperImage)
		self.locationRightEnd(self.youScissorsImage)
	}
	
	func locationLeftGroup3() {
		// viewGroup1
		self.locationLeft(self.startButton)
		self.locationLeft(self.optionWindow)
		self.locationLeft(self.optionWindowSegControl)
		self.locationLeft(self.optionWindowImage0)
		self.locationLeft(self.optionWindowImage1)
		self.locationLeft(self.descriptionWindow)
		self.locationLeft(self.descriptionWindowTitle)
		self.locationLeft(self.descriptionWindowContent)
		
		// viewGroup2
		self.locationLeft(self.selectButton)
		self.locationLeft(self.gameBoardWindow)
		self.locationLeft(self.comCharacterImage)
		self.locationLeft(self.comRockImage)
		self.locationLeft(self.comPaperImage)
		self.locationLeft(self.comScissorsImage)
		self.locationLeft(self.youCharacterImage)
		self.locationLeft(self.youRockImage)
		self.locationLeft(self.youPaperImage)
		self.locationLeft(self.youScissorsImage)
		
		// viewGroup3
		self.locationLeft(self.restartButton)
		self.locationLeft(self.youSelectedRPSImage)
		self.locationLeft(self.comSelectedRPSImage)
		self.locationLeft(self.youResult)
		self.locationLeft(self.comResult)
	}
	func locationRightEndGroup3() {
		// viewGorup2 RightEnd
		self.locationRightEnd(self.gameBoardWindow)
		self.locationRightEnd(self.comCharacterImage)
		self.locationRightEnd(self.youCharacterImage)
		
		// viewGorup2 Left
		self.locationLeft(self.gameBoardWindow)
		self.locationLeft(self.comCharacterImage)
		self.locationLeft(self.youCharacterImage)
		
		// viewGroup3
		self.locationRightEnd(self.restartButton)
		self.locationRightEnd(self.youSelectedRPSImage)
		self.locationRightEnd(self.comSelectedRPSImage)
		self.locationRightEnd(self.youResult)
		self.locationRightEnd(self.comResult)
	}
}

/* ------------------------------- */

// MARK: - View Hidden (now not use)
extension RockPaperScissorsViewController {
	func hiddenSetup01(_ value: Bool) {
		startButton.isHidden = value
		optionWindow.isHidden = value
		optionWindowSegControl.isHidden = value
		optionWindowImage0.isHidden = value
		optionWindowImage1.isHidden = value
		descriptionWindow.isHidden = value
		descriptionWindowTitle.isHidden = value
		descriptionWindowContent.isHidden = value
	}
	
	func alphaSetup02(_ value: CGFloat) {
		selectButton.alpha = value
	}
	
	func hiddenSetup02(_ value: Bool) {
		selectButton.isHidden = value
	}
}
