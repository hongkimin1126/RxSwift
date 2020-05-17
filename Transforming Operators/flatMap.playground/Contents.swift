import UIKit
import RxSwift

/*:
 # flatMap: 기존의 옵져버블을 가지고 새로운 옵져버블을 만들때 사용한다.
 */


let disposeBag = DisposeBag()

let a = BehaviorSubject(value: 1)
let b = BehaviorSubject(value: 2)

let subject = PublishSubject<BehaviorSubject<Int>>()

subject
    .flatMap{$0.asObservable()} // flatMap은 새로운 옵져버블을 만들때 사용한다.
    .subscribe{print($0)}
    .disposed(by: disposeBag)

subject.onNext(a)
subject.onNext(b)

a.onNext(11)
a.onNext(22)


// 총 [1, 2, 11, 22] 로 새로운 옵져버블이 생성된다.
