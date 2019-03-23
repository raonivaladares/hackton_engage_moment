import Foundation
import Result

protocol EngageMomentUseCases {
    func requestMoments(completion: @escaping (Result<Engage, ServerError>) -> Void)
}

final class EngageMomentUseCasesImp: EngageMomentUseCases {
    func requestMoments(completion: @escaping (Result<Engage, ServerError>) -> Void) {
        let product = Product(id: "222", name: "Mock Product", brandID: "222", shortDescription: "it is a happy mock description")
        let engage = Engage(product: product)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            completion(.success(engage))
        }
    }
}
