import UIKit

#Preview { RockPaperScissorsViewController() }

class RockPaperScissorsViewController: UIViewController {
	typealias rpsVM = RockPaperScissorsViewModel
	
	typealias Player = RPSGamePlayerCase
	typealias RPS = RPSGameRPSCase
	typealias Outcome = RPSGameOutcomeCase
	
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
	let comPlayerLabel = UILabel()
	let youCharacterImage = UIImageView()
	let youRockImage = UIImageView()
	let youPaperImage = UIImageView()
	let youScissorsImage = UIImageView()
	let youPlayerLabel = UILabel()
	
	// viewGroup3 - gameResult
	let restartButton = UIButton()
	let youSelectedRPSImage = UIImageView()
	let comSelectedRPSImage = UIImageView()
	let youOutcomeLabel = UILabel()
	let comOutcomeLabel = UILabel()
	
	var youRpsImageViewArray: [UIImageView] = []
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
		
		setupBindings()
		rpsVM.shared.initGameData()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		rpsVM.shared.initGameData()
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
		rpsVM.shared.selectPlayer(index)
	}
	
	@objc func rpsTap(_ sender: UITapGestureRecognizer) {
		let selectView = sender.view as? UIImageView
		let tag = selectView?.tag
		switch tag {
			case RPS.rock.tag: 
				rpsVM.shared.rps.update(
				you: RPS.rock,
				com: RPS.allCases.randomElement())
			case RPS.paper.tag: 
				rpsVM.shared.rps.update(
				you: RPS.paper,
				com: RPS.allCases.randomElement())
			case RPS.scissors.tag:
				rpsVM.shared.rps.update(
				you: RPS.scissors,
				com: RPS.allCases.randomElement())
			default: break
		}
		rpsVM.shared.outcomeRPS()
	}
}

// MARK: Binding
extension RockPaperScissorsViewController {
	func setupBindings() {

		rpsVM.shared.charactersImageDidChange = {
			[weak self] youImageName, comImageName in
			self?.youCharacterImage
				.image = UIImage(named: youImageName)
			self?.comCharacterImage
				.image = UIImage(named: comImageName)
		}
		
		rpsVM.shared.youSelectRPSImageDidChange = {
			[weak self] imageName in
			self?.youSelectedRPSImage
				.image = UIImage(named: imageName)
		}
		
		rpsVM.shared.comSelectRPSImageDidChange = {
			[weak self] imageName in
			self?.comSelectedRPSImage
				.image = UIImage(named: imageName)
		}
		
		rpsVM.shared.youOldSelectRPSImageAnimation = {
			[weak self] oldTag in
			let selectView = self?.youRpsImageViewArray
				.first(where: { $0.tag == oldTag })
			UIView.animate(withDuration: 0.5, animations: {
				self?.locationBottom(selectView)
			})
		}
		
		rpsVM.shared.youSelectRPSImageAnimation = {
			[weak self] newTag in
			let selectView = self?.youRpsImageViewArray
				.first(where: { $0.tag == newTag })
			UIView.animate(withDuration: 0.5, animations: {
				self?.locationTop(selectView)
			})
		}
		
		rpsVM.shared.youOutcomeLabelDidChange = {
			[weak self] text, colorName in
			self?.youOutcomeLabel.text = text
			self?.youOutcomeLabel.textColor = UIColor(named: colorName)
		}
		
		rpsVM.shared.comOutcomeLabelDidChange = {
			[weak self] text, colorName in
			self?.comOutcomeLabel.text = text
			self?.comOutcomeLabel.textColor = UIColor(named: colorName)
		}

	}
}

// MARK: - game button action selector
extension RockPaperScissorsViewController {
	@objc func gameStart() {
		UIView.animate(withDuration: 0.5, animations: {
			self.locationLeftGroup1()
		}, completion: {_ in
			self.locationRightEndGroup1()
		})
	}
	
	@objc func gameRpsSelect() {
		guard (rpsVM.shared.rps.you != nil) else {
			// TODO: "가위바위보를 선택해주세요" 메세지 출력
			return
		}
		
		UIView.animate(withDuration: 0.5, animations: {
			self.locationLeftGroup2()
		}, completion: {_ in
			self.locationRightEndGroup2()
		})
	}
	
	@objc func gameRestart() {
		UIView.animate(withDuration: 0.5, animations: {
			self.locationLeftGroup3()
			self.optionWindowSegControl.selectedSegmentIndex = 0
		}, completion: {_ in
			self.locationRightEndGroup3()
			rpsVM.shared.initGameData()
		})
	}
}
