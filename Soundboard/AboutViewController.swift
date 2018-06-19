import UIKit
import SafariServices

class AboutViewController: UIViewController {
  
  @IBOutlet weak var scrollView: UIScrollView!
  
  let spaceVertical: CGFloat = 20
  let spaceHorizontal: CGFloat = 30
  let contentWidth: CGFloat = screenWidth - 20 * 2
  let fontSize: CGFloat = 28

  var linkButtons: [LinkButton] = []
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    view.backgroundColor = Color.medium
    setUpScrollViewContent()
  }
  
  private func setUpScrollViewContent() {
    var contentHeight: CGFloat = spaceHorizontal
    
    let informationPart1 = UILabel(frame: CGRect(x: spaceVertical,
                                                 y: contentHeight,
                                                 width: contentWidth,
                                                 height: 0))
    informationPart1.text = "Soundboard iOS is a soundboard created by Eugene Belinski and is available for iOS and Android. It contains sounds played on The Young Turks. Please contact me if you find any bugs, want me to add a new sound, or if you have any comment or suggestion."
    setLabelStandardProperties(label: informationPart1)
    scrollView?.addSubview(informationPart1)
    contentHeight += informationPart1.frame.height
    
    contentHeight += spaceHorizontal
    
    let buttonTwitter = LinkButton(frame: CGRect(x: spaceVertical,
                                                 y: contentHeight,
                                                 width: 0,
                                                 height: 0))
    buttonTwitter.link = Link(title: "@EugeneBelinski",
                              appURL: "twitter://user?screen_name=eugenebelinski",
                              webURL: "https://twitter.com/EugeneBelinski")
    buttonTwitter.addTarget(self, action: #selector(AboutViewController.didTapLinkButton(sender:)), for: .touchUpInside)
    setButtonStandardProperties(button: buttonTwitter)
    scrollView.addSubview(buttonTwitter)
    linkButtons.append(buttonTwitter)
    contentHeight += buttonTwitter.frame.height
    
    contentHeight += spaceHorizontal
    
    let buttonWebsite = LinkButton(frame: CGRect(x: spaceVertical,
                                                 y: contentHeight,
                                                 width: 0,
                                                 height: 0))
    buttonWebsite.link = Link(title: "My Website",
                              appURL: nil,
                              webURL: "https://ebelinski.com")
    buttonWebsite.addTarget(self,
                            action: #selector(AboutViewController.didTapLinkButton(sender:)),
                            for: .touchUpInside)
    setButtonStandardProperties(button: buttonWebsite)
    scrollView.addSubview(buttonWebsite)
    linkButtons.append(buttonWebsite)
    contentHeight += buttonWebsite.frame.height
    
    contentHeight += spaceHorizontal
    
    let informationPart2 = UILabel(frame: CGRect(x: spaceVertical,
                                                 y: contentHeight,
                                                 width: contentWidth,
                                                 height: 0))
    informationPart2.text = "If you like this app, please consider making a donation to Wolf PAC or becoming a TYT member."
    setLabelStandardProperties(label: informationPart2)
    scrollView.addSubview(informationPart2)
    contentHeight += informationPart2.frame.height
    
    contentHeight += spaceHorizontal
    
    let buttonWolfPAC = LinkButton(frame: CGRect(x: spaceVertical,
                                                 y: contentHeight,
                                                 width: 0,
                                                 height: 0))
    buttonWolfPAC.link = Link(title: "WolfPAC",
                              appURL: nil,
                              webURL: "http://www.wolf-pac.com")
    buttonWolfPAC.addTarget(self,
                            action: #selector(AboutViewController.didTapLinkButton(sender:)),
                            for: .touchUpInside)
    setButtonStandardProperties(button: buttonWolfPAC)
    scrollView.addSubview(buttonWolfPAC)
    linkButtons.append(buttonWolfPAC)
    contentHeight += buttonTwitter.frame.height
    
    contentHeight += spaceHorizontal
    
    let buttonTYT = LinkButton(frame: CGRect(x: spaceVertical,
                                             y: contentHeight,
                                             width: 0,
                                             height: 0))
    buttonTYT.link = Link(title: "TYT Network",
                          appURL: nil,
                          webURL: "https://tytnetwork.com")
    buttonTYT.addTarget(self,
                        action: #selector(AboutViewController.didTapLinkButton(sender:)),
                        for: .touchUpInside)
    setButtonStandardProperties(button: buttonTYT)
    scrollView.addSubview(buttonTYT)
    linkButtons.append(buttonTYT)
    contentHeight += buttonTYT.frame.height
    
    contentHeight += spaceHorizontal
    
    scrollView.contentSize = CGSize(
      width: contentWidth,
      height: contentHeight)
  }
  
  private func setLabelStandardProperties(label: UILabel) {
    label.font = label.font.withSize(fontSize)
    label.numberOfLines = 0
    label.textColor = Color.text
    label.sizeToFit()
  }
  
  private func setButtonStandardProperties(button: UIButton) {
    button.titleLabel?.font = button.titleLabel?.font.withSize(fontSize)
    button.setTitleColor(Color.dark, for: .normal)
    button.backgroundColor = UIColor.white
    button.sizeToFit()
    button.frame.size = CGSize(width: button.frame.size.width + 25,
                               height: button.frame.size.height)
    button.frame.origin = CGPoint(x: screenWidth / 2 - button.frame.width / 2,
                                  y: button.frame.origin.y)
    button.layer.cornerRadius = button.frame.height / 4
  }

  @objc func didTapLinkButton(sender: AnyObject) {
    guard let linkButton = sender as? LinkButton else { return }
    guard let link = linkButton.link else { return }
    open(link: link)
  }

  func open(link: Link) {
    guard let appURL = link.appURL else {
      guard let webURL = link.webURL else { return }
      open(webUrlString: webURL)
      return
    }
    UIApplication.shared.open(URL(string: appURL)!, options: [:]) {
      success in
      if !success {
        guard let webURL = link.webURL else { return }
        self.open(webUrlString: webURL)
      }
    }
  }

  func open(webUrlString: String) {
    guard let url = URL(string: webUrlString) else { return }
    let svc = SFSafariViewController(url: url)
    present(svc, animated: true, completion: nil)
  }
  
}
