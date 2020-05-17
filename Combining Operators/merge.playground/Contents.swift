import UIKit
import RxSwift

/*:
 # merge
 */
//merge: 여러개의 Observable을 하나로 합쳐서 방출.
// 중요: concat은 합치는 것이 아니고 연결해서 순서대로 실행시키는 것이다. 선행되는 옵져버블이 error을 리턴하면  뒤가 실핼 안됨.

let bag = DisposeBag()

enum MyError: Error {
    case error
}

let oddNumbers = BehaviorSubject(value: 1)
let evenNumbers = BehaviorSubject(value: 2)
let negativeNumbers = BehaviorSubject(value: -1)

let source = Observable.of(oddNumbers, evenNumbers)

source
    .merge()
    //    .merge(maxConcurrent: 2)// 최대 개수를 제한
    .subscribe{print($0)}
    .disposed(by: bag)

oddNumbers.onNext(3)
evenNumbers.onNext(4)

evenNumbers.onNext(5)
oddNumbers.onNext(6)

oddNumbers.onCompleted() // oddNumbers는 Completed라 이벤트를 받을수 없지만 evenNumbers는 받을수있다.
//oddNumbers.onError(MyError.error) // Completed와 달리 Error가 발생하면 그 뒤로는 전부 이벤트를 받을 수없다

evenNumbers.onNext(7)
