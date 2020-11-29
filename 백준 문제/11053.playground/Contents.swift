import UIKit

//********************************
// 가장 긴 증가하는 부분 수열, 11053 - (하) 동적 프로그래밍, LIS
//********************************
/*
 - D[i] = array[i]를 마지막 원소로 가지는 부분 수열의 최대 길이
 - 모든 0<= j < i에 대하여, D[i] = max(D[i], D[j] + 1) if array[i] < array[j]
 */

let n = 6
let list = [10, 20, 10, 30, 20, 50]
var newList = [Int](repeating: 1, count: n)
var count = 0

for i in 0..<n {
    for j in 0..<i {
        if list[i] > list[j] {
            newList[i] = max(newList[i], newList[j]+1)
        }
    }
}
print(newList)
print(newList.max()!)
