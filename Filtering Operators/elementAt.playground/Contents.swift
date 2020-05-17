import UIKit
import RxSwift

/*:
 # elementAt:원하는 요소만 선택해서 방출.
 */


let disposeBag = DisposeBag()
let fruits = ["🍏", "🍎", "🍋", "🍓", "🍇"]


Observable.from(fruits)
    .elementAt(1) // 원하는 요소만 선택해서 방출. 여기서는 1이라서 "🍎"임.
    .asObservable()
    .subscribe{print($0)}
    .disposed(by: disposeBag)
