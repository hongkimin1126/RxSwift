import UIKit
import RxSwift

/*:
 # replay, replayAll
 */

let bag = DisposeBag()
 // replay(<#T##bufferSize: Int##Int#>)최신 이벤트를 지정한 수 만큼 버퍼에 담아 두겠다.
let source = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance).take(5).replay(5)

source
    .subscribe { print("🔵", $0) }
    .disposed(by: bag)


//ReplaySubject 로 이벤트를 담아 두었다가 방출하는데 delaySubscription는 원래 지정된 사간동안 방출까지 지연되지만 결과를 보면 지연전까지 0~2까지 한번에 방출하는것으로 보아서 밑을 connect 영향일것으로 추측이 된다.??
source
    .delaySubscription(.seconds(3), scheduler: MainScheduler.instance)
    .subscribe { print("🔴", $0) }
    .disposed(by: bag)

source.connect()
