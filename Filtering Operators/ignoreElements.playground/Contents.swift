import UIKit
import RxSwift

/*:
 # ignoreElements: 성공과 실패 여부만 알려준다.
 */


let disposeBag = DisposeBag()
let fruits = ["🍏", "🍎", "🍋", "🍓", "🍇"]


Observable.from(fruits)
    .ignoreElements() // 위에 서 무엇을 방출하던지 성공,실패 여부만 알려준다. 이것 때문에 밑에꺼 안타고 completed만 출력됨.
    .subscribe{print($0)}
    .disposed(by: disposeBag)
