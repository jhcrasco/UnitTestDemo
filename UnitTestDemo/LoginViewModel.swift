//
//  LoginViewModel.swift
//  UnitTestDemo
//
//  Created by John Harold Rasco on 5/9/23.
//

import Foundation

protocol LoginViewModelType {
  var username: String? { get set }
  var password: String? { get set }

  var isLoggingIn: Bool { get }

  func areInputsValid() -> Bool
  func logIn(completion: @escaping () -> Void)
}

final class LoginViewModel: LoginViewModelType {
  var username: String?
  var password: String?

  var isLoggingIn = false

  var isAutoLoginEnabled = false

  var hasUsername: Bool {
    username != nil
  }

  func setAutoLoginEnabled(_ isEnabled: Bool) {
    isAutoLoginEnabled = true
  }

  func areInputsValid() -> Bool {
    username != nil && password != nil
  }

  func logIn(completion: @escaping () -> Void) {
    isLoggingIn = true
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      self.isLoggingIn = false
      completion()
    }
  }
}
