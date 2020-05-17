import UIKit
import RxSwift

/*:
 # concat
 */
//concat: 두개의 옵져버블을 연결시에 사용. concat은 합치는 것이 아니고 연결해서 순서대로 실행시키는 것이다.
//중요: merge와 달리 선행된 Observabl이 컴플리트를 리턴해야 합쳐짐.

let bag = DisposeBag()
let fruits = Observable.from(["🍏", "🍎", "🥝", "🍑", "🍋", "🍉"])
let animals = Observable.from(["🐶", "🐱", "🐹", "🐼", "🐯", "🐵"])
let animals2 = Observable.from([1,2,3,4,5])


//타입 메서드방식: collection들을 순서대로 합쳐서 새로운 옵져버블을 생성후에 사용.
Observable.concat([fruits,animals]) //여러 프로퍼티를 합칠시에 사용.
    .subscribe{print($0)}
    .disposed(by: bag)


//인스턴스 메서드방식: 앞의 옵져버블을 실행한훙 컴플리트되면 concat으로 추가한 collection을 실핼.
fruits.concat(animals) //결과는 바로 위와 같다, 두개 프로퍼티 합칠시에 사용.
    .subscribe{print($0)}
    .disposed(by: bag)
