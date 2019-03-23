import Foundation

struct EngageMomentViewModel {
    let isLoading: Bool
}

extension EngageMomentViewModel {
    enum State {
        case loading
        case showMoment
        case showError
    }
    
    init(state: State) {
        switch state {
        case .loading:
            isLoading = true
        case .showMoment:
            isLoading = false
        case .showError:
            isLoading = false
        }
    }
}
