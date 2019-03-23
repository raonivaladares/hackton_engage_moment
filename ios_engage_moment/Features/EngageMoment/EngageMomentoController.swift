import Foundation
import Result

final class EngageMomentController {
    let viewController: EngageMomentViewController
    
    init(viewController: EngageMomentViewController = .init(),
         engageMomentUseCases: EngageMomentUseCases) {
        self.viewController = viewController
        
        let viewModel = EngageMomentViewModel(state: .loading)
        viewController.configure(viewModel: viewModel)
        
        engageMomentUseCases.requestMoments { result in
            result.analysis(ifSuccess: { engage in
                let viewModel = EngageMomentViewModel(state: .showMoment(engage))
                viewController.configure(viewModel: viewModel)
            }, ifFailure: { error in
                let viewModel = EngageMomentViewModel(state: .showError)
                viewController.configure(viewModel: viewModel)
            })
        }
    }
}
