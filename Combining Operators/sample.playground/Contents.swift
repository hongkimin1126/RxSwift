import UIKit
import RxSwift

/*:
 # sample
 */
//sample: 버튼을 눌러서 값을 한번만 넣고 싶을 때 사용할수 있을듯

let bag = DisposeBag()

enum MyError: Error {
    case error
}

let trigger = PublishSubject<Void>()
let data = PublishSubject<String>()

data.sample(trigger)
    .subscribe{print($0)}
    .disposed(by: bag)


trigger.onNext(())
data.onNext("Hello")//밑에서 trigger.onNext(()) 해야지 방출

trigger.onNext(())
trigger.onNext(())// withLatestFrom 다르게 위에서 한번 호출하고 여기서 호출하면 위에 한번만 방출된다.

data.onCompleted()
trigger.onNext(())

data.onError(MyError.error)
