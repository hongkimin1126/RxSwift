import UIKit
import RxSwift

/*:
 # generate
 */

let disposeBag = DisposeBag()
let red = "🔴"
let blue = "🔵"





//0~10까지 2씩 증가되는 함수
Observable.generate(initialState: 0/*시작값*/, condition: { $0 <= 10}, iterate: {$0 + 2/*중가형식*/}).subscribe{print($0)}.disposed(by: disposeBag)


Observable.generate(initialState: red/*시작값*/, condition: { $0.count < 15}, iterate: {$0.count.isMultiple(of: 2) ? $0 + red : $0 + blue /*중가형식*/}).subscribe{print($0)}.disposed(by: disposeBag)
