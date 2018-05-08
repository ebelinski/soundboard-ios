import UIKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    Fabric.with([Crashlytics.self])

    UINavigationBar.appearance().barTintColor = Color.medium
    UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: Color.text]
    
    UITabBar.appearance().barTintColor = Color.dark
    UITabBar.appearance().tintColor = Color.text
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: Color.text], for: .selected)
    
    UISearchBar.appearance().barTintColor = Color.medium

    return true
  }
  
}
