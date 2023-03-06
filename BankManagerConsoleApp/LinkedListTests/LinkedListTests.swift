//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by brody, christy, harry on 2023/03/06.
//

import XCTest

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!

    override func setUpWithError() throws {
        sut = LinkedList<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_LinkedList가비어있을때_appendLast로_5를추가하면_head의값은5이다() {
        // given
        let expectation = 5
        
        // when
        sut.appendLast(value: 5)
        let result = sut.head?.value
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_LinkedList에_노드가있을때_appendLast로_6을추가하면_tail의값은6이다() {
        // given
        sut.appendLast(value: 5)
        let expectation = 6
        
        // when
        sut.appendLast(value: 6)
        let result = sut.tail?.value
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_LinkedList가비어있을때_removeFirst를호출하면_nil을반환한다() {
        // when
        let result = sut.removeFirst()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_LinkedList에_노드가하나있을때_removeFirst를호출하면_head와tail은_nil이다() {
        // given
        let node = Node(value: 5)
        sut = LinkedList<Int>(head: node, tail: node)
        
        // when
        sut.removeFirst()
        let resultHead = sut.head
        let resultTail = sut.tail
    
        // then
        XCTAssertNil(resultHead)
        XCTAssertNil(resultTail)
    }
    
    func test_LinkedList에_5와6이있을때_removeFirst를호출하면_5를반환한다() {
        // given
        let headNode = Node(value: 5)
        let tailNode = Node(value: 6)
        headNode.next = tailNode
        sut = LinkedList<Int>(head: headNode, tail: tailNode)
        let expectation = 5
        
        // when
        let result = sut.removeFirst()
        
        // then
        XCTAssertEqual(result, expectation)
    }
}

