import UIKit
import RxSwift

/*:
 # delay
 */

//delay와 결과는 같지만 방출은 전부 되고 구독만 지연이 생기지만
//delaySubscription는 방출자체에 지연이 걸리고 구독은 지연이 없다.

let bag = DisposeBag()

func currentTimeString() -> String {
    let f = DateFormatter()
    f.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    return f.string(from: Date())
}


Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
    .take(10)
    .debug()
    .delay(.seconds(5), scheduler: MainScheduler.instance)
    .subscribe{print(currentTimeString(), $0)}
    .disposed(by: bag)
