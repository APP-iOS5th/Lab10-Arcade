import UIKit


class RockPaperScissorsViewController: UIViewController {
	typealias RPS = RPSGameRPSCase
	typealias Character = RPSGameCharacterCase
	
	let rpsVM = RockPaperScissorsViewModel()
	
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
	let confirmButton = UIButton()
	let gameBoardWindow = UIView()
	let gameBoardDescription = UITextView()
	let comCharacterImage = UIImageView()
	let comRockImage = UIImageView()
	let comPaperImage = UIImageView()
	let comScissorsImage = UIImageView()
	let comPlayerLabel = UILabel()
	let youCharacterImage = UIImageView()
	let youRockImage = UIImageView()
	let youPaperImage = UIImageView()
	let youScissorsImage = UIImageView()
	let youPlayerLabel = UILabel()
	
	// viewGroup3 - gameResult
	let restartButton = UIButton()
	let comSelectedRPSImage = UIImageView()
	let youOutcomeLabel = UILabel()
	let comOutcomeLabel = UILabel()
	
	var youRPSImageViewArr: [UIImageView] = []
	
	deinit {
		NSLog("=== deinit - RockPaperScissorsViewController ===")
	}
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
		
		youRPSImageViewArr.append(youRockImage)
		youRPSImageViewArr.append(youPaperImage)
		youRPSImageViewArr.append(youScissorsImage)
		
		setupViewModelBindingsClosure()
	}
	
}

// MARK: - Configuration Style
extension RockPaperScissorsViewController {
	func configGameStyledButton(_ title:String) -> UIButton.Configuration {
		var config = UIButton.Configuration.filled()
		config.title = title
		config.baseForegroundColor = .white
		config.baseBackgroundColor = UIColor(named: "color-button")
		config.background.strokeWidth = 3
		config.background.strokeColor = .black
		config.contentInsets = NSDirectionalEdgeInsets(
			top: 10, leading: 20,
			bottom: 10, trailing: 20)
		config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer {
			var attribute = $0
			attribute.font = UIFont(name: FONT_DNF, size: 24)
			return attribute
		}
		return config
	}
}

// MARK: - game action selector
extension RockPaperScissorsViewController {
	@objc func playerSelect(_ sender: UISegmentedControl) {
		rpsVM.updatePlayer(sender.selectedSegmentIndex)
	}
	
	@objc func rpsTap(_ sender: UITapGestureRecognizer) {
		let isReadyToConfirm = (rpsVM.game.state == .readyToConfirm)
		guard (isReadyToConfirm) else { return }
				
		let selectView = sender.view as? UIImageView
		let tag = selectView?.tag ?? 0
		rpsVM.updateSelectRPS(tag)
	}
}

// MARK: - game button selector
extension RockPaperScissorsViewController {
	@objc func touchStartButton() {
		rpsVM.updateGameStateNext()
	}
	
	@objc func touchConfirmButton() {
		let isSelectRPS = rpsVM.rps.you != nil
		guard (isSelectRPS) else { return }
		rpsVM.updateGameStateNext()
	}
	
	@objc func touchRestartButton() {
		rpsVM.updateGameStateNext()
	}
}
