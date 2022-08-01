//
//  LoginViewTests.swift
//  LoginTests
//
//  Created by Natanael Alves Pereira on 01/08/22.
//

import XCTest
@testable import Login

class LoginViewTest: XCTestCase {
    
    // MARK: - Properties
    
    var sut: LoginView!
    
    // MARK: - Overrides
    
    override func setUp() {
        super.setUp()
        setupLoginViewTest()
    }
    
    // MARK: - Propeties
    
    func setupLoginViewTest() {
        let viewController = LoginViewController()
        sut = viewController.view as? LoginView
    }
    
    // MARK: - buttonOpenTapSucess
    
    func testbuttonOpenTapSucess() {
        
        //Given
        
        var emailReturned = ""
        var passwordReturned = ""
        var returned = [""]
        
        let textFieldEmail: LabelTextDefault = sut.emailField
        textFieldEmail.textField.text = "teste@gmail.com"
        
        let textFieldPass: LabelTextDefault = sut.passwordField
        textFieldPass.textField.text = "Teste@433"
        
        sut.onTapOpen = { email, password in
            emailReturned = email
            passwordReturned = password
            
            returned = [emailReturned , passwordReturned]
        }
        
        //When
        
        sut.buttonOpenTap()
        
        //Then
        XCTAssertFalse(emailReturned.isEmpty)
        XCTAssertFalse(passwordReturned.isEmpty)
        XCTAssertEqual(2, returned.count)
        XCTAssertEqual(emailReturned, "teste@gmail.com")
        
    }
    
    // MARK: - buttonOpenTapFailure
    
    func testbuttonOpenTapFailure() {
        
        //Given
        
        var emailReturned = ""
        var passwordReturned = ""
        var didCallonPasswordWrong = false
        
        let textFieldEmail: LabelTextDefault = sut.emailField
        textFieldEmail.textField.text = "teste@gmail.com"
        
        let textFieldPass: LabelTextDefault = sut.passwordField
        textFieldPass.textField.text = "Teste"
        
        let colorRed = UIColor.red.cgColor
        
        sut.onTapOpen = { email, password in
            emailReturned = email
            passwordReturned = password
            
        }
        
        sut.onPasswordWrong = {
            didCallonPasswordWrong = true
        }
        
        //When
        
        sut.buttonOpenTap()
        
        //Then
        XCTAssertTrue(emailReturned.isEmpty)
        XCTAssertTrue(passwordReturned.isEmpty)
        XCTAssertTrue(didCallonPasswordWrong)
        XCTAssertEqual(colorRed, textFieldPass.textField.layer.borderColor)
        
    }
    
    // MARK: - ChangePasswordVisibility
    
    func testChangePasswordVisibilityOn(){
        // Given
        
        let rightButton = UIButton()
        
        // When
        
        sut.changePasswordVisibility(rightButton)
        
        // Then
        
        XCTAssertFalse(sut.passwordField.textField.isSecureTextEntry)
        
    }
    
    func testChangePasswordVisibilityOff(){
        // Given
        
        let rightButton = UIButton()
        sut.passwordField.textField.isSecureTextEntry = false
        
        // When
        
        sut.changePasswordVisibility(rightButton)
        
        // Then
        
        XCTAssertTrue(sut.passwordField.textField.isSecureTextEntry)
        
    }
    
    // MARK: - ButtonRegisterTap
    
    func testbuttonRegisterTap(){
        
        // Given
        
        var didCallButtonRegisterTap = false
        
        sut.onTapRegister = {
            didCallButtonRegisterTap = true
        }
        
        // When
        
        sut.buttonRegisterTap()
        
        // Then
        
        XCTAssertTrue(didCallButtonRegisterTap)
    }
}
