//
//  ReminderListViewController+DataSource.swift
//  today
//
//  Created by USER on 2024/02/17.
//

import UIKit

extension ReminderListViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
}
