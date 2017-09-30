import UIKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    Fabric.with([Crashlytics.self])

    UINavigationBar.appearance().barTintColor = appColorMedium
    UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: appColorText]
    
    UITabBar.appearance().barTintColor = appColorDark
    UITabBar.appearance().tintColor = appColorText
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: appColorText], for: .selected)
    
    UISearchBar.appearance().barTintColor = appColorMedium

    return true
  }
  
}
