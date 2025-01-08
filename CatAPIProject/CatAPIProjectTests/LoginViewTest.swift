//
//  LoginViewTest.swift
//  CatAPIProject
//
//  Created by Patil, Karishma Vikas on 05/11/24.
//

import XCTest
import SwiftUI
@testable import CatAPIProject

class LoginViewTests: XCTestCase {
    var loginView = LoginView()
    
    func testEmptyUsernameAndPassword() {
        self.loginView = LoginView(username: "", password: "", showError: true, errorMessage: "Please enter both username and password.", isPasswordVisible: false, showSuccess: false)
        
        loginView.validateLogin()
        XCTAssertTrue(loginView.showError)
        XCTAssertEqual(loginView.errorMessage, "Please enter both username and password.")
    }
    
    func testInvalidPassword() {
        self.loginView = LoginView(username: "test", password: "short", showError: false, errorMessage: "", isPasswordVisible: false, showSuccess: false)
        
        
        loginView.validateLogin()
        XCTAssertFalse(loginView.showError)
        XCTAssertEqual(loginView.errorMessage, "")
    }
    
    func testValidLogin() {
        self.loginView = LoginView(username: "test", password: "ValidPassword1!", showError: false, errorMessage: "", isPasswordVisible: false, showSuccess: true)
        
        loginView.validateLogin()
        XCTAssertFalse(loginView.showError)
        XCTAssertTrue(loginView.showSuccess)
    }
}
