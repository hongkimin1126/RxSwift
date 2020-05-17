import UIKit
import RxSwift

/*:
 # throttle: 지정된 주기마다 구독자에게 요소를 하나씩 전달.
 */
//아래에서는 Observable이 0.3, 0.5초 마다 요소를 방출하지만 throttle에서 주기를 1초로 저장했기 때문에, 1초 간격 사이에 방출된 요소들은 구독자에게 전달되지 않고 1초를 주기로 방출된 값들만 구독자에게 전달됨.

let disposeBag = DisposeBag()

let buttonTap = Observable<String>.create { observer in
   DispatchQueue.global().async {
      for i in 1...10 {
         observer.onNext("Tap \(i)")
         Thread.sleep(forTimeInterval: 0.3)
      }
      
      Thread.sleep(forTimeInterval: 1)
      
      for i in 11...20 {
         observer.onNext("Tap \(i)")
         Thread.sleep(forTimeInterval: 0.5)
      }
      
      observer.onCompleted()
   }
   
   return Disposables.create()
}


buttonTap
    .throttle(.milliseconds(1000), scheduler: MainScheduler.instance)
   .subscribe { print($0) }
   .disposed(by: disposeBag)
