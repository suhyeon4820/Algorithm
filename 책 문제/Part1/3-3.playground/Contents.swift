import UIKit

// 1d이 될 때까지
/*
 어떠한 수 N이 1이 될 떄까지 다음 두 과정 중 하나를 반복적으로 수행(단, 두 번재 연산은 N이 K로 나누어 떨어질 때만 선택 가능)
 1. N에서 1을 뺀다
 2. N을 K로 나눈다
 */
//var n = 25
//let k = 5
var n = 17
let k = 4

var count = 0

while n >= 1 {
    if n%k == 0 {
        n = n/k
        count += 1
        print(n, k, count)
    } else {
        n -= 1
        count += 1
        print(n, k, count, "else")
    }
}
//print(count-1)
// 찍어보면 while이면 count가 0인 경우도 발생 그래서 count가 1일때 -1해줌
switch n {
case 1:
    print(count)
case 0:
    print(count-1)
default:
    print("?")
}
