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

public class BFSystemSound
{
    // MARK: - Enums -
    
    public enum AudioID : Int
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
    
    public static func playSystemSound(audioID: AudioID)
    {
        AudioServicesPlaySystemSound(SystemSoundID(audioID.rawValue))
    }
    
    public static func playSystemSoundVibrate()
    {
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    
    public static func playCustomSound(soundURL: NSURL) -> SystemSoundID
    {
        var soundID: SystemSoundID = 0
        
        let error: OSStatus = AudioServicesCreateSystemSoundID(soundURL as CFURLRef, &soundID)
        if error != Int32(kAudioServicesNoError)
        {
            BFLog("Could not load \(soundURL)")
        }
        return soundID
    }
    
    public static func disposeSound(soundID: SystemSoundID) -> Bool
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
