import UIKit
import RxSwift


/*:
PublishSubject: 기본형태. 새로운 이벤트를 구독자에게 전달.
 */


let disposeBag = DisposeBag()

enum MyError: Error {
   case error
}


let subject = PublishSubject<String>()

subject.onNext("Hello") //아직 구독을 시작하지 않아 무용지물 코드.

let o1 = subject.subscribe {print(">>1", $0)}

subject.onNext("RxSwift") // 위에 subject.onNext("Hello")은 실행되지 않는다. subject가 구독을 시작한 이후부터 이벤트를 받는다.
subject.onNext("Hi")

let o2 = subject.subscribe {print(">>2", $0)}

subject.onNext("Subject")
subject.onCompleted() // onCompleted 호출된 시점 이래의 subject들은 실행되지 않고 위의 것들은 실행됨.
//subject.onError(MyError.error)

let o3 = subject.subscribe { print(">>3", $0) }

subject.onNext("aaa")
