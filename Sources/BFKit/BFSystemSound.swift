//
//  BFSystemSound.swift
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2016 Fabrizio Brancati. All rights reserved.
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

/// This class adds some useful functions to play system sounds
public class BFSystemSound {
    // MARK: - Enums -
    
    /**
     Audio IDs enum - http://iphonedevwiki.net/index.php/AudioServices
    
     - NewMail:                   New Mail
     - MailSent:                  Mail Sent
     - VoiceMail:                 Voice Mail
     - RecivedMessage:            Recived Message
     - SentMessage:               Sent Message
     - Alarm:                     Alarm
     - LowPower:                  Low Power
     - SMSReceived1:              SMS Received 1
     - SMSReceived2:              SMS Received 2
     - SMSReceived3:              SMS Received 3
     - SMSReceived4:              SMS Received 4
     - SMSReceived5:              SMS Received 5
     - SMSReceived6:              SMS Received 6
     - TweetSent:                 Tweet Sent
     - Anticipate:                Anticipate
     - Bloom:                     Bloom
     - Calypso:                   Calypso
     - ChooChoo:                  Choo Choo
     - Descent:                   Descent
     - Fanfare:                   Fanfare
     - Ladder:                    Ladder
     - Minuet:                    Minuet
     - NewsFlash:                 News Flash
     - Noir:                      Noir
     - SherwoodForest:            Sherwood Forest
     - Spell:                     Spell
     - Suspence:                  Suspence
     - Telegraph:                 Telegraph
     - Tiptoes:                   Tiptoes
     - Typewriters:               Typewriters
     - Update:                    Update
     - USSDAlert:                 USSD Alert
     - SIMToolkitCallDropped:     SIM Toolkit Call Dropped
     - SIMToolkitGeneralBeep:     SIM Toolkit General Beep
     - SIMToolkitNegativeACK:     SIM Toolkit Negative ACK
     - SIMToolkitPositiveACK:     SIM Toolkit Positive ACK
     - SIMToolkitSMS:             SIM Toolkit SMS
     - Tink:                      Tink
     - CTBusy:                    CT Busy
     - CTCongestion:              CT Congestion
     - CTPathACK:                 CT Path ACK
     - CTError:                   CT Error
     - CTCallWaiting:             CT Call Waiting
     - CTKeytone:                 CT Keytone
     - Lock:                      Lock
     - Unlock:                    Unlock
     - FailedUnlock:              Failed Unlock
     - KeypressedTink:            Keypressed Tink
     - KeypressedTock:            Keypressed Tock
     - Tock:                      Tock
     - BeepBeep:                  Beep Beep
     - RingerCharged:             Ringer Charged
     - PhotoShutter:              Photo Shutter
     - Shake:                     Shake
     - JBLBegin:                  JBL Begin
     - JBLConfirm:                JBL Confirm
     - JBLCancel:                 JBL Cancel
     - BeginRecording:            Begin Recording
     - EndRecording:              End Recording
     - JBLAmbiguous:              JBL Ambiguous
     - JBLNoMatch:                JBL No Match
     - BeginVideoRecord:          Begin Video Record
     - EndVideoRecord:            End Video Record
     - VCInvitationAccepted:      VC Invitation Accepted
     - VCRinging:                 VC Ringing
     - VCEnded:                   VC Ended
     - VCCallWaiting:             VC Call Waiting
     - VCCallUpgrade:             VC Call Upgrade
     - TouchTone1:                Touch Tone 1
     - TouchTone2:                Touch Tone 2
     - TouchTone3:                Touch Tone 3
     - TouchTone4:                Touch Tone 4
     - TouchTone5:                Touch Tone 5
     - TouchTone6:                Touch Tone 6
     - TouchTone7:                Touch Tone 7
     - TouchTone8:                Touch Tone 8
     - TouchTone9:                Touch Tone 9
     - TouchTone10:               Touch Tone 10
     - TouchToneStar:             Touch Tone Star
     - TouchTonePound:            Touch Tone Pound
     - HeadsetStartCall:          Headset Start Call
     - HeadsetRedial:             Headset Redial
     - HeadsetAnswerCall:         Headset Answer Call
     - HeadsetEndCall:            Headset End Call
     - HeadsetCallWaitingActions: Headset Call Waiting Actions
     - HeadsetTransitionEnd:      Headset Transition End
     - Voicemail:                 Voicemail
     - ReceivedMessage:           Received Message
     - NewMail2:                  New Mail 2
     - MailSent2:                 Mail Sent 2
     - Alarm2:                    Alarm 2
     - Lock2:                     Lock 2
     - Tock2:                     Tock 2
     - SMSReceived1_2:            SMS Received 1_2
     - SMSReceived2_2:            SMS Received 2_2
     - SMSReceived3_2:            SMS Received 3_2
     - SMSReceived4_2:            SMS Received 4_2
     - SMSReceivedVibrate:        SMS Received Vibrate
     - SMSReceived1_3:            SMS Received 1_3
     - SMSReceived5_3:            SMS Received 5_3
     - SMSReceived6_3:            SMS Received 6_3
     - Voicemail2:                Voicemail 2
     - Anticipate2:               Anticipate 2
     - Bloom2:                    Bloom 2
     - Calypso2:                  Calypso 2
     - ChooChoo2:                 Choo Choo 2
     - Descent2:                  Descent 2
     - Fanfare2:                  Fanfare 2
     - Ladder2:                   Ladder 2
     - Minuet2:                   Minuet 2
     - NewsFlash2:                News Flash 2
     - Noir2:                     Noir 2
     - SherwoodForest2:           Sherwood Forest 2
     - Spell2:                    Spell 2
     - Suspence2:                 Suspence 2
     - Telegraph2:                Telegraph 2
     - Tiptoes2:                  Tiptoes 2
     - Typewriters2:              Typewriters 2
     - Update2:                   Update 2
     - RingerVibeChanged:         Ringer Vibe Changed
     - SilentVibeChanged:         Silent Vibe Changed
     - Vibrate:                   Vibrate
     */
    public enum AudioID : Int {
        case newMail = 1000
        case mailSent = 1001
        case voiceMail = 1002
        case recivedMessage = 1003
        case sentMessage = 1004
        case alarm = 1005
        case lowPower = 1006
        case smsReceived1 = 1007
        case smsReceived2 = 1008
        case smsReceived3 = 1009
        case smsReceived4 = 1010
        case smsReceived5 = 1013
        case smsReceived6 = 1014
        case tweetSent = 1016
        case anticipate = 1020
        case bloom = 1021
        case calypso = 1022
        case chooChoo = 1023
        case descent = 1024
        case fanfare = 1025
        case ladder = 1026
        case minuet = 1027
        case newsFlash = 1028
        case noir = 1029
        case sherwoodForest = 1030
        case spell = 1031
        case suspence = 1032
        case telegraph = 1033
        case tiptoes = 1034
        case typewriters = 1035
        case update = 1036
        case ussdAlert = 1050
        case simToolkitCallDropped = 1051
        case simToolkitGeneralBeep = 1052
        case simToolkitNegativeACK = 1053
        case simToolkitPositiveACK = 1054
        case simToolkitSMS = 1055
        case tink = 1057
        case ctBusy = 1070
        case ctCongestion = 1071
        case ctPathACK = 1072
        case ctError = 1073
        case ctCallWaiting = 1074
        case ctKeytone = 1075
        case lock = 1100
        case unlock = 1101
        case failedUnlock = 1102
        case keypressedTink = 1103
        case keypressedTock = 1104
        case tock = 1105
        case beepBeep = 1106
        case ringerCharged = 1107
        case photoShutter = 1108
        case shake = 1109
        case jblBegin = 1110
        case jblConfirm = 1111
        case jblCancel = 1112
        case beginRecording = 1113
        case endRecording = 1114
        case jblAmbiguous = 1115
        case jblNoMatch = 1116
        case beginVideoRecord = 1117
        case endVideoRecord = 1118
        case vcInvitationAccepted = 1150
        case vcRinging = 1151
        case vcEnded = 1152
        case vcCallWaiting = 1153
        case vcCallUpgrade = 1154
        case touchTone1 = 1200
        case touchTone2 = 1201
        case touchTone3 = 1202
        case touchTone4 = 1203
        case touchTone5 = 1204
        case touchTone6 = 1205
        case touchTone7 = 1206
        case touchTone8 = 1207
        case touchTone9 = 1208
        case touchTone10 = 1209
        case touchToneStar = 1210
        case touchTonePound = 1211
        case headsetStartCall = 1254
        case headsetRedial = 1255
        case headsetAnswerCall = 1256
        case headsetEndCall = 1257
        case headsetCallWaitingActions = 1258
        case headsetTransitionEnd = 1259
        case voicemail = 1300
        case receivedMessage = 1301
        case newMail2 = 1302
        case mailSent2 = 1303
        case alarm2 = 1304
        case lock2 = 1305
        case tock2 = 1306
        case smsReceived1_2 = 1307
        case smsReceived2_2 = 1308
        case smsReceived3_2 = 1309
        case smsReceived4_2 = 1310
        case smsReceivedVibrate = 1311
        case smsReceived1_3 = 1312
        case smsReceived5_3 = 1313
        case smsReceived6_3 = 1314
        case voicemail2 = 1315
        case anticipate2 = 1320
        case bloom2 = 1321
        case calypso2 = 1322
        case chooChoo2 = 1323
        case descent2 = 1324
        case fanfare2 = 1325
        case ladder2 = 1326
        case minuet2 = 1327
        case newsFlash2 = 1328
        case noir2 = 1329
        case sherwoodForest2 = 1330
        case spell2 = 1331
        case suspence2 = 1332
        case telegraph2 = 1333
        case tiptoes2 = 1334
        case typewriters2 = 1335
        case update2 = 1336
        case ringerVibeChanged = 1350
        case silentVibeChanged = 1351
        case vibrate = 4095
    }
    
    // MARK: - Class functions -
    
    /**
     Play a system sound from the ID
    
     - parameter audioID: ID of system audio from the AudioID enum
     */
    public static func playSystemSound(_ audioID: AudioID) {
        AudioServicesPlaySystemSound(SystemSoundID(audioID.rawValue))
    }
    
    /**
     Play system sound vibrate
     */
    public static func playSystemSoundVibrate() {
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    
    /**
     Play custom sound with url
    
     - parameter soundURL: Sound URL
    
     - returns: Returns the SystemSoundID
     */
    public static func playCustomSound(_ soundURL: URL) -> SystemSoundID {
        var soundID: SystemSoundID = 0
        
        let error: OSStatus = AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundID)
        if error != Int32(kAudioServicesNoError) {
            BFLog("Could not load \(soundURL)")
        }
        return soundID
    }
    
    /**
     Dispose custom sound
    
     - parameter soundID: SystemSoundID
    
     - returns: Returns true if has been disposed, otherwise false
     */
    public static func disposeSound(_ soundID: SystemSoundID) -> Bool {
        let error: OSStatus = AudioServicesDisposeSystemSoundID(soundID)
        if error != Int32(kAudioServicesNoError) {
            BFLog("Error while disposing sound \(soundID)")
            return false
        }
        return true
    }
}
