//
//  QRCoreView.swift
//  CSUtils
//
//  Created by Chrystian Salgado on 13/03/19.
//

import UIKit
import AVFoundation

open class QRCodeViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var btnDismiss: UIBarButtonItem!
    
    public var navigationBarColor: UIColor = .white
    public var hideStatusBar: Bool = false
    public var navigationBarItemColor: UIColor = .blue
    public var navigationBarBackgroundColor: UIColor = .white
    public var callbackResult: ((_ resultData: String)->Void)?
    public var callbackError: ((_ resultData: String)->Void)?
    
    private var session = AVCaptureSession()
    private var previewLayer: AVCaptureVideoPreviewLayer!
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        setup()
        btnDismiss.tintColor = navigationBarItemColor
        navigationController?.navigationBar.barTintColor = navigationBarColor
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        invalidateSession()
    }
    
    open override var prefersStatusBarHidden: Bool {
        return hideStatusBar
    }
    
    /// Setup AVCapture
    private func setup() {
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            handlerError(localizedError: error.localizedDescription)
            return
        }
        
        if session.canAddInput(videoInput) {
            session.addInput(videoInput)
        }
        else {
            handlerError(localizedError: "ERROR_IN_VIDEO_INPUT")
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if session.canAddOutput(metadataOutput) {
            session.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        }
        else {
            handlerError(localizedError: "ERROR_IN_VIDEO_OUTPUT")
            return
        }
        
        cameraFrameSetup()
        session.startRunning()
    }
    
    private func cameraFrameSetup() {
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
    }
    
    private func found(code: String) {
        callbackResult?(code)
    }
    
    private func handlerError(localizedError: String) {
        callbackError?(localizedError)
    }
    
    private func invalidateSession() {
        session.stopRunning()
    }
    
    @IBAction func actionDismiss(_ sender: Any) {
        invalidateSession()
        dismiss(animated: true, completion: nil)
    }
}

extension QRCodeViewController: AVCaptureMetadataOutputObjectsDelegate {
    
    public func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        session.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: stringValue)
        }
    }
}
