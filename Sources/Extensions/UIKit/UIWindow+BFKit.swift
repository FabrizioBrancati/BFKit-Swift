//
//  UIWindow+BFKit.swift
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
import UIKit

// MARK: - Private variables -

/// Private, touch images dictionary
private var touchImages: Dictionary<Int, UIImageView> = [:]

/// Private, set if sendEvent: has been exchanged
private var sendEventExchanged: Bool = false

// MARK: - Global functions -

/**
 Show touch on screen
 */
public func BFShowTouchOnScreen() {
    UIApplication.shared.keyWindow!.activateTouch()
}

/**
 Hide touch on screen
 */
public func BFHideTouchOnScreen() {
    UIApplication.shared.keyWindow!.deactivateTouch()
}

/// This extesion adds some useful functions to UIWindow
public extension UIWindow {
    // MARK: - Instance functions -
    
    /**
     Take a screenshot of current window and choose if save it or not
    
     - parameter save: true to save, false to don't save
    
     - returns: Returns the screenshot as an UIImage
     */
    public func takeScreenshot(save: Bool = false) -> UIImage {
        let ignoreOrientation: Bool = SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO("8.0")
        
        let orientation: UIInterfaceOrientation = UIApplication.shared.statusBarOrientation
        
        var imageSize: CGSize = CGSize.zero
        if UIInterfaceOrientationIsPortrait(orientation) || ignoreOrientation {
            imageSize = UIScreen.main.bounds.size
        } else {
            imageSize = CGSize(width: UIScreen.main.bounds.size.height, height: UIScreen.main.bounds.size.width)
        }
        
        UIGraphicsBeginImageContextWithOptions(imageSize, false, UIScreen.main.scale)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.saveGState()
        context.translateBy(x: self.center.x, y: self.center.y)
        context.concatenate(self.transform)
        context.translateBy(x: -self.bounds.size.width * self.layer.anchorPoint.x, y: -self.bounds.size.height * self.layer.anchorPoint.y)
        
        if !ignoreOrientation {
            if orientation == .landscapeLeft {
                context.rotate(by: CGFloat(M_PI_2))
                context.translateBy(x: 0, y: -imageSize.width)
            } else if orientation == .landscapeRight {
                context.rotate(by: CGFloat(-M_PI_2))
                context.translateBy(x: -imageSize.height, y: 0)
            } else if orientation == .portraitUpsideDown {
                context.rotate(by: CGFloat(M_PI))
                context.translateBy(x: -imageSize.width, y: -imageSize.height)
            }
        }
        
        if self.responds(to: #selector(UIView.drawHierarchy(in:afterScreenUpdates:))) {
            self.drawHierarchy(in: self.bounds, afterScreenUpdates: false)
        } else {
            self.layer.render(in: UIGraphicsGetCurrentContext()!)
        }
        
        context.restoreGState()
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        if save {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
        
        return image
    }
    
    /**
     Take a screenshot of current window, choose if save it or not after a delay
    
     - parameter delay:      The delay, in seconds
     - parameter save:       true to save, false to don't save
     - parameter completion: Completion handler with the UIImage
     */
    public func takeScreenshotWithDelay(_ delay: Double, save: Bool, completion: @escaping (_ screeshot: UIImage) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
            completion(self.takeScreenshot(save: save))
        })
    }
    
    /**
     Private, show touch on screen
     */
    public func activateTouch() {
        if sendEventExchanged {
            return
        }
        
        let sendEvent = class_getInstanceMethod(object_getClass(self), #selector(UIApplication.sendEvent(_:)))
        let exchangedSendEvent = class_getInstanceMethod(object_getClass(self), #selector(UIWindow.exchangedSendEvent(_:)))
        method_exchangeImplementations(sendEvent, exchangedSendEvent)
        
        sendEventExchanged = true
    }
    
    /**
     Private, hide touch on screen
     */
    public func deactivateTouch() {
        if !sendEventExchanged {
            return
        }
        
        let sendEvent = class_getInstanceMethod(object_getClass(self), #selector(UIApplication.sendEvent(_:)))
        let exchangedSendEvent = class_getInstanceMethod(object_getClass(self), #selector(UIWindow.exchangedSendEvent(_:)))
        method_exchangeImplementations(exchangedSendEvent, sendEvent)
        
        sendEventExchanged = false
    }
    
    /**
     This function is used when touch is visible on screen.
    
     N.B.: Never call it directly
    
     - parameter event: UIEvent
     */
    @objc private func exchangedSendEvent(_ event: UIEvent) {
        self.handleEvent(event)
        exchangedSendEvent(event)
    }
    
    /**
     Private, is used to handle the event
    
     - parameter event: UIEvent
     */
    private func handleEvent(_ event: UIEvent) {
        if event.type != .touches {
            return
        }
        
        for touch in event.allTouches! {
            let phase = touch.phase
            
            switch phase {
            case .began:
                let touchImageView: UIImageView = UIImageView(image: self.touchImage())
                touchImageView.center = touch.location(in: self)
                self.addSubview(touchImageView)
                
                touchImages[touch.hash] = touchImageView
                
                touchImageView.alpha = 0.0
                touchImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                
                UIView.animate(withDuration: 0.2, animations: {
                    touchImageView.alpha = 1.0
                    touchImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
            case .moved, .stationary:
                let touchImageView: UIImageView = touchImages[touch.hash]!
                
                touchImageView.center = touch.location(in: self)
            case .ended, .cancelled:
                let touchImageView: UIImageView = touchImages[touch.hash]!
                
                UIView.animate(withDuration: 0.2, animations: {
                    touchImageView.alpha = 0.0
                    touchImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                }, completion: { (finished) -> Void in
                    if finished {
                        touchImageView.removeFromSuperview()
                        touchImageView.alpha = 1.0
                        touchImages.removeValue(forKey: touch.hash)
                    }
                })
            }
        }
    }
    
    /**
     Private, returns the Touch image
    
     - returns: Returns the Touch image
     */
    private func touchImage() -> UIImage {
        let image: UIImage = UIImage(data: Data(base64Encoded: "iVBORw0KGgoAAAANSUhEUgAAAFgAAABYCAYAAABxlTA0AAAAAXNSR0IArs4c6QAAAAlwSFlzAAAWJQAAFiUBSVIk8AAAABxpRE9UAAAAAgAAAAAAAAAsAAAAKAAAACwAAAAsAAATXZR3MtcAABMpSURBVHgBzJtNb2TFFYYnH0p+QcQCsU6UHRLZwSYbViwiNmQXkQVSFiCxyCISoxFsRqMxbmwZGzs2btq+xnTbxqaNLXvBTyPv855z6t6e8YwmzAeYVO5H37636qm33nOqbs+tW7+Qvx9//PFX4/H45a+++uo1lbcmk8l7e3t7t7W9q+PPVL7QfkfR+f2u6yYq46+//vq/08Ppp0dHR/8+Pj5+5/T09NU7d+78+hfSrJ+3Gjs7O68I3JsC+6GhHXTddDrtjo9PurOzs+78/Ly7uLzoLi+vuqurKNfXV92lytXlZXdxceFruPb45NjfFXR3gMB/PpvNPhDw137eVr7gp29tbb0kFb6dCuwEoZvP5wZ2fX3dUS69FUhBNVzBvKxydelrOX+pfc5fX+ucrgU+32d/fjb3vQGuv4k67qNvv/32zy+4uS/mcQxZKfX18WR8R0qVQo+lPsAAQ1AbNAGTKi/12eV5r9DzCylZakbRrXCOIoVfnPMdlE7Rd+kYQb82dHWYPueZPPvg4GBb++9+8803v3kxrX+OT/nhhx9+K7B/RUGHh4fduZQ6VCkwAHQuODXc5+dzK3p+fmabYPg/ssz1me7Jfc/nCV9bd4bgB3QUL0tJdZ/r/tSFOsm3//X999///jkieH63lg28sb+/v4enokCG71UO6QvASlWocS4gQF2AeHLanZycdPLP7oSi/Sqn3j/tTn2Ntvr89ORM1+n66owGPmDTeUMvp5OpE3Wjjrr3P58fiWd8ZwKXhuJtDUWrMhSLlzLka4iH4gz19CxgDUFqOJ8o0BG4CHgB97ibDUD7cz7jWq7TZ5TWAQl7zlbAm8LTRq7s89euI3UlG/lFB0Q8Tar9Oz4HuPDXCEgFFrUypPkctZUqDUiwCHh45fHxrJtRBG4207HOz3Sezzn2Z74uOuA4r6FD+IxtgI/OObO6Tx34CKiMHHs1fi37oK7UibrLNj5WW373jHX3dLdThf6gyn3CkLtW0CKKU3H7K4GpgWW490O+AQGW4Q1BAnNQCvqD5xJ6dEL/fTqKziiF05mnCfpMGQa2BGhbB0FWFkb2Qhuk6C+l5j8+HZVn9G2B/Yt8bB8vRAlOn6QMR3uphSF6ig0MLIBhjzoLQoM7hFf70wHkx52rz7Tt70fHBWirnGdiM/i2CnWbA9lZCGqOzOb07BRv3lf93nlGmH7abTRB+BvhmCCCpzkvTZ+1vwKXBrkwfHMI5/Duh/0Q4rSbCtIUsFJT7fsYiJwz9GkoXMezOr6pMwp8PfNkFvXBvwU56hmxodTMKCSz4W96dPSfn0bnKb7FtFbp1z8IDuSc5LHODICLHQjsmVTQ7ECNY6jaOwcNns0CIFYw9T7wCmqADMC5nzB9jUEDub4ToOP7Bb3vuFK1/V3PC0XT+apngsY2rGa8GZtTu2jj9Gh694VNvzO3ff/wcGqvvVJCz9CyJRhsbwc1PFvwKrhsBwoNVQ4AJbwhSPZ5prd87v3D6JCHrmcERKc0H7e6sQs9m0DoDqfja4SR5mEbkdrRpqvLiCc8V1nG6nPPmVO571N5LMHrAUwU5GMEDiqIHThlYkgm0Nr2ja3GB7AhPINRg2jU4fTQZXogkChJEwSf0/ZAn3EM6LZf5xL4Yif2ao4sJCAH6EgJ+1w6A6BmlExSmBFSLyA/VyVjCzTIcBlC8ingEixOFMjstRnArNqhYlO1+KftICFMDQWgAYwt5cDlILYCzPHh4UF3qH22DF1KHft7HPu67Dj2/ZwYMfXc1tGqUwAeWoYWmmQb2Bx2F+kcqdyV7u373n0Kd330VwloNMirWoMUjCQ+ZlUaalXhylUHgPtgFY2n4W68FShYU4AJZIJb3A+YnVbb+s/7/cP2HQCH0uk47ukRQSe2Dh0o2fWLkcYoA7azDI3CsIuELCHhybSd5x9Nn3HgIxUjohbc8lxsoZQbkwMqmz43gGvFZAMDaqpUlUWBPbQEKZJiqT8T9VaX+hzX6gusSXoT5+N7w/sAPZQO3FJyD7pU3LITALuoDQLNaGSCYiWTymEXQJa4+NM1zyaFYxJBTkgqdqn0hQfZFqTcZgmqGOpdyBJ0XEPStmDAqEqNVeNDoQO4hgo4lU7wVIDIf/wxy4ri03k+z/EV8Ou7AI+OoR8G4GUXUywmhnmvaOqtTMSF4Od2ADnSOXJ4lj5pM2kcExJYwOS7777706PH/BN8wvRXjfqkn0QkXAe0AqzezmTe01hXOKN4plAEJoboAXYw8M8AAA4w6v8Toki1/ToXW73NmOgzF7/ZuOE6+NI5Ij0ErP1QdVhTeHN6tVPEsI4agVZxQibljCl2LIcCGfCq/5dPNa1mbQEwMUOr2VmfhpHbtrxSlWl5LWpVpRfsgICTDbbMaL9YgNb/NYXu6bWQio5jC0jAxuuiyWSs/XF8rvMTPuPaLO1euiv/C1WXksOanJVY0QlY9cUyIgAHaCZBzpXLLhT05hq1HsmyCQI9bI6Oph8/gVYfviRXxbxw7XUFLYCzllqLNC0Vc0WyUqiXLAHAKk61iPr22bADYxVo0wUtHAwJWDoW3PEYuONOC/SxHWt/PFHJYz7jXF7jfX1Oh3Av34d7UYIyDxlYRtTp8ED1xDJsG1H38uayO/uyZ6JkFihZkynnyEC+8jM0wv//11Kq3G0M3u/AWq4bU99YRqygMISbYIHrAlSVtAWUixXQWP9nIMAETkIzzAf3d7vxrs65xP6urtvd1X5ePwGwoce9fM9UN6D10HANPb+82WlfiqFE4WwnbQ7YzixmlSdH+sb6BW9dYAMjljofluhjzqhyb1AJW4Omi+daDHHG4IlEric4Feszhn5KC+S0gwf8Vq0MVaVqbQGpzALFFnCUnZ1xt2OIOt7RcTun875O1+q8QVcH6LxB6769V4eNwPnAgRBz0r6D3g2BD+hDyBljWFbFe2FB0GMqDSNYKeA/2aI9U2EFyL3IGoiYl/HGoSYSrEjRs5mORZoTyrUtDJWrB/Pw9IOEKyXlUB5LuUOwKDSA7QguBai1f/N2l+u4RmWs6+N+tY2RYOuI1/0MHpuGAeNU1FF+7IlMBmPaEZnFYHSqvS19w4+dupFZ8SLBWcXeE02leYfGA4aBLfLdUz1AQ2WQypRflXojqBGtw29deVpSlsCWYWuwBRcFpmoB6iJg25TtbhuA2nK8TRkc7+zweV4z6IhQtO6LZVDwcj0b27AvQxnMCdjBlyBsP34gV1ZMKUG1oDfIj71mofQVZrzje4wx3LrFPFtPnmAJ7hltyQEZFs55sxcbWAe0Pqh59pSqNVw1IDwXxjQOqGpoNXyM0gTQao0twAx2S+AEdGt7S0X7W9q6bGurovPbbHdia/B1H8MO9dty/DyeHXWIEQRk/RmyNrYLICfgTDGrrbGNCQgsSF09lRYjJiC849PfhNT2kZCl3tdZQEG9zFjwGUycGzI8Fh8msM4fKx3zm4AWQFxzPRHFOKqrkSioLMEea0tIwEC0UmNrsAl1c7Pg3rClA3QdsLeBreO+wxgdsg48vXWq0rwKfgS+VHKv5gDMaGSV78E2k76RngIYNrzBLi+mc8Tp3UcC5ncLpGLA5TcGZ0PAgrwwkSAIVEpGr6uEapFEgDVc/FYF1VIq+uOZ9k8P8QBjZRZUtgK7sbnZbWxsdJtbm92mtuxzbovzBh/7oe4AvZWjoED7OYwWAiGg1dG2DFuW6kqcGIy8WLWruIIPR9CzVZCWAlk8zjSyy4tZ2mQ9WQy2bwSsCr4EkPJeegbv9RsJvDdTltajBVe93Fa+qKj+2jTXDZBqaRBwMyOowGVPtbfGkA9IArkpoAK4uRFwDbXgDreGH9dvqENQOt8rC9mxomOEALllG4ZMPMiCkWn2VwKhPZEbB2QrWe2l7XDwejI2AWTeWLOMoNwYdtzzxl8Qafi+jfQL8NAePKvxTC0eEmsL6b0KDAyNVjkjXlSwfdCBLLIElBWeKZXKFkp9m1sCOwTI/vp6t76+0a1vrGtfWxWAr+t8Dx4198oGNPe0bcg6CIal5rFSP+rjOLAXtmXQQOY/xIwfk2pKPAQvZxVpFwZMLFJuzPqxVax3jw52AswcQdd/9JCKxWVSv4QBLsHt7CwS7ErJSr2VNfDgRfVau/Y1V3phpoWCy28VvNRoIBgGyhuodd1gN7o1YK6tabsmoGzXu7XBMZC5xvD1HZQP9E3uq1Idt7Wl52qkGDLW1KxCgDOrob7YMX8llqGK3WbU6wJgrALAKuTFSmd5Kw1D/U0WAOvBr3C2Vy8TCwU3fXkhNdPNnYBXz0q9Bpz+lebQ/G2Y54bf7lq5jv4FwHADzAYqVQEcQNeB+dgCYF2ra9bX6h65xWJ074I8DH7NLlAyqRvFdgHjtAomSbTT0+gKeGzDImwXUmu9z0OUvOGBIX8L02dlD2/yBd6m1m8ZKnuYMU1Ub7nn7EM1bCJvXFgY142jolpPaFPfyHMjv8VryRKi4fhlDfNQbQC+EerqWre6tuqypn2uWc1tu16dgqXUPVE0wbBBliej5B6wAh/1zBRSlXf8sE3o/yJlG1hFU3BMtFqwY41CgMsmQuWzD5qK5Ukf8osbVu2ROpLHW3ghGKtKNTS0TfXWu7G2QuZ+I2iEGry2YN+NVMm+C9gFuH0gW9soxWIDqy4Guiqow7IyOOY6fybgBRvIWMygkIEAOVK5gR8PrSLXRWwV4caeMPldYM3wCjDxiKKfALDoxduPczFjRscbdl6haX3icwPmRaZuuu/Ven1YwY0IyZdrValZQybgNv8MblgDvU+JlIwVMYKJFFIzMwKbvNCANXQ30nNRri1hDbABd9XqTJAFVNuV1ZVuZbTSra6MVLTVccEHdIOMZdibAR0BsOzCuXZOSHY1ySF1cwrZbEIqpi0Z7BihtZ7tYFeQtbUPsz5BNgFgqzjeesDUL0gF4mVuVv47n+fkQv4b670YeijYUKVgL0PmzIeA4NCb9oCn1cpYy3kzwNRQ3ZKiKr/FO2uIG9YA7kgQR4I4Go0MdiSwK9rn/IoBA1rgDT86pO61rs6qjAM180yr2BORULGtwkKIzGLoxQxI2mabIG1DxXBQ++3DBizIlRNLtYiz0jW+Lx9+9Zb89zXAXcl/iYB4SfxoJCYWBdfJduW+eqBTM0EuuA4P6vmJpsKlXq9+eQUM9VbWMICbAa2glBqBF2rtgQL5prICdNtEqTm82kGSAKhnOPXDizPotTUOlIyKGWny4ppCl03QNmcUDnRAzpQtBReZRL5aEmDEyQ9wiGVcK/jvAPgtZiWs0PNh/Fa30rPoIWzCvacb10NqjdcCzvdonh1ljol6Y3mRnJfgFqkT6ZOHbaZXBZctgA33BpjLdW55qRstLwfs5R66rcOgU8npyb0XR8d6FKkuXvMQ4Jr8WBQtL7ZcLJ56d+jfYCTgYuH3dlbwsV/1n+tH4345en1lZfMPc25pSL9HxhBvLXJxh3Vfz94G6w91c22xiMoVVQsNhpgRAZjFHCpre5D/MlvbcWBDwb16Ix3LbIDsADga6qMRpcAtd8tLo25ZUJeXBFVlWXA5Ho10zH67VlZi21i0ig0HPTILPVvPr/w41j0ArFI2UT7sZI1B3ttEm3SUTaRFsHyATfAjcCcKntXFQrw4fXpLw+F2eIcUbHsg/40Mwu/b2gwuvAcFYw/1448ATHwjwMW0GMA1HW7Zg5Q7XFvAI5lARBaQgPFbQRopkAFuebTULQE4wS4tcawiwC5AboVOSZvQPSITicxkXRlKKZk6eGXOKlbnCzArelawbMJ5MW0JuvkekfZmTqwgXx5cM1z/lkIxi+yhftsGU7/p0A3v+h+dOIPQBEPpGj+Iq9dClUVUehaABbn8iYpQIaVnzIpYErQ98DYCj2MqbAWnRZA14L0qfdYQgAliqNeqTKWiVqDeB+z92G+gE/iyrILvOAAWZI2IyiratJq8WNPxsglPoVlp8/Q5fHgRcCg4gl3l/9qmB5sNFqHR7mmzX4pqwnHFYtklZMZ48GccOAe2gvkxSXhwy4GZYGSAY6g4wCVgFCy+MXtTLmklYBHkwE6HErCUw1oDQ9WA5bnlu2EPkYIB2eoteLk15Pv3Bfq+gFN62MtSMQUF48UR9NRp+YwAHMEuFoOY6LC8mdmEVZyZhMUSlsfr/7JC/57jxnxYNirAkapFJlH/FkWAJwD+oohXDgzg+IF0pGc1i6sAx/SxFMxQArAtQjtEY/uvKm17EOTKILYEl4hO7lvBrTIH8trmvVLvkmyBgnKBel9w7y3di2OUnGrGk7GLFvgScruvIJNRsFDEgpBX6ZRRYBMeYQQ6xQrqTHo5UaBzW9BfjdKcNtsmiEWlYG1rTYJRTyzzywoJlqxM99knyPnXg72C5b9MMtJ7W5rGjUvFPHCgYAjHBAMPDiWEegW3Vsuk4Jb7kkHgv2QOLcBVYEPBwE2FGiTKvdfduxfFcJuaA7BtBZtQR0WOHLM8noHf1xR6c0MjSXXBJhyAGWUEupzVEUcI1pKMw0u0k3d2tJ9UbSA6A45Mi3+eAGD+PUoswF/Zz/8HAAD//4dLl7EAABNeSURBVNWaT09kxxXFJ3+kfIIoC8tfILtIk1288cYrLyJvkp2VjaUsEsmL7DIayRtrBAGDCBgCot3wMAZ3GwSm1a3IH805v3PvrfeaYWbA8mQSxuV6/frxXtWvTp17qx6PxuNxN58vutls1l1fX3eXl1fddHqhMu3OJ+fd+fmkOz87787OVc7OurPTs+705LQ7cTnpdNAddV13ND7qxqNxNxqNutHhqDs8POgODqLs7e13e7t7Krvdzs5Ot7O93W1vbXdbW1vd5uZmlI3NbmN9vVtXWaOsrXWrq6vdCmUlyrOVZ93Ks2fds5UVn+P7NZXV1TVfz++tb6x3GxsbcU/dn2dQtrf1XD17d2fXbdmnTfvRvkO183B0GO0/OuqOVNSj7uTopPO/05PuVIX+n1PEwkV8JjqeTifmdXV5aYbz2bybLxYdbB998cUXn88MeK4vbwT40hdP9EsGPFHNDYFcgM8EWA8UWzVAjeG/I8EdC64AHwL54NCA9w/Ukb29bndv14VObu8ILuUFgIEMPMAZsoCuGnIAXnkWn+MaIK9pYCgMkOAm4C0NXsDdioEFsAZ5V4O9rzbt7++7jYjBwhCQcQE2ZPqnfwZ8qv5TJLLzgAzcc/GZTM+7CwkSdjBErPP5nIE6BvBn8/msm+nETVPwVL8kBaPeHC3fOCGfnp56RE9EmH+6kxs2OgrAKPhAkJuC91GvCpCtYEFOBW9thoo3ULDUVwoG2Gqq2JABLsirq6i3VzDfres6FwFmFnAvZgb33kbBqV7Pnr0dD/ie2nSgwQfu4eGhRTFWm1GvFazaCqaPFpPAAteAU8FmI8CqmfUAhiEsZ2Kqn/EjyfhTiHMiAF96NCYTQbZFxM2GgE9kE34ocM03GnU0OgolpIoP1HhUgoJddqTkBLzTLGJgE1LfhkrAimlfKjVkVGxlAzoUzrVra2ErDA6Am4JtD9uyJGwJi2CAZRGo94CCgjXTBDgUPNK0Tsii4xmq/2EPiAp7xCqHNjGRCLHTi4sAjM3C8+bmBsCjRxqtJ5xccFL11ZUs4mLaTZG+fpmyZBGM4EkCbgpGxFJx82EpQo0uBTMdbRNSMR20TciHyx+XfLipWOAEC48Nny2ofY01hD0EWOyhV2/aA/4rOwr/TfWqPQeUjBH4rwErhoxldaFgAEu9FAE2XFsE8ai3CEQ4lRinBnwlhjeyh4hnX3755b9Q8EdIe4FFCDJGjZ+EB4f8ARxBrvfhmDYYBC6cCm6A8eEBZAUTQx4ClpK3EvKmpvLWVkzrjc2wCftpKpOAZ8hWq4BTy0KoUXAFxw3ZQgOs+3kA9YxQrxQs/8WmrGDaBOC0iPJgYon7w+Sk2B6k4LSHskzqEiB2eiFRwm42C4uAqVT/Dzz4fexgsRBgyfrq8rq7uKwsgkwiFHwm/2Vq2CrKIjzCzARBLh8mwGmaEegOM9Dhdc0qHGQiouOP29sR5YFsJStAVSYQfgzE8mYCGXD1Oc81WxiqV/fdzHuj3m1sSaXZg/zXcMkeDkIMACbq0w8rmF6VglWfZoALBr0HW8ECfClm19dS8OxGYl3YAb7++uu/Afgx0BaLSNWuZBNc3NK0JR/uFcyI9g1Qa9wwTTFUXNlE2gSdcVpkq5BFALmsAhAqyxkFmUBAtScD9K7ia7CF5zMHZw/yeQe2gutAG3bV7EEBudTrtqsf6oxFQ//sv7LEM3lwwbUP48UUCRBWkUGE/yJWmE4mkz880s3f0t0a4MiFex+OXDhu1nJh4N7OJGhWg1zZBDZBrkkwIdhlyqaOEnDovG0iVVwZBUpmuq87s0DRKgIMyGYHhqqAJkvh2vBxDZTtJmZGwbV6Nai2B7KHvch/CW5OKXPWAbhXbylYGRPq1awlVS27JMMK/xVg2cMy4AVICXy/efT999//RDc9npNJqAD4isWGfql8eBly2QQPziCAVzkXVgNpJPkkjR7YxL48b08da8FuN6YtnS+bsIqZ3mUXgAPqpgADXPXGOucAC1S+K7jluTEjyhrIWsh9eS4DTDt69UZwY4Hk7IG2W72YXvUNFWtxJVGVgsuHJ+ckAypNwRHgYAnTp0+f/vQRPwLxMdnDglRNPnx5JcDYhH65buY682Dkz6iiYoIA0UD/98xCATS2bALIToVkE3tK2cqLd9XhsgmCEJDLKhycBC6AJ8DMbQNsnHNgzODo37HVYAsoOO1BA8kKkucB2fGA4Kb4MCJ7cIoWi6SmXnXF9qB+YQ0V4Bx/UsW2Bi8yJkoKhv47Mz9lEP80XP4nH34PgGQSMwHGrC8UBRkZ+YgT6QJdeWBA1ujmklltCR9GA4NVHZ1gGhKtUc5zfiyF9VOZFZ5soxYhA2/21LdaBwrP74HrgInnFljui+emesliDnLl1jKHgf8C14BVl3rpW6zeVDs10+y199YCrFfvVQW4xbxE+dcGWB1/GwEuFv9uNoGnFOBY0VU+zEPCJiKysi8R04nZVQ0lIpeKvVJqGYUgDxcfVjIRvgftVR6qvgW6V2kExfisQUH9zhb6oIbH2xaAzEoyZw+D7NUb6nUwVjsbXKxBgCWWU/3PiwvNViDbHjL/rS2EqRcZ/QIDayBZ4Ef++7gB5kDnxtgDKcb1jfJh2URkE7nYyGyijWQ++IxVTm38uHk4Raj4qLIJvJiAMoC8R+qWQc9LaHtyLkIEm9SKae5i0HEMTCtWdaiV8/3g7NgSckEBXA1gber0cBUfpF5vTgFX3itlCAFCCXuwaGQPYQt9gPNMhkVu8JD/IsZIz7SfozQNlktw+SDFfYAdVLp2faV07WKoYiXW+r6s4hwVs3TEhwWYEad1/KOtKLmt7Aq007baBJJlWMm1lJZPajoDyGrmOEFHIBxALLUPwercLr+rhUT5rYMaGUwFtpY1VHDTsrjlvsKidrsbLC4MV/1y9qB+2hqUenllK9ElYOBiDyQIsIORBuXvzwHWSP8KKAGYnTXyYVZ1Eey8LzFQcY1s8+Jc8TDyaME6BrL8GLtwRmEv7jeBwpP79M1qQ3G2DQBHvgw4IFdQjAHgXA4I32tAgNvuwWKiPJegRgxwQIvsxpmD2ueVG2B1LG0IMCpma5IS1oA99MJCvWzu4L9pDzeV/y4srG+++ebXzwHmhDzpKWDZz7yRTVjF6cW1oquUDbBWMVaBklU7q3ADxVeNDT/uAQPZxXYRQQ/IKKxSOMM1KMEqRRfAAm4Fh1KbWpsd1CpNFsS98VxZ03BLEu/1DDNggYVtwmUmnhHcsk+lXACza4aC2adxaqYZDiNsgQSBYw3O/p1wOals4ncYOz7snFgjM1QxkD1FpGR7MXCzeGU39GMAo+PshDtUG/LlybaMABzTOFQXQSn9EzUPlanj5c91XVoN3p5gC+5olPu9em4FX5SrxrnY2CwM2Z1U67Ss+W8sLgJwZFS9eq8808seYCeL+NMLAZMYi8mYXTV2hG4EGEUP9ybsw80q9PAhZD2Ah/hth26ELCLgMRXLLlLFhhzBzypuUCJXZrVl0FiGp7vgc5yfywoOtO1YWUJLw1CtN3FU16yhRrmqY9AZ/VKuaosjFhVtY119K2uwei2wSM1gwr7NDZs78l6Y6Wf81Vdf/eyFgFPF76LKFuzyLYe9WL5TKUptxrMJFAU1C66mFh7GGl6VWh5C4emGTFAhhauOYxcoueoGOqa392xJsVAmoPV9X+KNRA0Qr37qPpF/RzALa8rntuUw6Vj4bcANcQzhRsaUCpaoIi3rd84Qn9U7X3gma3Pnzy+Fy5fffffdz4+Pj4+csi3YwtQOWy482Mac6kHxqiQevOTFVnOqeBD0gFzTMdQD4Hx/V6DJS3V8oDqAUddxwC6QfR3eGmBRLZ/7GWKwDKYDbcwinu8f3rcl4PDd3u4i5x1YAzMW9QJZDGLnTHAVpyJe3XQw+/bbb3/xSsBcIJ96h4dbxX7Twbs6VncxPbwPykOduvQ1sGNZiY+plEKobcihYkNOJZWSq44Xppk3M83ln73CU6G2gF71YQcCO4TLTBHMka2p4Or50NWAN7h4rdpHOmaxWCR9nyq4eWmMwHJj/dqZw9yMuBfM7gW3LlLjnhDg5pI/G/Esn/nMA/y2g5eiBhz18hI67KL5sRpQfsEhIsKbvXsl0NQjlJb5ckxplNhPcbwU0P3Uz++GUHPThsHym4kcRA+oHnqkh/sftQuzjf2GEgYLCtpOEA/IxBz2y6mxSTbVY1msvFdsYAKr4nbvWtPwbRpGsGMJaKvI1V288dBDtZtUXlxqRgVWMoog4HnHLTpCpwDt0AdoicmdB3IpTZBjSgMYG6nCykvnahCouRaonFddi4Za+lqtVizDyXN75eK7Q7/tc91BYEtr8Gt5rdguSMsktKH30n5Y3Rvs8ELJ/o/AagGPNx5tCY0f9288GmBWeBr9Bhrg2rC2ZaQvB2RrqSgHaFSWxZBS3SgbeKic9MorRL3Bdo1KUf/gd8HpG6vyoAK3qZalfVlCLoXd5sjra8/X1pDqxXcNV33nnVulZfQRRkNmDzom5VCHP+HmJNLOjRU5nRvnWw+WjJHCaEqlL0eO3EO2UpxdoGQyDVK57LSVZW2lolPVQ2CDqQ5IW8vwex3zyzU4IdrIEoQ4nqXBdUzAcxUfSgBRYwe9culH20w33LCGUi5/VEKaBptXpmWvIq4b/FIR8jiyin5T/lL7x5eYvoqX0Vo+2i406ow+kJc6oY5ZxXQOzyvAVccEtvJ0SryQXwhxQF6dAqR5NpUC1Cd14W3FMqBsRkVNm3rVGmrt76bnesWqPtRG+tLreLIGYpJmMkxg8yp+9/peI/Vb+jCXitsyWkq2XRD0BHnJi5cyjJh6Q9j1hsAqTjVH3jycyjyRH51TSpWHZl0f4qy+ZyQYlRqsrON9WthBPbOWwAW3gpktAcgIxBs5CmrKmpitTbmKRcQkfmByL3j3vUiR/fcAYQQj6MXrpbCL2HV77m8pShVMv1RKge47TCCUog06rSO9eslGDA2Gw0G4fRxKZS/BO3z4P7OFgKtj752kFfRgI7916sl7tpyVsZHTBzSLSwLj+bC4L7cHXae9ig9paOTH4cnxFhq7uIi/pyCloaGC6wXJAHKlPwXZdQIwcHyyPqsjQ+hxHEDr2FPf10VG0FIugCbUpWe1tmBnqDUU6/0V2os1CLBtQRZI32ZaaPFXT/guOT4MHgTtIRfzglQP+EtAjr+/ildMy4GPtMYvTGm090+jQ1YNSkZNKtX5OB4EHvs1mUcpO2orsZRugPh63Kfqumdf87yICX0gyxw+rcy5rm1BIlFAZ1FlW5DXOk3Vipb70XcYPITZg69lKW3I6iiZBVOnILP5wej7z1+lhgYXXxuAtl204HIbdH6+S4EAN/SEmpB7mHHeA0aQTcUyc6zY/OxlbyrWx2kLvGC4VioWnqstSP8ZquDqOfSZvj8Y2A/5hVTyh+HJ/C1spnC5+4YvX2bws6cBOCE746iOtzoVrc/OPqhT6bfhxWe+B2BAbHWduw00n1O2UKuzyhR4g+5gZriyBLIFWQLioY+C++FrV+5dA4HZE1HZ1uSvWfCqmY7xrmtNMwdArYCcypFpKJUDcEDOaUrnl7KOXm0BLlVZwUnwgBs2w7UEL9UvgFpxwHHBz9bMUpygTSz7eXvO34GgWjbOa3eMVIyf1xbQ7gJ61znSFXJCFFsrPr8NUQPrjUi824t0zuoZQgVulgiMA/BD5eVxqbWf8gk4vw+g/T0cuFjSM7hpBVgYCwUE4H2F+qNpWQJ9wObo04+eit0F8D7nSLjVmE9Q1oxG4ssqsUkkZXh5HbbhLU911CtA6rIOe3RkHwWv1Mfnu1WP9YTiPTO4R6lUx1iAAadieQMMPG/YoFp2xK5j8eRYojbTB/ryoy0i7gPwPtcQAFiXq3FWBkpYzPLVk6betRSNdTAdmZbewB/YB9PWLxMFxmAFvtTuYFmfDRDVh0oNnmNlAT6XGUypFaixxagB1kCXHdSeAlkCbUXNtJ0+CO7L30rcB8jruiZ34Z4QHGJ5rWCxCJXgb/EaSv5cqga2QaeFWN2hcKd7wDPcVDvTnEHwOWr8FLVmDpv5+KXuiW2RcvGstgumAEY7CMyApY20VXCf/OBdsdcF82X3lRLewcaYchEEUXRkG0RpOsYUjd05Ag35Z5TplJUhOSkFgFU0CIPBqFmAxwfQ/h4EWfyV4MWzSCWxLayAfVzO0TbaSFtf1pf/2e8yZ35XwXjM6gsV2Tq83A7YATpgO5IDhal8HdG9V3pkJTUIDlA5C5j2V7w+p5ANUFKpoVb2EDTAUizX0RbapPTr3f9abvs6R4m31erM77RB/hSfYzqjKMPGq6Uqp3iaugBxQXmGJfgFbVDXG297qe5FQLVKmf4sbVFq2gDnCXg8mzbQFtr0Ovv8xu69p78g0pT8AAUhIzIEFMguXQEHjqO6YaetcMxA1Dlybpf0+ITJPbgX9+Te+aNHjj/g2W+s42/iwQQVqek9JfMfS13HbD/iiwQuLADl2j9RpQCyugIgqSBweY3FNVxL1sDvKl6h1GPuyb3/rwLX6xwElqKC8pagPFZ5X4r7SKCeqP5Unz9T+VzHpFEsXT/nHN/lNR/p8/sqj7nHG1nWvgDOfwAHwQJZMlermwAAAABJRU5ErkJggg==", options: .ignoreUnknownCharacters)!)!
        
        if UIScreen.main.scale == 2 {
            return image.imageByScalingProportionallyToSize(CGSize(width: (image.size.width / 5) * 3, height: (image.size.width / 5) * 3))!
        } else {
            return image.imageByScalingProportionallyToSize(CGSize(width: (image.size.width / 3) * 2, height: (image.size.width / 3) * 2))!
        }
    }
}
