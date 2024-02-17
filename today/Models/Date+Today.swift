//
//  Date+Today.swift
//  today
//
//  Created by USER on 2024/02/17.
//

import Foundation

extension Date {
    // 日付と時間を表すテキストを返すプロパティ
    var dayAndTimeText: String {
        // 現在の時間を短縮形式で取得（例: "3:45 PM"）
        let timeText = formatted(date: .omitted, time: .shortened)
        // このDateが今日であるかどうかをチェック
        if Locale.current.calendar.isDateInToday(self) {
            // 今日の場合は、"Today at [時間]"の形式で文字列をフォーマット
            let timeFormat = NSLocalizedString("Today at %@", comment: "Today at time format string")
            return String(format: timeFormat, timeText)
        } else {
            // 今日ではない場合は、月と日を短縮形式で取得（例: "Jan 3"）
            let dateText = formatted(.dateTime.month(.abbreviated).day())
            // "月 日 at 時間"の形式で日付と時間をフォーマット
            let dateAndTimeFormat = NSLocalizedString("%@ at %@", comment: "Date and time format string")
            return String(format: dateAndTimeFormat, dateText, timeText)
        }
    }
    // 日付を表すテキストを返すプロパティ
    var dayText: String {
        // このDateが今日であるかどうかをチェック
        if Locale.current.calendar.isDateInToday(self) {
            // 今日の場合は、"Today"という文字列を返す
            return NSLocalizedString("Today", comment: "Today due date desctription")
        } else {
            // 今日ではない場合は、"月 日 曜日"の形式で日付をフォーマット（例: "January 3, Sunday"）
            return formatted(.dateTime.month().day().weekday(.wide))
        }
    }
}
