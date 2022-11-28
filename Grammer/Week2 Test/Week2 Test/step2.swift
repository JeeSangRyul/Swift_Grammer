//
//  step1.swift
//  Week2 Test
//
//  Created by 지상률 on 2022/07/26.
//

import Foundation

func makeLottoNumber() -> Set<Int>{
    var lottoNumber : Set<Int> = Set<Int>()
    
    while lottoNumber.count < 6 {
        lottoNumber.insert(Int.random(in: 1...45))
    }
    return lottoNumber
}

func makeLottoHistory(x:Int) -> [Int:Set<Int>]{
    var lottoHistory : [Int:Set<Int>] = [:]
    
    for i in 1...x{
        lottoHistory[i] = makeLottoNumber()
    }
    return lottoHistory
}

func printDictionary(num: Int,someDictionary: [Int:Set<Int>]){
    if let constantValue = someDictionary[num]{
        print("\(num)회차의 로또 당첨 번호는 \(constantValue)입니다.")
    }else{
        print("없는 회차입니다.")
    }
}



let myLottoNumber: [Int] = [1, 2, 3, 4, 5, 6]

func checkLotto() {
    let lottoNumber: Set<Int> = makeLottoNumber()
    print(lottoNumber)
    var correctNumber : [Int] = []
    var number: Int = 0
    
    while number < 6{
        if (lottoNumber.contains(myLottoNumber[number])){
            correctNumber.append(myLottoNumber[number])
        }
        number += 1
        
    }
    if correctNumber.isEmpty{
        print("아쉽지만 겹치는 번호가 없습니다.")
        return
    }
    else{
        print("축하합니다. 겹치는 번호는 \(correctNumber)입니다!")
        return
    }
}

