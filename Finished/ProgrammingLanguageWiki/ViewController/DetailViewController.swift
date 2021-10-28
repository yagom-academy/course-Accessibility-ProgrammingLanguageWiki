//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var languageTitleLabel: UILabel!
    @IBOutlet weak var languageImageView: UIImageView!
    @IBOutlet weak var languageDescriptionLabel: UILabel!
    @IBOutlet weak var isLikeButton: IsLikeButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var moveToWikiButton: UIButton!
    
    var languageIndex: Int?
    var likeButtonDelegate: LikeButtonDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAllData()
        configureAccessibility()
    }
    
    private func setAllData() {
        guard let index = languageIndex else { return }
        let language = ProgrammingLanguageInfoManager.shared.infoList[index]
        
        languageTitleLabel.text = language.name
        languageImageView.image = language.logoImage
        languageDescriptionLabel.text = language.body
        isLikeButton.languageIndex = languageIndex
        isLikeButton.updateButtonStatus()
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func toggleLikeButton(_ sender: IsLikeButton) {
        sender.updateIsLike()
        sender.updateButtonStatus()
        likeButtonDelegate?.reloadCurrentList()
    }
    
    @IBAction func moveToURLButton(_ sender: Any) {
        guard let index = languageIndex else { return }
        let language = ProgrammingLanguageInfoManager.shared.infoList[index]
        guard let encodedURLString = language.wikiURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let url = URL(string: encodedURLString) else { return }
        
        UIApplication.shared.open(url)
    }
}

// MARK: - Accessibility
extension DetailViewController {
    private func configureAccessibility() {
//        configureLogoImageAccessibility()
        configureBackButtonAccessibility()
        configurelanguageTitleLabelAccessibility()
        configureLanguageDescriptionLabelAccessibility()
        configureMoveToWikiButtonAccessibility()
    }
    
    private func configureLogoImageAccessibility() {
        languageImageView.isAccessibilityElement = true
        languageImageView.accessibilityLabel = "\(languageTitleLabel.text ?? "") 로고"
        languageImageView.accessibilityTraits = .image
        languageImageView.accessibilityIdentifier = "DetailViewController.languageImageView"
        languageImageView.accessibilityHint = "주황색 바탕, 오른쪽 아래로 날고있는 하얀 새"
    }
    
    private func configureBackButtonAccessibility() {
        backButton.accessibilityLabel = "뒤로 가기"
        backButton.accessibilityIdentifier = "DetailViewController.backButton"
        backButton.accessibilityHint = "이전 페이지로 이동합니다."
    }
    
    private func configurelanguageTitleLabelAccessibility() {
        languageTitleLabel.accessibilityLabel = languageTitleLabel.text ?? ""
        languageTitleLabel.accessibilityIdentifier = "DetailViewController.languageTitleLabel"
    }
    
    private func configureLanguageDescriptionLabelAccessibility() {
        languageDescriptionLabel.accessibilityIdentifier = "DetailViewController.languageDescriptionLabel"
    }
    
    private func configureMoveToWikiButtonAccessibility() {
        moveToWikiButton.accessibilityLabel = "위키 백과 보러가기"
        moveToWikiButton.accessibilityIdentifier = "DetailViewController.moToWikiButton"
        moveToWikiButton.accessibilityHint = "위키 백과 사파리 페이지로 이동합니다."
    }
}
