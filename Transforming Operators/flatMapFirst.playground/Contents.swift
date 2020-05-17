import UIKit
import RxSwift

/*:
 # flatMapFirst: 처음에 flatMapFirst를 통해 변환된 옵져버블만 구독자에게 전달.
 */


let disposeBag = DisposeBag()

let a = BehaviorSubject(value: 1)
let b = BehaviorSubject(value: 2)

let subject = PublishSubject<BehaviorSubject<Int>>()

subject
   .flatMapFirst { $0.asObservable() }
   .subscribe { print($0) }
   .disposed(by: disposeBag)

subject.onNext(a) //a가 처음에 변환되었으니 뒤에 b는 무시된다.
subject.onNext(b) //여기 b는 무시

a.onNext(11)
b.onNext(22)
b.onNext(222)
a.onNext(111)
