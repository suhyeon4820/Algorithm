import UIKit
// 시각
/*
 00시 00분 00초부터 n시 59분 59초까지의 모든 시각 중에서 3이 하나라도 포함되는 모든 경우의 수 출력
 // 이 문제는 큰 수부터 생각해야 함 시간이 3이면 아래는 끝나느 거임 분도 마찬가지..ㅜㅜ
 */

let n = 5
var count = 0

let hour = 3600
let minute = 60
let seconds = 15 //11분

for i in 0..<n+1 {
    if (i % 3 == 0) && i != 0 {
        count += hour
        print(i, count)
    } else {
        count += (15*60) + (45*15)
        print(i, count)
    }
}
print(count)
