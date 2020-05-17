import UIKit
import RxSwift

/*:
 # groupBy: 특정 조건을 그룹으로 묶어서 방출.
 */


let disposeBag = DisposeBag()
let words = ["Apple", "Banana", "Orange", "Book", "City", "Axe"]


Observable.from(words)
    .groupBy {$0.count}
    .subscribe(onNext: { groupedObservable in
        print("== \(groupedObservable.key)")
        groupedObservable.subscribe{print("  \($0)")}
    })
    .disposed(by: disposeBag)
