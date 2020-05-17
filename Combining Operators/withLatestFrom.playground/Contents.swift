import UIKit
import RxSwift

/*:
 # withLatestFrom
 */


let bag = DisposeBag()

enum MyError: Error {
    case error
}

let trigger = PublishSubject<Void>()
let data = PublishSubject<String>()

trigger.withLatestFrom(data)
    .subscribe{print(40)}
    .disposed(by: bag)

data.onNext("Hello")// 아직 trigger 가 전달한게 없어서 실행안되고 바로 밑의 코드가 실행되야지 방출한다.
trigger.onNext(())
trigger.onNext(())


data.onCompleted() // 아직 trigger 가 전달한게 없어서 실행안되고 바로 밑의 코드가 실행되야지 방출한다.
trigger.onNext(())// 위에서 Completed를 하면 가장 마지막 이벤트가 방출된다.

trigger.onCompleted()
