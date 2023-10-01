import RealmSwift

class TaskItem: Object{
    @objc dynamic var name: String = ""
    @objc dynamic var isCompleted: Bool = false
}
