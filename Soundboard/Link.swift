import Foundation

struct Link {
  let title: String?
  let appURL: String?
  let webURL: String?

  init(title: String?, appUrl: String?, webURL: String?) {
    self.title = title
    self.appURL = appUrl
    self.webURL = webURL
  }
}
