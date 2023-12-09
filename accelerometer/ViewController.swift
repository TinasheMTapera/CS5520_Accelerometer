//
//  ViewController.swift
//  accelerometer
//
//  Created by Tinashe Tapera on 2023-12-09.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let motionManager = CMMotionManager()
    var labelTitle: UILabel!
    var xLabel: UILabel!
    var yLabel: UILabel!
    var zLabel: UILabel!
    var xData: UILabel!
    var yData: UILabel!
    var zData: UILabel!
    
    var startButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupLabelTitle()
        setupXYZ()
        setupStartButton()
        
        initConstraints()
        
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        
    }
    
    func setupStartButton(){
        startButton = UIButton(type: .system)
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        startButton.setTitle("Start", for: .normal)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startButton)
    }

    
    func setupLabelTitle(){
        labelTitle = UILabel()
        labelTitle.text = "Accelerometer Demo"
        labelTitle.font = UIFont.systemFont(ofSize: 24)
        labelTitle.textAlignment = .center
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelTitle)
    }
    
    func setupXYZ(){
        xLabel = UILabel()
        xLabel.text = "X-Axis"
        xLabel.textAlignment = .center
        xLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(xLabel)
        
        xData = UILabel()
        xData.text = "0"
        xData.textAlignment = .center
        xData.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(xData)
        
        yLabel = UILabel()
        yLabel.text = "Y-Axis"
        yLabel.textAlignment = .center
        yLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yLabel)
        
        yData = UILabel()
        yData.text = "0"
        yData.textAlignment = .center
        yData.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yData)
        
        zLabel = UILabel()
        zLabel.text = "Z-Axis"
        zLabel.textAlignment = .center
        zLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(zLabel)
        
        zData = UILabel()
        zData.text = "0"
        zData.textAlignment = .center
        zData.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(zData)
        
    }
    
    @objc func startButtonPressed() {
        motionManager.accelerometerUpdateInterval = 0.5
        motionManager.startAccelerometerUpdates()
        
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            if let data = self.motionManager.accelerometerData {
                self.xData.text = String(format: "%.5f", data.acceleration.x)
                self.yData.text = String(format: "%.5f", data.acceleration.y)
                self.zData.text = String(format: "%.5f", data.acceleration.z)
            }
        }
        
        startButton.setTitle("Stop", for: .normal)
        startButton.removeTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(stopButtonPressed), for: .touchUpInside)
        
    }
    
    @objc func stopButtonPressed() {
        
        stopAccelerometerUpdates()
        
        // Change the button label back to "Start"
        startButton.setTitle("Start", for: .normal)
        startButton.removeTarget(self, action: #selector(stopButtonPressed), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        
    }
    
    func stopAccelerometerUpdates() {
        
        motionManager.stopAccelerometerUpdates()
        
    }
    
    func initConstraints(){
        
        NSLayoutConstraint.activate([

            labelTitle.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            labelTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2),
            
            xLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            xLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -180),
            
            xData.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            xData.topAnchor.constraint(equalTo: xLabel.bottomAnchor, constant: 16),
            
            yLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            yLabel.topAnchor.constraint(equalTo: xData.bottomAnchor, constant: 36),
            
            yData.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            yData.topAnchor.constraint(equalTo: yLabel.bottomAnchor, constant: 16),
            
            zLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            zLabel.topAnchor.constraint(equalTo: yData.bottomAnchor, constant: 36),
            
            zData.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            zData.topAnchor.constraint(equalTo: zLabel.bottomAnchor, constant: 16),
            
            startButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            startButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -92),
            
            
        ])
        
    }

}

