import UIKit


//********************************
// 새, 1568 - (하) 탐색
//********************************
var n = 14
var k = 1
var num = 0

//while n != 0 {
//    if n >= k {
//        n -= k
//        k += 1
//        num += 1
//    } else {
//        k = 1
//        n -= k
//        k += 1
//        num += 1
//    }
//}
//print(num)
while n != 0 { // 모든 새가 날아갈 때까지
    n -= k
    num += 1
    k += 1
    if n < k {
        k = 1
    }
}
print(num)


