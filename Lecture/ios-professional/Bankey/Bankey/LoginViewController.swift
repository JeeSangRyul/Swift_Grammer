//
//  ViewController.swift
//  Bankey
//
//  Created by 지상률 on 2022/10/04.
//

import UIKit

//view를 가지고와서 viewController에서 수정해준다.

class LoginViewController: UIViewController {
    
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    var username: String? {
        return loginView.usernameTextField.text
    }
    var password: String? {
        return loginView.passwordTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        style()
        layout()
    }
}

extension LoginViewController {
    private func style(){
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.text = "Bankey"
        
        
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.textAlignment = .center
        subTitleLabel.text = "Your premium source for all things banking!"

        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled() //button style
        signInButton.configuration?.imagePadding = 8 //image와 title사이에 padding을 주는 구문
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center //center line
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0// no multiline
        errorMessageLabel.text = "Error failure"
        errorMessageLabel.isHidden = true
    }
    
    private func layout(){
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)

        //MARK: title
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            //title의 bottom을 기준으로 3밑에 subTitle이 있다는 뜻
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
//        MARK: subtitle
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subTitleLabel.bottomAnchor, multiplier: 2),
            subTitleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            
        ])


        
        //MARK: LoginView
        NSLayoutConstraint.activate([
            //loginView의 위치를 view의 centerYAnchor에 두겠다.
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            //loginView의 왼쪽을 view의 leading에서 8px정도 떨어진 거리에 두겠다.
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1), //multiplier = 1 -> 8px
            //multiplier를 쓸경우 trailing의 layout은 leading의 뒤집어서 생각해야한다. 왜 그런지는 모르겠다(???)
            //이거에 대한 답변? -> equalToSystemSpacingAfter / Below : 여기에 적힌 anchor를 기준으로 어디에 둘지를 보는 것이다.
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
        ])

        //MARK: signInButton
        NSLayoutConstraint.activate([
            //LoginView의 layout이 이미 잡혀있기 때문에 또 잡아줄 필요는 없다.
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        //MARK: errorMessage
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
    
}

extension LoginViewController {
    @objc func signInTapped(sender: UIButton){
        errorMessageLabel.isHidden = true //기본적으로 보이지 않게 설정
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / password cannot be blank")
            return
        }
        
        if username == "Kevin" || password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true //loading motion보여주기
        } else {
            configureView(withMessage: "Incorrect username / password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
