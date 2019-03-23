import Foundation

final class EngageMomentController {
    let viewController: EngageMomentViewController
    
    init(viewController: EngageMomentViewController = .init(),
         engageMomentUseCases: EngageMomentUseCases) {
        self.viewController = viewController
        
        let viewModel = EngageMomentViewModel(state: .loading)
        viewController.configure(viewModel: viewModel)
        
        engageMomentUseCases.requestMoments()
    }
}

protocol EngageMomentUseCases {
    func requestMoments()
}

final class EngageMomentUseCasesImp: EngageMomentUseCases {
    func requestMoments() {
        
    }
}
