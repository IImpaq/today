//
//  EKReminder+Reminder.swift
//  Today
//
//  Created by Marcus Gugacs on 14.09.23.
//

import Foundation
import EventKit

extension EKReminder {
    func update(using reminder: Reminder, in store: EKEventStore) {
        self.title = reminder.title
        self.notes = reminder.notes
        self.isCompleted = reminder.isComplete
        calendar = store.defaultCalendarForNewReminders()
        alarms?.forEach { alarm in
            guard let absoluteDate = alarm.absoluteDate else { return }
            let comparision = Locale.current.calendar.compare(reminder.dueDate,
                                                              to: absoluteDate,
                                                              toGranularity: .minute)
            if comparision != .orderedSame {
                removeAlarm(alarm)
            }
        }
        if !hasAlarms {
            addAlarm(EKAlarm(absoluteDate: reminder.dueDate))
        }
    }
}
