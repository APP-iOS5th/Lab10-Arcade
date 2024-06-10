import UIKit

#Preview { RockPaperScissorsViewController() }

class RockPaperScissorsViewController: UIViewController {
	typealias RPS = RPSGameRPSCase
	typealias Character = RPSGameCharacterCase
	
	let rpsVM = RockPaperScissorsViewModel()
	
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
	
	var youRpsImageViewArray: [UIImageView] = []
	
	deinit {
		print("deinit - RockPaperScissorsViewController")
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
		
		youRpsImageViewArray.append(youRockImage)
		youRpsImageViewArray.append(youPaperImage)
		youRpsImageViewArray.append(youScissorsImage)
		
		setupViewModelBindingsClosure()
		rpsVM.initGameData()
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

// MARK: - game action selector
extension RockPaperScissorsViewController {
	@objc func playerSelect(_ sender: UISegmentedControl) {
		rpsVM.selectPlayer(sender.selectedSegmentIndex)
	}
	
	@objc func rpsTap(_ sender: UITapGestureRecognizer) {
		guard (rpsVM.game.state == .readyToSelect) else { return }
				
		let selectView = sender.view as? UIImageView
		let tag = selectView?.tag
		rpsVM.selectRPS(tag ?? 0)
	}
}

// MARK: - game button selector
extension RockPaperScissorsViewController {
	@objc func touchStartButton() {
		rpsVM.gameStateNext()
		UIView.animate(withDuration: 0.5, animations: {
			[weak self] in
			self?.locationLeftGroup1()
		}, completion: {
			[weak self] _ in
			self?.locationRightEndGroup1()
		})
	}
	
	@objc func touchSelectButton() {
		guard (rpsVM.rps.you != nil) else { return }
		rpsVM.gameStateNext()
		rpsVM.updateOutcome()
		
		UIView.animate(withDuration: 0.5, animations: {
			[weak self] in
			self?.locationLeftGroup2()
			self?.startAAA()
		}, completion: {
			[weak self] _ in
			self?.locationRightEndGroup2()
		})
	}
	
	@objc func touchReStartButton() {
		rpsVM.gameStateNext()
		optionWindowSegControl.selectedSegmentIndex = 0
		
		UIView.animate(withDuration: 0.5, animations: {
			[weak self] in
			self?.locationLeftGroup3()
		}, completion: {
			[weak self] _ in
			self?.locationRightEndGroup3()
			self?.endAAA()
			self?.gameBoardDescription.isHidden = false
			self?.gameBoardDescription.alpha = 1
			self?.rpsVM.initGameData()
		})
	}
}

// MARK: ViewModel Binding
extension RockPaperScissorsViewController {
	func setupViewModelBindingsClosure() {
		rpsVM.charactersImageDidChange = {
			[weak self] youImageName, comImageName in
			self?.youCharacterImage
				.image = UIImage(named: youImageName)
			self?.comCharacterImage
				.image = UIImage(named: comImageName)
		}
		
		rpsVM.comSelectRPSImageDidChange = {
			[weak self] imageName in
			self?.comSelectedRPSImage
				.image = UIImage(named: imageName)
		}
		
		rpsVM.youOldSelectRPSImageAnimation = {
			[weak self] oldTag in
			let selectView = self?.youRpsImageViewArray
				.first(where: { $0.tag == oldTag })
			UIView.animate(withDuration: 0.5, animations: {
				self?.rpsImageLocationDown(selectView)
			})
		}
		
		rpsVM.youNewSelectRPSImageAnimation = {
			[weak self] newTag in
			let selectView = self?.youRpsImageViewArray
				.first(where: { $0.tag == newTag })
			UIView.animate(withDuration: 0.5, animations: {
				self?.rpsImageLocationUp(selectView)
			})
		}
		
		rpsVM.youOutcomeLabelDidChange = {
			[weak self] text, colorName in
			self?.youOutcomeLabel.text = text
			self?.youOutcomeLabel.textColor = UIColor(named: colorName)
		}
		
		rpsVM.comOutcomeLabelDidChange = {
			[weak self] text, colorName in
			self?.comOutcomeLabel.text = text
			self?.comOutcomeLabel.textColor = UIColor(named: colorName)
		}
		
		rpsVM.gameBoardDescriptionHiddenAnimation = {
			[weak self] in
			guard (self?.gameBoardDescription
				.isHidden == false) else { return }
			
			UIView.animate(withDuration: 0.2, animations: {
				self?.gameBoardDescription.alpha = 0
			}, completion: { _ in
				self?.gameBoardDescription.isHidden = true
			})
		}
	}
}
