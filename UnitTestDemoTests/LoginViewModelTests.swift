//
//  LoginViewModelTests.swift
//  UnitTestDemoTests
//
//  Created by John Harold Rasco on 5/9/23.
//

import XCTest
@testable import UnitTestDemo

final class LoginViewModelTests: XCTestCase {
  var viewModel: LoginViewModelType!

  override func setUp() {
    super.setUp()

    viewModel = LoginViewModel()
  }

  override func tearDown() {
    viewModel = nil
  }

  func testIsLoggingInFlagIsSetToCorrectState() {
    let expectation = expectation(description: "Log in")

    viewModel.logIn { [weak self] in
      XCTAssertEqual(self?.viewModel.isLoggingIn, false)
      expectation.fulfill()
    }

    XCTAssertEqual(viewModel.isLoggingIn, true)

    wait(for: [expectation], timeout: 2.0)
  }
}
