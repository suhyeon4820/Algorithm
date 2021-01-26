import UIKit

// 8-1 1로 만들기
/*
 정수 x가 주어질 때 정수 x에 사용할 수 있는 연산은 4가지
 - x - 1
 - x가 5로 나누어 떨어지면, 5로 나누기
 - x가 3로 나누어 떨어지면, 3로 나누기
 - x가 2로 나누어 떨어지면, 2로 나누기
 */

//let X = 26
//var count = 0
//
//func makeOne(_ x: Int) {
//
//        if (x % 5 == 0) {
//            x == x/5
//            count += 1
//        } else if (x % 3 == 0) {
//            x == x/3
//            count += 1
//        } else if (x % 2 == 0) {
//            x == x/2
//            count += 1
//        }
////        if (x >= 2) {
////            x = x - 1
////            count += 1
////        }
//        print(count)
//}
//makeOne(X)

let list = [Int]()
print(list.count)

let a = 3
let b = 5

func solution(_ a:Int, _ b:Int) -> Int64 {
    var result = 0
    if (a > b) {
        result = ((abs(a-b)+1) * (a+b))/2
    } else if a < b {
        result = ((abs(a-b)+1) * (a+b))/2
    } else {
        result = a
    }
    return Int64(result)
}
solution(a, b)
