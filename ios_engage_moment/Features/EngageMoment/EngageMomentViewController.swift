import UIKit
import SnapKit

class EngageMomentViewController: UIViewController {
    
    //-----------------------------------------------------------------------------
    // MARK: - Private properties
    //-----------------------------------------------------------------------------
    
    private let scrollView = UIScrollView()
    
    private let containerView: UIView = UIView()
    private let timerLabel = UILabel()
    private let productImageView = UIImageView()
    private let actualDiscountLabel = UILabel()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    private let loadingIndicator = UIActivityIndicatorView()
    
    private let actionButton = UIButton()
    
    private var timerCount: Seconds = 120
    typealias Seconds = Int
    
    //-----------------------------------------------------------------------------
    // MARK: - Initializers
    //-----------------------------------------------------------------------------
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        configureVisualElements()
        addViews()
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
//            print("Timer fired!")
//            guard let `self` = self else { return }
//            self.timerCount -= 1
//
//            self.timerLabel.text = self.convertSecondsToMinutes(seconds: self.timerCount)
//            if self.timerCount <= 0 {
//                timer.invalidate()
//            }
//        }
        
    }
    
    private func convertSecondsToMinutes(seconds: Seconds) -> String {
        let minutes = (seconds % 3600) / 60
        let seconds = (seconds % 3600) % 60
        let secondsFormmated = seconds < 10 ?  "0\(seconds)" : seconds.description
        return "\(minutes) : \(secondsFormmated)"
    }

    //-----------------------------------------------------------------------------
    // MARK: - Public methods
    //-----------------------------------------------------------------------------
    
    func configure(viewModel: EngageMomentViewModel) {
        if viewModel.isLoading {
            loadingIndicator.startAnimating()
            containerView.isHidden = true
        } else {
            loadingIndicator.stopAnimating()
            containerView.isHidden = false
        }
        nameLabel.text = viewModel.productName
        descriptionLabel.text = viewModel.productDescription
    }
}


//-----------------------------------------------------------------------------
// MARK: - Private methods
//-----------------------------------------------------------------------------

extension EngageMomentViewController {
    
}

//-----------------------------------------------------------------------------
// MARK: - Private methods - UI
//-----------------------------------------------------------------------------

extension EngageMomentViewController {
    private func configureVisualElements() {
        title = "Engage Moment"
        view.backgroundColor = .white
            
        scrollView.showsVerticalScrollIndicator = true
        
        containerView.backgroundColor = .white
        
        timerLabel.text = "10:00"
        timerLabel.font = UIFont.systemFont(ofSize: 40)
        
        actualDiscountLabel.text = "5% off and increasing"
        actualDiscountLabel.font = UIFont.systemFont(ofSize: 30)
        
        productImageView.backgroundColor = .red
        
        nameLabel.text = "Product name"
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        descriptionLabel.numberOfLines = 0
        
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        
        actionButton.backgroundColor = .black
        actionButton.setTitle("BUY", for: .normal)
    }
    
    private func addViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        containerView.addSubview(timerLabel)
        containerView.addSubview(actualDiscountLabel)
        containerView.addSubview(productImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(actionButton)
        
        view.addSubview(loadingIndicator)
        
    }
    
    private func configureConstraints() {
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        containerView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top)
            $0.leading.equalTo(view.snp.leading)
            $0.bottom.equalTo(scrollView.snp.bottom)
            $0.trailing.equalTo(view.snp.trailing)
            $0.height.equalToSuperview()
        }
        
        timerLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(10)
        }
        
        actualDiscountLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(timerLabel.snp.bottom).offset(10)
        }
        
        productImageView.snp.makeConstraints {
            $0.height.equalTo(250)
            $0.top.equalTo(actualDiscountLabel.snp.bottom).offset(20)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(20)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(20)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
        }
        
        loadingIndicator.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(40)
            $0.center.equalToSuperview()
        }
        
        actionButton.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
    }
}

//final class LoadingView {
//    let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
//
//    let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
//    loadingIndicator.hidesWhenStopped = true
//    loadingIndicator.style = UIActivityIndicatorView.Style.gray
//    loadingIndicator.startAnimating();
//
//    alert.view.addSubview(loadingIndicator)
//    present(alert, animated: true, completion: nil)
//}
