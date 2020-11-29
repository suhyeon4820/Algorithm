import UIKit

//********************************
// 블랙잭, 2798번 - (하) 배열, 완전탐색
//********************************
let n = 5
let m = 21
let array = [5, 6, 7, 8, 9]

//let n = 10
//let m = 500
//let array = [93, 181, 245, 214, 315, 36, 185, 138, 216, 295]

var sum: [Int] = []
var sums: [Int] = []
for i in 0..<n {
    for j in i+1..<n {
        for k in j+1..<n {
            sum.append(array[i]+array[j]+array[k])
        }
    }
}

for i in 0..<sum.count {
    if sum[i] <= m {
        sums.append(sum[i])
        sums = sums.sorted(by: >)
        
    }
}
print(sums[0])

// 파이썬은 max를 썼다 swift에는 뭐가 있으려나
