import UIKit

// MARK: - setup - viewGroup3 - GameCount
extension RockPaperScissorsViewController {
	func setupViewGroup3() {
		setupRestartButton()
		setupComSelectedRPSImage()
		setupYouOutcomeLabel()
		setupComOutcomeLabel()
	}
	
	func setupRestartButton() {
		view.addSubview(restartButton)
		let config = configGameStyledButton("RESTART")
		restartButton.configuration = config
		restartButton.addTarget(self, action: #selector(touchRestartButton), for: .touchUpInside)
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
	
	
	func setupComSelectedRPSImage() {
		view.addSubview(comSelectedRPSImage)
		comSelectedRPSImage.contentMode = .scaleAspectFit
		comSelectedRPSImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			comSelectedRPSImage.widthAnchor.constraint(
				equalToConstant: 50),
			comSelectedRPSImage.heightAnchor.constraint(
				equalToConstant: 50),
			comSelectedRPSImage.topAnchor.constraint(
				equalTo: gameBoardWindow.topAnchor,
				constant: 120),
			comSelectedRPSImage.centerXAnchor.constraint(
				equalTo: selectButton.centerXAnchor,
				constant: view.bounds.width),
		])
	}
	
	func setupYouOutcomeLabel() {
		view.addSubview(youOutcomeLabel)
		youOutcomeLabel.font = UIFont(name: FONT_DNF, size: 25)
		youOutcomeLabel.textAlignment = .center
		youOutcomeLabel.shadowColor = .black
		youOutcomeLabel.shadowOffset = CGSize(width: 1, height: 1)
		
		youOutcomeLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			youOutcomeLabel.centerXAnchor.constraint(
				equalTo: youCharacterImage.centerXAnchor,
				constant: 100 + view.bounds.width),
			youOutcomeLabel.centerYAnchor.constraint(
				equalTo: youCharacterImage.centerYAnchor),
		])
	}
	
	func setupComOutcomeLabel() {
		view.addSubview(comOutcomeLabel)
		comOutcomeLabel.font = UIFont(name: FONT_DNF, size: 25)
		comOutcomeLabel.textAlignment = .center
		comOutcomeLabel.shadowColor = .black
		comOutcomeLabel.shadowOffset = CGSize(width: 1, height: 1)
		
		comOutcomeLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			comOutcomeLabel.centerXAnchor.constraint(
				equalTo: comCharacterImage.centerXAnchor,
				constant: -100 + view.bounds.width),
			comOutcomeLabel.centerYAnchor.constraint(
				equalTo: comCharacterImage.centerYAnchor),
		])
	}
	
}

