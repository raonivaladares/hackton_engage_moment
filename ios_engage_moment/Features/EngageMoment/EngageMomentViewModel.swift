import Foundation

struct EngageMomentViewModel {
    let isLoading: Bool
    let productName: String
    let productDescription: String
}

extension EngageMomentViewModel {
    enum State {
        case loading
        case showMoment(Engage)
        case showError
    }
    
    init(state: State) {
        switch state {
        case .loading:
            isLoading = true
            productName = ""
            productDescription = ""
        case .showMoment(let engage):
            isLoading = false
            productName = engage.product.name
            productDescription = engage.product.shortDescription
        case .showError:
            isLoading = false
            productName = ""
            productDescription = ""
        }
    }
}
