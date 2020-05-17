import UIKit
import RxSwift

/*:
 # zip
 */
//zip: combineLatest과 달리 1:1로 두요소를 결합한다. 짝을 맞춰서 방출한다.

let bag = DisposeBag()

enum MyError: Error {
   case error
}

let numbers = PublishSubject<Int>()
let strings = PublishSubject<String>()



Observable.zip(numbers, strings) {"\($0) \($1)"}
.subscribe{print($0)}
.disposed(by: bag)


numbers.onNext(1)
strings.onNext("one")

numbers.onNext(2) //아직 결합할 짝이 없어서 strings에서 새로운 요소를 방출할때까지 기다린다,
strings.onNext("Two")

numbers.onCompleted()
strings.onNext("three") //numbers가 Completed라서 짝을 맞출수 없어 방출하지 않는다.
