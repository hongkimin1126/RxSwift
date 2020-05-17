import UIKit
import RxSwift

/*:
 # repeatElement: 무한방출
 */

let disposeBag = DisposeBag()
let element = "❤️"

Observable.repeatElement(element)
    .take(7) //repeatElement는 무한반복이기 때문에 take로 제한하지 않으면 무한 루프가 된다.
    .subscribe{print($0)}
    .disposed(by: disposeBag)
