import Foundation

struct APIProviderConfiguration: APIConfiguration {
    let apiBaseURL = URL(string: "http://localhost:4242")!
}

protocol APIConfiguration {
    var apiBaseURL: URL { get }
}
