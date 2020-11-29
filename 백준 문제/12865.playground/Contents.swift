import UIKit

//********************************
// 평범한 배낭, 12865 - (하) 동적 프로그래밍
//********************************
/*
 - 핵심 아이디어 : 모든 무게에 대해 최대 가치를 저장
 - D[i][j] = D[i-1][j]                             -> j < W[i]
           = max(D[i-1][j], D[i-1][j-W[i]] + v[i]) -> j >= W[i]
 */
let n = 4
let k = 10

var list = [[6, 13], [4, 8], [3, 6], [5, 12]]

var weight = [Int]()
var value = [Int](repeating: 0, count: n)
var result = [Int](repeating: 0, count: n)
print(weight)

for i in 0..<n {
    weight.append(list[i][0])
    value.append(list[i][1])
}
print(weight)

for i in 0..<n {
    var j = k
    while j >= weight[i] {
        result[j] = max(result[j], result[j-weight[i]] + value[i])
        j -= 1
    }
}
print(result[k])


