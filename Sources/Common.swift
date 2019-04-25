//
//  Common.swift
//  ReDucks
//
//  Created by Omar Abdelhafith on 18/07/2017.
//  Copyright © 2017 Zendesk. All rights reserved.
//

import Foundation
import os


/// Store state is stored as a Dictionary of [StateKey: Any]
public typealias StateKey = String


/// Callback function called when the listener state is changed
public typealias ListenerFunction<Type> = (Type) -> Void

/// Callback function called when the action listener state is changed
public typealias ActionListenerFunction = (Action) -> Void

/// Filter function that decides if the listener should be notified or not
public typealias FilterFunction<StateType> = (StateType, StateType) -> Bool

/// Function that selects part of the full state
public typealias StateSelector<SelectedType> =  (State) -> (SelectedType?)

public typealias KeyedState = [StateKey: Any]

public typealias ReducerFunction<Type> = (Type, Action) -> Type?
public typealias DispatchFunction = (Action) -> Void
public typealias NextFunction = DispatchFunction

public typealias MiddlewareFunction = (Action, GetStateFunction, DispatchFunction, NextFunction) -> Void
public typealias GetStateFunction = () -> State

typealias CallbackId = String

extension Suas {
  // For testing
  static var fatalErrorHandler: (() -> ())? = nil
    
  /// A boolean flag to enable debug logging. Defaults to false.
  public static var enableDebugLogging: Bool = false

  static func log(_ string: @autoclosure () -> String) {
    #if DEBUG
        guard enableDebugLogging else { return }
        #if os(macOS)
            if #available(OSX 10.12, *) {
                os_log("🔼 Suas: %@", string())
            } else {
                print("🔼 Suas: \(string())")
            }
        #elseif os(iOS)
            if #available(iOS 10.0, *) {
                os_log("🔼 Suas: %@", string())
            } else {
                print("🔼 Suas: \(string())")
            }
        #endif
    #endif
  }

  static func fatalError() {
    #if DEBUG
      let fatalError = fatalErrorHandler ?? { Swift.fatalError() }
      fatalError()
    #else
    #endif
  }
}
