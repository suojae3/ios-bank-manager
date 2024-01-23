//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by EUNJU on 2024/01/22.
//

import XCTest
@testable import BankManagerConsoleApp

class LinkedListUnitTests<T>: BaseTestCase {
    
    var sut: LinkedList<T>!
    
    override func setUpWithError() throws {
        sut = LinkedList()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
}


final class IntegerLinkedListUnitTests: LinkedListUnitTests<Int> {
    
    var linkedList: LinkedList<Int>!
    var result: Int!
    
    func test_비어있는_링크드리스트에_노드를_추가하면_head가_nil이_아님() {
        given {
            linkedList = LinkedList<Int>()
        }
        
        when {
            linkedList.addBack(1)
        }
        
        then {
            XCTAssert(linkedList.head != nil)
        }
    }
    
    func test_노드를_추가하면_헤드로_첫_노드_데이터인_1이_나옴() {
        given {
            linkedList = LinkedList<Int>()
        }
        
        when {
            linkedList.addBack(1)
            linkedList.addBack(2)
        }
        
        then {
            XCTAssert(linkedList.head?.data == 1)
            
        }
    }
    
    func test_비어있는_링크드리스트의_첫번째_노드를_가져오면_nil이_나옴() {
        given {
            linkedList = LinkedList<Int>()
        }
        
        when {
            result = linkedList.getFirst()
        }
        
        then {
            XCTAssertNil(result)
        }
    }
    
    func test_비어있지_않는_링크드리스트의_첫번째_헤드의_데이터를_가져오면_1이_나옴() {
        given {
            linkedList = LinkedList<Int>()
            linkedList.head = Node(1, nil)
        }
        
        when {
            result = linkedList.getFirst()
        }
        
        then {
            XCTAssert(result == 1)
        }
    }
    
    func test_비어있는_링크드리스트_삭제하면_nil값을_리턴함() {
        given {
            linkedList = LinkedList<Int>()
        }
        
        when {
            result = linkedList.removeFirst()
        }
        
        then {
            XCTAssertNil(result)
        }
    }
    
    func test_비어있지_않은_링크드리스트의_요소를_삭제하면_삭제된_요소를_리턴함() {
        given {
            linkedList = LinkedList<Int>()
            linkedList.head = Node(1, nil)
        }
        
        when {
            result = linkedList.removeFirst()
        }
        
        then {
            XCTAssert(result == 1)
        }
    }
    
    func test_링크드리스트의_요소를_전체삭제하면_헤드가_nil() {
        
        given {
            linkedList = LinkedList<Int>()
            linkedList.head = Node(1, Node(2, nil))
        }
        
        when {
            linkedList.removeAll()
        }
        
        then {
            XCTAssertNil(linkedList.head)
        }
    }
}

final class StringLinkedListUnitTests: LinkedListUnitTests<String> {
    
    var linkedList: LinkedList<String>!
    var result: String!
    
    func test_비어있는_링크드리스트에_노드를_추가하면_head가_nil이_아님() {
        given {
            linkedList = LinkedList<String>()
        }
        
        when {
            linkedList.addBack("가")
        }
        
        then {
            XCTAssertNotNil(linkedList.head)
        }
    }
    
    func test_노드를_여러개_추가하면_마지막_노드_데이터인_나가_나옴() {
        given {
            linkedList = LinkedList<String>()
        }
        
        when {
            linkedList.addBack("가")
            linkedList.addBack("나")
        }
        
        then {
            XCTAssert(linkedList.head?.next?.data == "나")
        }
    }
    
    func test_비어있는_링크드리스트의_첫번째_노드를_가져오면_nil이_나옴() {
        given {
            linkedList = LinkedList<String>()
        }
        
        when {
            result = linkedList.getFirst()
        }
        
        then {
            XCTAssertNil(result)
        }
    }
    
    func test_비어있지_않는_링크드리스트의_첫번째_헤드의_데이터를_가져오면_1이_나옴() {
        given {
            linkedList = LinkedList<String>()
            linkedList.head = Node("가", nil)
        }
        
        when {
            result = linkedList.getFirst()
        }
        
        then {
            XCTAssert(result == "가")
        }
    }
    
    func test_비어있는_링크드리스트_삭제하면_nil값을_리턴함() {
        given {
            linkedList = LinkedList<String>()
        }
        
        when {
            result = linkedList.removeFirst()
        }
        
        then {
            XCTAssertNil(result)
        }
    }
    
    func test_비어있지_않은_링크드리스트의_요소를_삭제하면_삭제된_요소를_리턴함() {
        given {
            linkedList = LinkedList<String>()
            linkedList.head = Node("가", nil)
        }
        
        when {
            result = linkedList.removeFirst()
        }
        
        then {
            XCTAssert(result == "가")
        }
    }

    func test_링크드리스트의_요소를_전체삭제하면_헤드가_nil() {
        given {
            linkedList = LinkedList<String>()
            linkedList.head = Node("가", Node("나", nil))
        }
        
        when {
            linkedList.removeAll()
        }
        
        then {
            XCTAssertNil(linkedList.head)
        }
    }
}
