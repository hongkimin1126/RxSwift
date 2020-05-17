import UIKit
import RxSwift

/*:
 # takeLast: 맨 뒤에서 부터 지정한 count만큼 Completed 호출후 방출,
 */

let disposeBag = DisposeBag()
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


let subject = PublishSubject<Int>()

subject.takeLast(2) // 뒤에서 부터 2개 여기서는 9,10 방출
    .subscribe{print($0)}
    .disposed(by: disposeBag)

numbers.forEach{subject.onNext($0)}

subject.onNext(11) //이것 때문에 지연 되서 10,11로 방출이 변경됨

subject.onCompleted() // 10,11,completed 출력됨.
