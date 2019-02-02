//
//  MPDClientNotificationHandler.swift
//  Persephone
//
//  Created by Daniel Barber on 2019/2/02.
//  Copyright © 2019 Dan Barber. All rights reserved.
//

import Foundation

class MPDClientNotificationHandler: MPDClientDelegate {
  let notificationQueue = DispatchQueue.main
  
  func didUpdateState(mpdClient: MPDClient, state: MPDClient.State) {
    self.notificationQueue.async {
      NotificationCenter.default.post(
        name: MPDClient.stateChanged,
        object: AppDelegate.mpdClient,
        userInfo: [MPDClient.stateKey: state]
      )
    }
  }
}