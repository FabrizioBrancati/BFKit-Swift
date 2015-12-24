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
        case SMSReceived5 = 1013
        case SMSReceived6 = 1014
        case TweetSent = 1016
        case Anticipate = 1020
        case Bloom = 1021
        case Calypso = 1022
        case ChooChoo = 1023
        case Descent = 1024
        case Fanfare = 1025
        case Ladder = 1026
        case Minuet = 1027
        case NewsFlash = 1028
        case Noir = 1029
        case SherwoodForest = 1030
        case Spell = 1031
        case Suspence = 1032
        case Telegraph = 1033
        case Tiptoes = 1034
        case Typewriters = 1035
        case Update = 1036
        case USSDAlert = 1050
        case SIMToolkitCallDropped = 1051
        case SIMToolkitGeneralBeep = 1052
        case SIMToolkitNegativeACK = 1053
        case SIMToolkitPositiveACK = 1054
        case SIMToolkitSMS = 1055
        case Tink = 1057
        case CTBusy = 1070
        case CTCongestion = 1071
        case CTPathACK = 1072
        case CTError = 1073
        case CTCallWaiting = 1074
        case CTKeytone = 1075
        case Lock = 1100
        case Unlock = 1101
        case FailedUnlock = 1102
        case KeypressedTink = 1103
        case KeypressedTock = 1104
        case Tock = 1105
        case BeepBeep = 1106
        case RingerCharged = 1107
        case PhotoShutter = 1108
        case Shake = 1109
        case JBLBegin = 1110
        case JBLConfirm = 1111
        case JBLCancel = 1112
        case BeginRecording = 1113
        case EndRecording = 1114
        case JBLAmbiguous = 1115
        case JBLNoMatch = 1116
        case BeginVideoRecord = 1117
        case EndVideoRecord = 1118
        case VCInvitationAccepted = 1150
        case VCRinging = 1151
        case VCEnded = 1152
        case VCCallWaiting = 1153
        case VCCallUpgrade = 1154
        case TouchTone1 = 1200
        case TouchTone2 = 1201
        case TouchTone3 = 1202
        case TouchTone4 = 1203
        case TouchTone5 = 1204
        case TouchTone6 = 1205
        case TouchTone7 = 1206
        case TouchTone8 = 1207
        case TouchTone9 = 1208
        case TouchTone10 = 1209
        case TouchToneStar = 1210
        case TouchTonePound = 1211
        case HeadsetStartCall = 1254
        case HeadsetRedial = 1255
        case HeadsetAnswerCall = 1256
        case HeadsetEndCall = 1257
        case HeadsetCallWaitingActions = 1258
        case HeadsetTransitionEnd = 1259
        case Voicemail = 1300
        case ReceivedMessage = 1301
        case NewMail2 = 1302
        case MailSent2 = 1303
        case Alarm2 = 1304
        case Lock2 = 1305
        case Tock2 = 1306
        case SMSReceived1_2 = 1307
        case SMSReceived2_2 = 1308
        case SMSReceived3_2 = 1309
        case SMSReceived4_2 = 1310
        case SMSReceivedVibrate = 1311
        case SMSReceived1_3 = 1312
        case SMSReceived5_3 = 1313
        case SMSReceived6_3 = 1314
        case Voicemail2 = 1315
        case Anticipate2 = 1320
        case Bloom2 = 1321
        case Calypso2 = 1322
        case ChooChoo2 = 1323
        case Descent2 = 1324
        case Fanfare2 = 1325
        case Ladder2 = 1326
        case Minuet2 = 1327
        case NewsFlash2 = 1328
        case Noir2 = 1329
        case SherwoodForest2 = 1330
        case Spell2 = 1331
        case Suspence2 = 1332
        case Telegraph2 = 1333
        case Tiptoes2 = 1334
        case Typewriters2 = 1335
        case Update2 = 1336
        case RingerVibeChanged = 1350
        case SilentVibeChanged = 1351
        case Vibrate = 4095
    }
    
    // MARK: - Class functions -
    
    /**
     Play a system sound from the ID
    
     - parameter audioID: ID of system audio from the AudioID enum
     */
    public static func playSystemSound(audioID: AudioID) {
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
    public static func playCustomSound(soundURL: NSURL) -> SystemSoundID {
        var soundID: SystemSoundID = 0
        
        let error: OSStatus = AudioServicesCreateSystemSoundID(soundURL as CFURLRef, &soundID)
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
    public static func disposeSound(soundID: SystemSoundID) -> Bool {
        let error: OSStatus = AudioServicesDisposeSystemSoundID(soundID)
        if error != Int32(kAudioServicesNoError) {
            BFLog("Error while disposing sound \(soundID)")
            return false
        }
        return true
    }
}
