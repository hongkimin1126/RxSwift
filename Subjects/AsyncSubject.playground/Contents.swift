
import UIKit
import RxSwift
import RxCocoa

/*:
 AsyncSubject: Subject로 completed이벤트가 전달되는 시점에 마직막으로 전달된 next이벤트를 구독자에게 전달함.
 */



let bag = DisposeBag()

enum MyError: Error {
   case error
}

let subject = AsyncSubject<Int>()

subject.subscribe{ print($0) }.disposed(by: bag)

subject.onNext(1)

subject.onNext(2)
subject.onNext(3)

//completed이벤트가 전달되는 시점에 마직막으로 전달된 next이벤트를 구독자에게 전달하기때문에 3만 전달되고 이후에 Completed된다.
subject.onCompleted()
//subject.onError(MyError.error)//Completed가 아니기때문에 error만 출력된다.
