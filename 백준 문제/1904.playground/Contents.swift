import UIKit

//********************************
// 01타일, 1904 - (하) 동적 프로그래밍
//********************************

var n = 4

var arr = Array(repeating: 1, count: n+1)
if n >= 2 {
    arr[2] = 2
}
if n >= 3 {
    for i in 3 ..< n+1 {
        arr[i] = (arr[i-1] + arr[i-2]) % 15746 //
    }
}
print(arr[n])


