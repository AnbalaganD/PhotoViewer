//
//  Cache.swift
//  PhotoViewer
//
//  Created by Anbalagan D on 30/09/23.
//

import Foundation

final class Cache: @unchecked Sendable {
    private let dispatchSource = DispatchSource.makeMemoryPressureSource(
        eventMask: [.warning, .critical]
    )

    private var store = [String: Node]()
    private let lock = NSLock()
    private let cost: Int

    private var head: Node?
    private var tail: Node?

    init(cost: Int = .max) {
        self.cost = cost
        monitorMemoryPressure()
    }

    func storeData(data: Data, forKey key: String) {
        lock.withLock {
            let node = Node(value: data, key: key)

            if store.count == cost {
                remove()
            }

            if head == nil {
                store[key] = node
                head = node
                return
            }

            if store[key] == nil {
                store[key] = node

                let temp = head
                head = node
                head?.next = temp
                temp?.previous = head

                if tail == nil {
                    tail = temp
                }
            }
        }
    }

    func retrive(key: String) -> Data? {
        lock.withLock {
            if let node = store[key] {
                arrange(node)
                return node.value
            }
            return nil
        }
    }

    private func arrange(_ node: Node) {
        if node === head { return }

        if node === tail {
            tail = node.previous
        }

        node.previous?.next = node.next
        node.next = head
        head?.previous = node
        node.previous = nil
        head = node
    }

    private func remove() {
        if let node = tail {
            tail = node.previous
            store.removeValue(forKey: node.key)
        }
    }

    private func monitorMemoryPressure() {
        dispatchSource.setEventHandler {[weak self] in
            guard let self else { return }

            if dispatchSource.isCancelled { return }

            switch dispatchSource.data {
            case .critical, .warning: handleMemoryWarning()
            default: break
            }
        }
        dispatchSource.activate()
    }

    private func handleMemoryWarning() {
        lock.withLock {
            store.removeAll()
            head = nil
            tail = nil
        }
    }

    deinit {
        dispatchSource.cancel()
    }
}

extension Cache {
    private final class Node {
        let value: Data
        let key: String
        unowned var next: Node?
        unowned var previous: Node?

        init(
            value: Data,
            key: String,
            next: Node? = nil,
            previous: Node? = nil
        ) {
            self.value = value
            self.key = key
            self.next = next
            self.previous = previous
        }
    }
}

extension Cache {
    static let shared = Cache()
}
