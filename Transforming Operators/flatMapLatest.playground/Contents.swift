import UIKit
import RxSwift

/*:
 # flatMapLatest: 가장 최근(마지막)에 flatMapLatest를 통해 변환된 옵져버블만 구독자에게 전달.
 */


let disposeBag = DisposeBag()

let a = BehaviorSubject(value: 1)
let b = BehaviorSubject(value: 2)

let subject = PublishSubject<BehaviorSubject<Int>>()

subject
   .flatMapLatest { $0.asObservable() }
   .subscribe { print($0) }
   .disposed(by: disposeBag)

subject.onNext(a)
subject.onNext(b) //가장 마기막에 변환된 옵져버블이 b라서 b만 전담됨 즉 2, 22 만 전달된다.


a.onNext(11)
b.onNext(22)
