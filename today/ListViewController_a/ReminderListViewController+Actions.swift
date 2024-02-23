//
//  ReminderListViewController+Actions.swift
//  today
//
//  Created by USER on 2024/02/23.
//

import UIKit

extension ReminderListViewController {
    // ユーザーがボタンをタップしたときに呼び出す関数
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(withId: id)
    }
    
}
