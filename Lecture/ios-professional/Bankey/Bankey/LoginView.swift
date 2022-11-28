//
//  LoginView.swift
//  Bankey
//
//  Created by 지상률 on 2022/10/14.
//

import Foundation
import UIKit

class LoginView: UIView {
    

    
    
    let stackView = UIStackView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let dividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //rough하게 사이즈를 정해주는 역할을 한다. content의 기본 사이즈를 지정해준다.
//    override var intrinsicContentSize: CGSize { //This is used for storyboards(we don't need it)
//        return CGSize(width: 200, height: 200)
//    }
}

//코드의 복잡성을 줄이기 위해 extension을 통해 분할해준다.
extension LoginView {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill
        
        //둥글게 만들어준다.
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    func layout() {
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextField)
        addSubview(stackView)
        
        
//        addSubview(usernameTextField) stackView에 추가했기 때문에 따로 addSubview를 해줄 필요는 없다.
        //LoginView내에서 textField를 가운데에 정렬하는 autoLayout
        NSLayoutConstraint.activate([
            //viewController와 차이점은 view.topAnchor로 접근하지 않아도 topAnchor로 접근가능하다.
            //multiplier를 해줄 떄, top과 leading을 정했다면 trailing과 bottom은 반대로 layout을 추가해준다.
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        //stackview에 추가된 divider는 위의 autolayout을 전부 적용한 다음, 따로 아래의 코드를 추가로 적용한다.
        //다양한 NSLayoutConstraint의 layout과 조합해서 쓸 수 있다.
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true //heightAnchor -> 줄 두께
    }
}

//UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
    // ?
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{ //return키가 눌러졌을 때
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        //키보드이 return 키가 눌렸을 경우, 텍스트 필들에게 작성이 완료되었다는 것을 알려준다.
        return true
    }
    // ?
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool{ //end editing되면 실행되는 callBack함수
        return true
    }
    // ?
    func textFieldDidEndEditing(_ textField: UITextField){
        
    }

}
