//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Maxim P on 17/05/2024.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init( //устанавливает начальные координаты и обычныцй режим
            frame: .zero,
            style: .grouped
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 //              setupView()
        addSubviews()
        
        setupConstraints()
        tuneTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) { //при повторном появлении представления выбранные ячейки в таблице будут сброшены (будут сняты выделения)
        super.viewWillAppear(animated)
        
        tableView.indexPathsForSelectedRows?.forEach{ indexPath in
            tableView.deselectRow(
                at: indexPath,
                animated: animated
            )
        }
    }
    
//        private func setupView() {
//                view.backgroundColor = .systemBackground
//                navigationItem.title = "TableView example"
//                navigationController?.navigationBar.prefersLargeTitles = false
//            }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func tuneTableView() {
        // 2. Настраиваем отображение таблицы
        tableView.rowHeight = UITableView.automaticDimension //высота строк
        tableView.estimatedRowHeight = 55.0 // оценочная высота строк
        
        //            let headerView = ProfileHeaderView()
        //            tableView.addSubview(headerView)
        
        tableView.tableFooterView = UIView()
        
        
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        
        // 4. Указываем основные делегаты таблицы
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // Количество секций в таблице
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Количество строк в секции
        return posts.count
    }
    
    //        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //            // Получение и настройка ячейки для строки
    //            let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
    //            let post = posts[indexPath.row]
    //            cell.configure(with: post)
    //            return cell
    //        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "PostCell",
            for: indexPath
        ) as? PostTableViewCell else {
            fatalError("Unable to dequeue PostTableViewCell")
        }
        // Настраиваем ячейку для отображения поста
        let post = posts[indexPath.row]
        cell.configure(with: post)
        return cell
    }
    
            // Метод для установки заголовка секции
            func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
                let headerView = ProfileHeaderView()
                return headerView
            }
    
            //Метод для установки высоты заголовка секции
            func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
                return 220
            }
    
            //Устанвливаем высоту строк
//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            UITableView.automaticDimension
//        }
    
}


