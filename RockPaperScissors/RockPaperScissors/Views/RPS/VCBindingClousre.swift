import UIKit

// MARK: ViewModel Binding
extension RockPaperScissorsViewController {
	func setupViewModelBindingsClosure() {
		
		// MARK: - game
		rpsVM.readyToSelectActions = { [weak self] in
			UIView.animate(withDuration: 0.5, animations: {
				[weak self] in
				self?.locationLeftGroup1()
			}, completion: {
				[weak self] _ in
				self?.locationRightEndGroup1()
			})
		}
		rpsVM.readyToRestartActions = { [weak self] in
			self?.rpsVM.updateOutcome()
			UIView.animate(withDuration: 0.5, animations: {
				[weak self] in
				self?.locationLeftGroup2()
				self?.startAnimationSelectRPSCase()
			}, completion: {
				[weak self] _ in
				self?.locationRightEndGroup2()
			})
		}
		rpsVM.readyToStartActions = { [weak self] in
			self?.optionWindowSegControl.selectedSegmentIndex = 0

			UIView.animate(withDuration: 0.5, animations: {
				[weak self] in
				self?.locationLeftGroup3()
			}, completion: {
				[weak self] _ in
				self?.locationRightEndGroup3()
				self?.endAnimationSelectRPSCase()
				self?.gameBoardDescription.isHidden = false
				self?.gameBoardDescription.alpha = 1
				self?.rpsVM.initGameData()
			})
		}
		
		// MARK: - player
		rpsVM.charactersImageDidChange = {
			[weak self] youImageName, comImageName in
			self?.youCharacterImage
				.image = UIImage(named: youImageName)
			self?.comCharacterImage
				.image = UIImage(named: comImageName)
		}
		
		// MARK: - rps
		rpsVM.gameBoardDescriptionHiddenAnimation = {
			[weak self] isReadyToSelect in
			let isVisible = self?.gameBoardDescription.isHidden == false
			guard (isReadyToSelect), (isVisible) else { return }
			
			UIView.animate(withDuration: 0.2, animations: {
				self?.gameBoardDescription.alpha = 0
			}, completion: { _ in
				self?.gameBoardDescription.isHidden = true
			})
		}
		rpsVM.comSelectRPSImageDidChange = {
			[weak self] imageName in
			self?.comSelectedRPSImage
				.image = UIImage(named: imageName)
		}
		rpsVM.youOldSelectRPSImageAnimation = {
			[weak self] oldTag in
			let selectView = self?.youRPSImageViewArr
				.first(where: { $0.tag == oldTag })
			UIView.animate(withDuration: 0.5, animations: {
				self?.imageLocationDown(selectView)
			})
		}
		rpsVM.youNewSelectRPSImageAnimation = {
			[weak self] newTag in
			let selectView = self?.youRPSImageViewArr
				.first(where: { $0.tag == newTag })
			UIView.animate(withDuration: 0.5, animations: {
				self?.imageLocationUp(selectView)
			})
		}
		
		// MARK: - outcome
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
		
	}
}
