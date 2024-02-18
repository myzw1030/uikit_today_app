//
//  ReminderListViewController+DataSource.swift
//  today
//
//  Created by USER on 2024/02/17.
//

import UIKit

extension ReminderListViewController {
    // データソースの型を定義
    typealias DataSource = UICollectionViewDiffableDataSource<Int, Reminder.ID>
    // スナップショット定義
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Reminder.ID>
    
    // セルの表示内容を定義するハンドラー
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: Reminder.ID) {
        // サンプルデータから対応するリマインダーを取得
        let reminder = reminders[indexPath.item]
        // セルのテキストコンテンツ設定
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = reminder.title // リマインダーのタイトルをセルに設定
        contentConfiguration.secondaryText = reminder.dueDate.dayAndTimeText // サブテキストに期限を設定
        contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1) // サブテキストのフォント設定
        cell.contentConfiguration = contentConfiguration // 設定をセルに適用
        // 完了ボタンの設定
        var doneButtonConfiguration = doneButtonConfiguration(for: reminder)
        doneButtonConfiguration.tintColor = .todayListCellDoneButtonTint
        // セルのアクセサリーに完了ボタンとディスクロージャインジケータを追加
        cell.accessories = [
            .customView(configuration: doneButtonConfiguration), .disclosureIndicator(displayed: .always)
        ]
        // セルの背景設定
        var backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
        backgroundConfiguration.backgroundColor = .todayListCellBackground
        cell.backgroundConfiguration = backgroundConfiguration
    }
    // 完了ボタンのカスタムビュー設定を生成
    private func doneButtonConfiguration(for reminder: Reminder) -> UICellAccessory.CustomViewConfiguration {
        let symbolName = reminder.isComplete ? "circle.fill" : "circle" // 完了状態に応じたアイコンを選択
        let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1) // アイコンのスタイル設定
        let image = UIImage(systemName: symbolName, withConfiguration: symbolConfiguration) // アイコン画像を生成
        let button = UIButton() // ボタンを生成
        button.setImage(image, for: .normal) // ボタンにアイコン画像を設定
        // カスタムビュー設定を生成して返す
        return UICellAccessory.CustomViewConfiguration(
            customView: button, placement: .leading(displayed: .always)
        )
    }
}
