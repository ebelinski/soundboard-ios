import UIKit
import Crashlytics

class AboutViewController: UIViewController {
  
  @IBOutlet weak var scrollView: UIScrollView!
  
  let spaceVertical: CGFloat = 20
  let spaceHorizontal: CGFloat = 30
  let contentWidth: CGFloat = screenWidth - 20 * 2
  let fontSize: CGFloat = 28
  
  var buttonTwitter: UIButton?
  var buttonWebsite: UIButton?
  var buttonWolfPAC: UIButton?
  var buttonTYT: UIButton?
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    view.backgroundColor = appColorMedium
    setUpScrollViewContent()

    Answers.logContentView(withName: "About",
                           contentType: nil,
                           contentId: nil,
                           customAttributes: nil)
  }
  
  private func setUpScrollViewContent() {
    var contentHeight: CGFloat = spaceHorizontal
    
    let informationPart1 = UILabel(frame: CGRect(x: spaceVertical,
                                                 y: contentHeight,
                                                 width: contentWidth,
                                                 height: 0))
    informationPart1.text = "Soundboard for TYT was created by Eugene Belinski and is available for iOS and Android. Please contact me if you find any bugs, want me to add a new sound, or if you have any comment or suggestion."
    setLabelStandardProperties(label: informationPart1)
    scrollView?.addSubview(informationPart1)
    contentHeight += informationPart1.frame.height
    
    contentHeight += spaceHorizontal
    
    let buttonTwitter = UIButton(frame: CGRect(x: spaceVertical,
                                               y: contentHeight,
                                               width: 0,
                                               height: 0))
    buttonTwitter.setTitle("@EugeneBelinski", for: .normal)
    buttonTwitter.addTarget(self, action: #selector(AboutViewController.didTapButtonTwitter(sender:)), for: .touchUpInside)
    setButtonStandardProperties(button: buttonTwitter)
    scrollView.addSubview(buttonTwitter)
    self.buttonTwitter = buttonTwitter
    contentHeight += buttonTwitter.frame.height
    
    contentHeight += spaceHorizontal
    
    let buttonWebsite = UIButton(frame: CGRect(x: spaceVertical,
                                               y: contentHeight,
                                               width: 0,
                                               height: 0))
    buttonWebsite.setTitle("My Website", for: .normal)
    buttonWebsite.addTarget(self,
                            action: #selector(AboutViewController.didTapButtonWebsite(sender:)),
                            for: .touchUpInside)
    setButtonStandardProperties(button: buttonWebsite)
    scrollView.addSubview(buttonWebsite)
    self.buttonWebsite = buttonWebsite
    contentHeight += buttonWebsite.frame.height
    
    contentHeight += spaceHorizontal
    
    let informationPart2 = UILabel(frame: CGRect(x: spaceVertical,
                                                 y: contentHeight,
                                                 width: contentWidth,
                                                 height: 0))
    informationPart2.text = "If you liked this app, please consider making a donation to Wolf PAC or becoming a TYT member."
    setLabelStandardProperties(label: informationPart2)
    scrollView.addSubview(informationPart2)
    contentHeight += informationPart2.frame.height
    
    contentHeight += spaceHorizontal
    
    let buttonWolfPAC = UIButton(frame: CGRect(x: spaceVertical,
                                               y: contentHeight,
                                               width: 0,
                                               height: 0))
    buttonWolfPAC.setTitle("Wolf PAC", for: .normal)
    buttonWolfPAC.addTarget(self,
                            action: #selector(AboutViewController.didTapButtonWolfPAC(sender:)),
                            for: .touchUpInside)
    setButtonStandardProperties(button: buttonWolfPAC)
    scrollView.addSubview(buttonWolfPAC)
    self.buttonWolfPAC = buttonWolfPAC
    contentHeight += buttonTwitter.frame.height
    
    contentHeight += spaceHorizontal
    
    let buttonTYT = UIButton(frame: CGRect(x: spaceVertical,
                                           y: contentHeight,
                                           width: 0,
                                           height: 0))
    buttonTYT.setTitle("TYT Network", for: .normal)
    buttonTYT.addTarget(self,
                        action: #selector(AboutViewController.didTapButtonTYT(sender:)),
                        for: .touchUpInside)
    setButtonStandardProperties(button: buttonTYT)
    scrollView.addSubview(buttonTYT)
    self.buttonWebsite = buttonTYT
    contentHeight += buttonTYT.frame.height
    
    contentHeight += spaceHorizontal
    
    scrollView.contentSize = CGSize(
      width: contentWidth,
      height: contentHeight)
  }
  
  private func setLabelStandardProperties(label: UILabel) {
    label.font = label.font.withSize(fontSize)
    label.numberOfLines = 0
    label.textColor = appColorText
    label.sizeToFit()
  }
  
  private func setButtonStandardProperties(button: UIButton) {
    button.titleLabel?.font = button.titleLabel?.font.withSize(fontSize)
    button.setTitleColor(appColorDark, for: .normal)
    button.backgroundColor = UIColor.white
    button.sizeToFit()
    button.frame.size = CGSize(width: button.frame.size.width + 25,
                               height: button.frame.size.height)
    button.frame.origin = CGPoint(x: screenWidth / 2 - button.frame.width / 2,
                                  y: button.frame.origin.y)
    button.layer.cornerRadius = button.frame.height / 4
  }
  
  @objc func didTapButtonTwitter(sender: AnyObject) {
    UIApplication.shared.open(URL(string: "https://twitter.com/EugeneBelinski")!,
                              options: [:],
                              completionHandler: nil)
  }
  
  @objc func didTapButtonWebsite(sender: AnyObject) {
    UIApplication.shared.open(URL(string: "http://ebelinski.com")!,
                              options: [:],
                              completionHandler: nil)
  }
  
  @objc func didTapButtonWolfPAC(sender: AnyObject) {
    UIApplication.shared.open(URL(string: "http://www.wolf-pac.com")!,
                              options: [:],
                              completionHandler: nil)
  }
  
  @objc func didTapButtonTYT(sender: AnyObject) {
    UIApplication.shared.open(URL(string: "https://tytnetwork.com")!,
                              options: [:],
                              completionHandler: nil)
  }
  
}
