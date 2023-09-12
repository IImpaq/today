//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by Marcus Gugacs on 12.09.23.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(withId: id)
    }
}
