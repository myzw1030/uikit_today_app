//
//  ViewController.swift
//  today
//
//  Created by USER on 2024/02/17.
//

import UIKit

class ReminderListViewController: UICollectionViewController {

    // UICollectionViewのデータソースを保持する変数
    var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // collectionViewのレイアウトを設定
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)

        // UICollectionViewに表示するデータを提供
        dataSource = DataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            // セルをキューから取得し、設定したレジストレーションを使用してセルを構成
            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        var snapshot = Snapshot()
        // スナップショットにセクション追加
        snapshot.appendSections([0])
        snapshot.appendItems(Reminder.sampleData.map { $0.title})
        dataSource.apply(snapshot)
        // データソースをcollectionViewに割り当てる
        collectionView.dataSource = dataSource
    }
    
    // コレクションビューのリストレイアウトを設定する関数
    private func listLayout() -> UICollectionViewCompositionalLayout {
        // リストの外観や動作に関する設定
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        // セパレーター（区切り線）の表示を無効
        listConfiguration.showsSeparators = false
        // リストの背景色を透明に設定
        listConfiguration.backgroundColor = .clear
        // 設定したリストのレイアウトを返す
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
    
}

