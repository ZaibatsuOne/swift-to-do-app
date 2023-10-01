import UIKit
import SnapKit
import RealmSwift

class ListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Constants
    private let fullWidth = UIScreen.main.bounds.width
    private let fullHeight = UIScreen.main.bounds.height
    private let realm = try! Realm()
    private var data = [TaskItem]()
   
    //MARK: - UIComponents
    private let profileBackground = UIView()
    private let userName = CustomTitle(text: "Welcome Mary!", colorVariant: .white)
    private let userAvatar = UIImageView()
    private let addTaskButton = UIButton()
    private let table = UITableView()
    
    //MARK: - Table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = data[indexPath.row]
        
        let taskPageVC = TaskPageController()
        navigationController?.pushViewController(taskPageVC, animated: true)
        
        taskPageVC.deletionHandler = { self.refresh() }
        
        taskPageVC.item = item
        
    }
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        data = realm.objects(TaskItem.self).map({ $0 })
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        
        addTaskButton.addTarget(self, action: #selector(handleAddTask), for: .touchUpInside)
        
        UISetup()
    }
    
    //MARK: - UI Setup
    private func UISetup(){
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        view.addSubview(profileBackground)
        view.addSubview(userName)
        view.addSubview(userAvatar)
        view.addSubview(addTaskButton)
        view.addSubview(table)
        
        profileBackground.backgroundColor = UIColor(red: 98/255, green: 210/255, blue: 195/255, alpha: 1)
        
        let thirdScreen = fullHeight / 2.5
        profileBackground.snp.makeConstraints{maker in
            maker.width.equalTo(fullWidth)
            maker.height.equalTo(thirdScreen)}
        
        
        userName.snp.makeConstraints{maker in
            maker.bottom.equalTo(profileBackground).inset(20)
            maker.centerX.equalToSuperview()}
        
        userAvatar.image = UIImage(named: "userImg")
        
        userAvatar.snp.makeConstraints{maker in
            maker.bottom.equalTo(userName).inset(40)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(150)
            maker.height.equalTo(150)}
        
        addTaskButton.setTitle("+ Add task", for: .normal)
        addTaskButton.setTitleColor(.link, for: .normal)
        
        addTaskButton.snp.makeConstraints{maker in
            maker.bottom.equalTo(profileBackground).offset(50)
            maker.right.equalToSuperview().inset(30)}
        
        table.snp.makeConstraints{maker in
            maker.top.equalTo(addTaskButton).inset(50)
            maker.width.equalTo(fullWidth)
            maker.height.equalTo(fullHeight)}
            
        
    }
    
    
    //MARK: - Selectors
    @objc func handleAddTask(){
        let taskScreenVC = TaskController()
        navigationController?.pushViewController(taskScreenVC, animated: true)
        
        taskScreenVC.completitionHandler = { [weak self] in
            self?.refresh()
        }
    }
    
    func refresh(){
        data = realm.objects(TaskItem.self).map({ $0 })
        table.reloadData()
    }
}
