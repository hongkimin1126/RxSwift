import UIKit
import RxSwift



/*:
 BehaviorSubject: 생성시점에 시작 이벤트를 지정. Subject로 전달되는 이벤트중에서 가장 마지막에 전달된 최신이벤트를 저장해두었다가 새로운 구독자에게 전달함.
 */


let disposeBag = DisposeBag()

enum MyError: Error {
   case error
}


let b = BehaviorSubject<Int>(value: 0)
b.onNext(2)// 퍼블리시랑 다르데 젤 마지막놈 1개만 방출

b.subscribe {print("BehaviorSubject1 >>", $0)}.disposed(by: disposeBag) //아래의 구독 코드는 위의 구독코드 위쪽의 subject는 실행하지 못한다. --> BehaviorSubject2는 BehaviorSubject<Int>(value: 0)를 실행할수 없다.

b.onNext(1) //현재 1 만 버퍼에 있다. 0,2 는 플레이그라운드라 출력은 되나 없는 값이다.

b.subscribe {print("BehaviorSubject2 >>", $0)}.disposed(by: disposeBag)
