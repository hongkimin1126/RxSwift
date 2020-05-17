import UIKit
import RxSwift

/*:
 # Sharing Subscription
 */
//share: 똑같은 구독이있다면 결과를 공유한다.

let bag = DisposeBag()

let source = Observable<String>.create { observer in
    let url = URL(string: "https://kxcoding-study.azurewebsites.net/api/string")!
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let data = data, let html = String(data: data, encoding: .utf8) {
            observer.onNext(html)
        }
        
        observer.onCompleted()
    }
    task.resume()
    
    return Disposables.create {
        task.cancel()
    }
}
.debug()
    .share() // 이거를 해줌으로서 밑에서 똑같은 구독이있다면 결과를 공유한다. , 지우고 실행해보기


source.subscribe{print($0)}.disposed(by: bag)
source.subscribe{print($0)}.disposed(by: bag)
source.subscribe{print($0)}.disposed(by: bag)
