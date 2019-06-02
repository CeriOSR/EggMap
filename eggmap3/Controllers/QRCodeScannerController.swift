//
//  QRCodeScannerController.swift
//  EggMap
//
//  Created by Rey Cerio on 2018-07-17.
//  Copyright © 2018 Rey Cerio. All rights reserved.
//

import UIKit
import AVFoundation

class QRCodeScannerController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
//    let localizer = LocalizedPListStringGetter()
    var video = AVCaptureVideoPreviewLayer()
    @IBOutlet weak var square: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //creating session
        let session = AVCaptureSession()
      
        //define capture device
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
      
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            session.addInput(input)
        } catch let err {
            print(err)
        }
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
      
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        self.view.bringSubviewToFront(square)
        session.startRunning()
    }
  
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count > 0 {
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject {
                if object.type == AVMetadataObject.ObjectType.qr {
                    let alert = UIAlertController(title: "QRCode"/*localizer.parseLocalizable().qrCode?.value*/, message: object.stringValue, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Retake"/*localizer.parseLocalizable().retake?.value*/, style: .default, handler: { (action) in
                      
                    } ))
                    alert.addAction(UIAlertAction(title: "Copy"/*localizer.parseLocalizable().copy?.value*/, style: .default, handler: { (action) in
                        //copy the string value to clipboard
                        UIPasteboard.general.string = object.stringValue
                    }))
                    self.present(alert, animated: true) {
                      
                    }
                }
            }
        }
    }
}
