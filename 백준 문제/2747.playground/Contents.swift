import UIKit

//********************************
// 피보나치 수, 2747 - (하) 재귀 함수
//********************************
let n = 10
var list = [0, 1]
//2...n은 틀리고 2..<n+1은 맞음
for i in 2..<n+1 {
    list.append(list[i-1] + list[i-2])
}
//print(list)
print(list[n])
