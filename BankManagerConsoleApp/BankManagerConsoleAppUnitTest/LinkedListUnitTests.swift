//
//  LinkedListUnitTests.swift
//  BankManagerConsoleApp
//
//  Created by EUNJU on 2024/01/22.
//

import XCTest
@testable import BankManagerConsoleApp

class LinkedListUnitTests<T>: BaseTestCase {
    
    fileprivate var sut: LinkedList<T>!
    fileprivate var result: T!
    
    override func setUpWithError() throws {
        sut = LinkedList()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
}

// MARK: - LinkedList Integer타입 유닛테스트
final class IntegerLinkedListUnitTests: LinkedListUnitTests<Int> {
    
    func test_링크드리스트가_비어있으면_isEmpty는_true() {
        given {
            sut = LinkedList<Int>()
        }
        
        when {
            sut.head = nil
        }
        
        then {
            XCTAssertTrue(sut.isEmpty)
        }
    }
    
    func test_링크드리스트가_비어있지_않으면_isEmpty는_false() {
        given {
            sut = LinkedList<Int>()
        }
        
        when {
            sut.head = Node(1, nil)
        }
        
        then {
            XCTAssertFalse(sut.isEmpty)
        }
    }
        
    func test_비어있는_링크드리스트에_노드를_추가하면_head가_nil이_아님() {
        given {
            sut = LinkedList<Int>()
        }
        
        when {
            sut.append(1)
        }
        
        then {
            XCTAssert(sut.head != nil)
        }
    }
    
    func test_노드를_추가하면_헤드로_첫_노드_데이터인_1이_나옴() {
        given {
            sut = LinkedList<Int>()
        }
        
        when {
            sut.append(1)
            sut.append(2)
        }
        
        then {
            XCTAssert(sut.head?.data == 1)
        }
    }
    
    func test_비어있는_링크드리스트의_첫번째_노드를_가져오면_nil이_나옴() {
        given {
            sut = LinkedList<Int>()
        }
        
        when {
            result = sut.first
        }
        
        then {
            XCTAssertNil(result)
        }
    }
    
    func test_비어있지_않는_링크드리스트의_첫번째_헤드의_데이터를_가져오면_1이_나옴() {
        given {
            sut = LinkedList<Int>()
            sut.head = Node(1, nil)
        }
        
        when {
            result = sut.first
        }
        
        then {
            XCTAssert(result == 1)
        }
    }
    
    func test_비어있는_링크드리스트_삭제하면_nil값을_리턴함() {
        given {
            sut = LinkedList<Int>()
        }
        
        when {
            result = sut.removeFirst()
        }
        
        then {
            XCTAssertNil(result)
        }
    }
    
    func test_비어있지_않은_링크드리스트의_요소를_삭제하면_삭제된_요소를_리턴함() {
        given {
            sut = LinkedList<Int>()
            sut.head = Node(1, nil)
        }
        
        when {
            result = sut.removeFirst()
        }
        
        then {
            XCTAssert(result == 1)
        }
    }
    
    func test_링크드리스트의_요소를_전체삭제하면_헤드가_nil() {
        given {
            sut = LinkedList<Int>()
            sut.head = Node(1, Node(2, nil))
        }
        
        when {
            sut.removeAll()
        }
        
        then {
            XCTAssertNil(sut.head)
        }
    }
}

// MARK: - LinkedList String타입 유닛테스트
final class StringLinkedListUnitTests: LinkedListUnitTests<String> {
    
    func test_링크드리스트가_비어있으면_isEmpty는_true() {
        given {
            sut = LinkedList<String>()
        }
        
        when {
            sut.head = nil
        }
        
        then {
            XCTAssertTrue(sut.isEmpty)
        }
    }
    
    func test_링크드리스트가_비어있지_않으면_isEmpty는_false() {
        given {
            sut = LinkedList<String>()
        }
        
        when {
            sut.head = Node("가", nil)
        }
        
        then {
            XCTAssertFalse(sut.isEmpty)
        }
    }

    func test_비어있는_링크드리스트에_노드를_추가하면_head가_nil이_아님() {
        given {
            sut = LinkedList<String>()
        }
        
        when {
            sut.append("가")
        }
        
        then {
            XCTAssertNotNil(sut.head)
        }
    }
    
    func test_노드를_여러개_추가하면_마지막_노드_데이터인_나가_나옴() {
        given {
            sut = LinkedList<String>()
        }
        
        when {
            sut.append("가")
            sut.append("나")
        }
        
        then {
            XCTAssert(sut.head?.next?.data == "나")
        }
    }
    
    func test_비어있는_링크드리스트의_첫번째_노드를_가져오면_nil이_나옴() {
        given {
            sut = LinkedList<String>()
        }
        
        when {
            result = sut.first
        }
        
        then {
            XCTAssertNil(result)
        }
    }
    
    func test_비어있지_않는_링크드리스트의_첫번째_헤드의_데이터를_가져오면_1이_나옴() {
        given {
            sut = LinkedList<String>()
            sut.head = Node("가", nil)
        }
        
        when {
            result = sut.first
        }
        
        then {
            XCTAssert(result == "가")
        }
    }
    
    func test_비어있는_링크드리스트_삭제하면_nil값을_리턴함() {
        given {
            sut = LinkedList<String>()
        }
        
        when {
            result = sut.removeFirst()
        }
        
        then {
            XCTAssertNil(result)
        }
    }
    
    func test_비어있지_않은_링크드리스트의_요소를_삭제하면_삭제된_요소를_리턴함() {
        given {
            sut = LinkedList<String>()
            sut.head = Node("가", nil)
        }
        
        when {
            result = sut.removeFirst()
        }
        
        then {
            XCTAssert(result == "가")
        }
    }

    func test_링크드리스트의_요소를_전체삭제하면_헤드가_nil() {
        given {
            sut = LinkedList<String>()
            sut.head = Node("가", Node("나", nil))
        }
        
        when {
            sut.removeAll()
        }
        
        then {
            XCTAssertNil(sut.head)
        }
    }
}
