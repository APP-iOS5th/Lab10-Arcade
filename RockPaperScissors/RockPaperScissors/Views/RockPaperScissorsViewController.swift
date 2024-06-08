import UIKit

#Preview { RockPaperScissorsViewController() }

class RockPaperScissorsViewController: UIViewController {
	typealias rpsViewModel = RockPaperScissorsViewModel
	
	typealias Player = RPSGamePlayerCase
	typealias RPS = RPSGameRockPaperScissorsCase
	typealias Result = RPSGameResultCase
	
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
	
	var youRpsImageViewArray: [UIImageView] = []
}

// MARK: - LifeCycle
extension RockPaperScissorsViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		
		rpsViewModel.shared.initPlayerState()
		
		setupViewGroup0()
		setupViewGroup1()
		setupViewGroup2()
		setupViewGroup3()
		
		youRpsImageViewArray.append(youRockImage)
		youRpsImageViewArray.append(youPaperImage)
		youRpsImageViewArray.append(youScissorsImage)
		
		setupBindings()
		rpsViewModel.shared.initPlayerState()
		print("RockPaperScissorsViewController - viewDidLoad")
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		rpsViewModel.shared.initPlayerState()
		print("viewWillDisappear")
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

extension RockPaperScissorsViewController {
	@objc func playerSelect(_ sender: UISegmentedControl) {
		let index = sender.selectedSegmentIndex
		rpsViewModel.shared.selectedPlayer(index)
	}
	
	@objc func rpsTap(_ sender: UITapGestureRecognizer) {
		let selectView = sender.view as? UIImageView
		let tag = selectView?.tag
		
		switch tag {
			case RPS.rock.rawValue: rpsViewModel.shared
					.youRPS.select = RPS.rock
			case RPS.paper.rawValue: rpsViewModel.shared
					.youRPS.select = RPS.paper
			case RPS.scissors.rawValue: rpsViewModel.shared
					.youRPS.select = RPS.scissors
			default: break
		}
	}
}


// MARK: RPS Select Animation
extension RockPaperScissorsViewController {
	
}

// MARK: Binding
extension RockPaperScissorsViewController {
	func setupBindings() {
		
		rpsViewModel.shared.charactersImageDidChange = {
			[weak self] youImageName, comImageName in
			self?.youCharacterImage
				.image = UIImage(named: youImageName)
			self?.comCharacterImage
				.image = UIImage(named: comImageName)
		}
		
		rpsViewModel.shared.youSelectRPSImageDidChange = {
			[weak self] imageName in
			print(imageName)
			self?.youSelectedRPSImage
				.image = UIImage(named: imageName)
		}
		
		rpsViewModel.shared.comSelectRPSImageDidChange = {
			[weak self] imageName in
			print(imageName)
			self?.comSelectedRPSImage
				.image = UIImage(named: imageName)
		}
		
		rpsViewModel.shared.oldSelectRPSImageAnimation = {
			[weak self] oldTag in
			print(oldTag)
			var selectView = self?.youRpsImageViewArray
				.first(where: { $0.tag == oldTag })
			UIView.animate(withDuration: 0.5, animations: {
				self?.locationBottom(selectView)
			})
		}
		
		rpsViewModel.shared.youSelectRPSImageAnimation = {
			[weak self] newTag in
			print(newTag)
			var selectView = self?.youRpsImageViewArray
				.first(where: { $0.tag == newTag })
			UIView.animate(withDuration: 0.5, animations: {
				self?.locationTop(selectView)
			})
		}

	}
}
