import Foundation

final class MemoryTimelineViewModel {
    private(set) var memories: [MemoryEntry] = []

    func add(_ memory: MemoryEntry) {
        memories.append(memory)
    }
}
