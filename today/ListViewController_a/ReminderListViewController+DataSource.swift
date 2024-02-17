//
//  ReminderListViewController+DataSource.swift
//  today
//
//  Created by USER on 2024/02/17.
//

import UIKit

extension ReminderListViewController {
    // データソースの型を定義
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    // スナップショット定義
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
    // リストのセルにどのように表示するかを登録
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: String) {
        // サンプルデータからリマインダーの情報を取得
        let reminder = Reminder.sampleData[indexPath.item]
        // セルのコンテンツ設定
        var contentConfiguration = cell.defaultContentConfiguration()
        // リマインダーのタイトルをセルに設定
        contentConfiguration.text = reminder.title
        // リマインダー期限をコンテンツ設定のセカンダリテキストに
        contentConfiguration.secondaryText = reminder.dueDate.dayAndTimeText
        // 二次テキスト
        contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
        // 設定したコンテンツをセルに適用
        cell.contentConfiguration = contentConfiguration
    }
}
