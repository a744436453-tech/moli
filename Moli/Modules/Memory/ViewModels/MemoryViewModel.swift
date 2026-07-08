import Foundation

final class MemoryViewModel {
    private(set) var memories: [MemoryModel] = []

    func add(_ memory: MemoryModel) {
        memories.append(memory)
    }
}
