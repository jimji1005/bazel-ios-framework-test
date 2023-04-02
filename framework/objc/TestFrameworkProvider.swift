import Combine
import Foundation
import TestFramework
import UIKit

public struct SwiftStruct {
    public let intValue: Int
    public let floatValue: Float
}

public class TestFrameworkProvider {
    private let testFrameworkController: TestFrameworkController
    private let subject: PassthroughSubject<SwiftStruct, Never> = PassthroughSubject()

    public var output: AnyPublisher<SwiftStruct, Never> {
        subject.eraseToAnyPublisher()
    }

    public init() {
        self.testFrameworkController = TestFrameworkController()

        testFrameworkController.delegate = self
    }

    public func start() {
        testFrameworkController.start()
    }
}

extension TestFrameworkProvider: TestFrameworkControllerDelegate {
    public func controller(
        _ controller: TestFrameworkController,
        didOutputIntValue intValue: Int32,
        andFloatValue floatValue: Float
    ) {
        subject.send(SwiftStruct(intValue: Int(intValue), floatValue: floatValue))
    }
}
