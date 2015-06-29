//
//  BFSystemSound.swift
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 Fabrizio Brancati. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation
import AudioToolbox

class BFSystemSound
{
    // MARK: - Enums -
    
    enum AudioID : Int
    {
        case NewMail = 1000
        case MailSent = 1001
        case VoiceMail = 1002
        case RecivedMessage = 1003
        case SentMessage = 1004
        case Alarm = 1005
        case LowPower = 1006
        case SMSReceived1 = 1007
        case SMSReceived2 = 1008
        case SMSReceived3 = 1009
        case SMSReceived4 = 1010
        // TODO: Create all IDs
    }
    
    // MARK: - Class functions -
    
    static func playSystemSound(audioID: AudioID)
    {
        AudioServicesPlaySystemSound(SystemSoundID(audioID.rawValue))
    }
    
    static func playSystemSoundVibrate()
    {
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    
    static func playCustomSound(soundURL: NSURL) -> SystemSoundID
    {
        var soundID: SystemSoundID = 0
        
        let error: OSStatus = AudioServicesCreateSystemSoundID(soundURL as CFURLRef, &soundID)
        if error != Int32(kAudioServicesNoError)
        {
            BFLog("Could not load \(soundURL)")
        }
        return soundID
    }
    
    static func disposeSound(soundID: SystemSoundID) -> Bool
    {
        let error: OSStatus = AudioServicesDisposeSystemSoundID(soundID)
        if error != Int32(kAudioServicesNoError)
        {
            BFLog("Error while disposing sound \(soundID)")
            return false
        }
        return true
    }
}
