//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by 지상률 on 2022/09/19.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue : String? //전에 있는 viewController가 계산되어야 나오는 결과이기 때문에 ?으로 두었다.
    var advice : String?
    var color : UIColor?
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    override func viewDidLoad() { //로드가 된 후에 버튼을 누르면 해당 화면의 초기화면이 계속해서 바뀌어서 나와야하기 때문에 여기서 선언했다.
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bmiLabel.text = bmiValue // text가 optional타입이라 따로 ?을 붙여주지 않았다
        adviceLabel.text = advice
        view.backgroundColor = color
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }//이전 화면으로 돌아가는 로직이다. 돌아간 뒤에 아무것도 일어나지 않길 바라면 completion에 nil을 넣어주면 된다.
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
