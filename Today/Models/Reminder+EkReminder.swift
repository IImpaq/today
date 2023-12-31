//
//  Reminder+EkReminder.swift
//  Today
//
//  Created by Marcus Gugacs on 14.09.23.
//

import Foundation
import EventKit

extension Reminder {
    init(with ekReminder: EKReminder) throws {
        guard let dueDate = ekReminder.alarms?.first?.absoluteDate else {
            throw TodayError.reminderHasNoDueDate
        }
        self.id = ekReminder.calendarItemIdentifier
        self.title = ekReminder.title
        self.dueDate = dueDate
        self.notes = ekReminder.notes
        self.isComplete = ekReminder.isCompleted
    }
}
