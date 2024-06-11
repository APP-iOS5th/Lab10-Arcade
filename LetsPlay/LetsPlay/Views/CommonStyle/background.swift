import UIKit

func setupCommonBackgroundImage(view : UIView, backgroundImageView: UIImageView) {
	view.addSubview(backgroundImageView)
	view.sendSubviewToBack(backgroundImageView)
	backgroundImageView.image = UIImage(named: BACKGROUND_IMAGE)
	backgroundImageView.contentMode = .scaleAspectFit
	backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
	
	NSLayoutConstraint.activate([
		backgroundImageView.widthAnchor.constraint(
			equalTo: view.widthAnchor),
		backgroundImageView.heightAnchor.constraint(
			equalTo: backgroundImageView.widthAnchor,
			multiplier: 2.5),
		backgroundImageView.centerXAnchor.constraint(
			equalTo: view.centerXAnchor),
		backgroundImageView.bottomAnchor.constraint(
			equalTo: view.bottomAnchor),
	])
}
