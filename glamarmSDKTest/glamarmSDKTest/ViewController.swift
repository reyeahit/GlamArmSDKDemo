//
//  ViewController.swift
//  glamarmSDKTest
//
//  Created by reyeah on 2026/1/9.
//

import UIKit

import Combine
import GlamarmRobotSDK

class ViewController: UIViewController {

    let sdk = RobotArmSDK(host: "192.168.58.2")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
                
        sdk.connectionStatePublisher
            .sink { state in
                print("state:", state)
            }
    }

    private func setupButtons() {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false

        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stack)

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),

            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])

        addButton("MoveJ (Protocol 1)", action: #selector(moveJ), to: stack)
//        addButton("MoveJ (Laser Picking)", action: #selector(moveJLaserPicking), to: stack)
//        addButton("MoveJ (Point Name)", action: #selector(moveJPointName), to: stack)
//        addButton("MoveC (Protocol 1)", action: #selector(moveC), to: stack)
//        addButton("MoveC (Point Names)", action: #selector(moveCPointNames), to: stack)
//        addButton("MoveL (Protocol 1)", action: #selector(moveL), to: stack)
//        addButton("MoveL (Laser Tracking)", action: #selector(moveLLaserTracking), to: stack)
//        addButton("MoveL (Point Name)", action: #selector(moveLPointName), to: stack)
//        addButton("Circle (Protocol 1)", action: #selector(circle), to: stack)
//        addButton("Circle (Point Names)", action: #selector(circlePointNames), to: stack)
//        addButton("MoveCart", action: #selector(moveCart), to: stack)
//        addButton("dmpMotion", action: #selector(dmpMotion), to: stack)
//        addButton("SplineLINE", action: #selector(splineLINE), to: stack)
//        addButton("SplineCIRC", action: #selector(splineCIRC), to: stack)
//        addButton("SplineEnd", action: #selector(splineEnd), to: stack)
//        addButton("NewSplineStart", action: #selector(newSplineStart), to: stack)
//        addButton("NewSplinePoint", action: #selector(newSplinePoint), to: stack)
//        addButton("NewSplineEnd", action: #selector(newSplineEnd), to: stack)
//        addButton("unifCircle", action: #selector(unifCircle), to: stack)
//        addButton("MoveLinear (Protocol 1)", action: #selector(moveLinear), to: stack)
//        addButton("MoveLinear (Point Name)", action: #selector(moveLinearPointName), to: stack)
//        addButton("MoveAxes (Protocol 1)", action: #selector(moveAxes), to: stack)
//        addButton("MoveAxes (Point Names)", action: #selector(moveAxesPointNames), to: stack)
        addButton("STOP", action: #selector(stopRobot), to: stack)

//        addButton("RobotIPConfig", action: #selector(robotIPConfig), to: stack)
//        addButton("SetQNXSystemTime", action: #selector(setQNXSystemTime), to: stack)
//        addButton("Mode", action: #selector(setMode), to: stack)
//        addButton("SetRobotInstallPos", action: #selector(setRobotInstallPos), to: stack)
//        addButton("RobotEnable", action: #selector(robotEnable), to: stack)
//        addButton("RobotSingleJointEnable", action: #selector(robotSingleJointEnable), to: stack)
//        addButton("RobotSingleJointDisable", action: #selector(robotSingleJointDisable), to: stack)
//        addButton("SetSpeed", action: #selector(setSpeed), to: stack)
//        addButton("SetCustSpeedManualToAuto", action: #selector(setCustSpeedManualToAuto), to: stack)
//        addButton("SetOaccScale", action: #selector(setOaccScale), to: stack)
//        addButton("SetMaxCartVelAcc", action: #selector(setMaxCartVelAcc), to: stack)
//        addButton("SetDefaultVelAccRatio", action: #selector(setDefaultVelAccRatio), to: stack)
//        addButton("SetMinVelAccRatio", action: #selector(setMinVelAccRatio), to: stack)
//        addButton("SetLimitPositive", action: #selector(setLimitPositive), to: stack)
//        addButton("SetLimitNegative", action: #selector(setLimitNegative), to: stack)
//        addButton("SetAnticollision", action: #selector(setAnticollision), to: stack)
        addButton("GetMCVersion", action: #selector(getMCVersion), to: stack)
        addButton("GetSlaveHardVersion", action: #selector(getSlaveHardVersion), to: stack)
        addButton("GetSlaveFirmVersion", action: #selector(getSlaveFirmVersion), to: stack)
        addButton("GetSoftwareVersion", action: #selector(getSoftwareVersion), to: stack)
        addButton("GetControlBoxNetMacAddr", action: #selector(getControlBoxNetMacAddr), to: stack)
        addButton("GetRobotSN", action: #selector(getRobotSN), to: stack)
        addButton("GetActualJointPosDegree", action: #selector(getActualJointPosDegree), to: stack)
        addButton("GetActualTCPPose", action: #selector(getActualTCPPose), to: stack)
        addButton("GetRobotMotionStatus", action: #selector(getRobotMotionStatus), to: stack)
        addButton("GetRobotMotionDone", action: #selector(getRobotMotionDone), to: stack)
        addButton("GetRobotErrorCode", action: #selector(getRobotErrorCode), to: stack)
    }

    private func addButton(_ title: String, action: Selector, to stack: UIStackView) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.addTarget(self, action: action, for: .touchUpInside)
        stack.addArrangedSubview(button)
    }

    private func logExampleFrame(_ frame: String) {
        print("Example send frame: \(frame)")
    }
    
    private func logErrcodeResult(_ result: Result<Int, Error>) {
        switch result {
        case .success(let code):
            let msg = RobotArmSDK.errcodeDescriptionEnglish(code) ?? "Unknown"
            print("errcode:", code, msg)
        case .failure(let err):
            print("error:", err)
        }
    }
    
    private func logResult<T>(_ result: Result<T, Error>) {
        switch result {
        case .success(let value):
            print("success:", value)
        case .failure(let err):
            print("error:", err)
        }
    }

    // MARK: - Motion Commands

    @objc func moveJ() {
        let wp = sampleMoveJWaypoint()
        let exampleFrame = "/f/bIII4III201III221IIIMoveJ(52.59449005126953,-97.2631607055664,9.70103645324707,3.6985855102539062,90.23299407958984,-21.759021759033203,35.03575897216797,-121.42925262451172,1056.7550048828125,5.787792205810547,2.0557479858398438,-59.073089599609375,0,0,100,180,100,0.000,0.000,0.000,0.000,0,0,0,0,0,0,0,0)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.moveJ(target: wp, ovl: 100, blendT: 0) { [weak self] result in
            self?.logErrcodeResult(result)
        }
        
//        sdk.sendRawPayload(cmdID: RobotArmSDK.cmdMoveJ,
//                           data: "MoveJ(52.59449005126953,-97.2631607055664,9.70103645324707,3.6985855102539062,90.23299407958984,-21.759021759033203,35.03575897216797,-121.42925262451172,1056.7550048828125,5.787792205810547,2.0557479858398438,-59.073089599609375,0,0,100,180,100,0.000,0.000,0.000,0.000,0,0,0,0,0,0,0,0)") { print($0) }

    }

    @objc func moveJLaserPicking() {
        let wp = sampleMoveJWaypoint()
        let exampleFrame = "/f/bIII4III201III225IIIMoveJ(29,{52.59449005126953,-97.2631607055664,9.70103645324707,3.6985855102539062,90.23299407958984,-21.759021759033203,35.03575897216797,-121.42925262451172,1056.7550048828125,5.787792205810547,2.0557479858398438,-59.073089599609375,0,0,100,180,100,0.000,0.000,0.000,0.000,0,0,0,0,0,0,0,0})III/b/f"
        logExampleFrame(exampleFrame)
        sdk.moveJLaserPicking(count: 29, target: wp, ovl: 100, blendT: 0) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func moveJPointName() {
        let exampleFrame = "/f/bIII4III201III11IIIMoveJ(\"P1\")III/b/f"
        logExampleFrame(exampleFrame)
        sdk.moveJ(pointName: "P1") { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func moveC() {
        let wp1 = sampleMoveCWaypoint1()
        let wp2 = sampleMoveCWaypoint2()
        let exampleFrame = "/f/bIII121III202III444IIIMoveC(52.59449005126953,-97.2631607055664,9.70103645324707,3.6985855102539062,90.23299407958984,-21.759021759033203,35.03575897216797,-121.42925262451172,1056.7550048828125,5.787792205810547,2.0557479858398438,-59.073089599609375,0,0,100,100,0.000,0.000,0.000,0.000,0,0,0,0,0,0,0,52.77810287475586,10.797059059143066,-24.79603385925293,-76.79747772216797,88.73820495605469,-21.935020446777344,-462.2508239746094,-780.772216796875,269.3205871582031,-1.2102705240249634,0.8727685809135437,-59.17490768432617,0,0,100,180,0.000,0.000,0.000,0.000,0,0,0,0,0,0,0,100,-1,100,0)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.moveC(point1: wp1, point2: wp2) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func moveCPointNames() {
        let exampleFrame = "/f/bIII4III202III16IIIMoveC(\"P1\",\"P2\")III/b/f"
        logExampleFrame(exampleFrame)
        sdk.moveC(midPointName: "P1", targetPointName: "P2") { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func moveL() {
        let wp = sampleMoveLWaypoint()
        let exampleFrame = "/f/bIII123III203III239IIIMoveL(52.59449005126953,-97.2631607055664,9.70103645324707,3.6985855102539062,90.23299407958984,-21.759021759033203,35.03575897216797,-121.42925262451172,1056.7550048828125,5.787792205810547,2.0557479858398438,-59.073089599609375,0,0,100,100,100,-1,0,0.000,0.000,0.000,0.000,0,0,0,0,0,0,0,0,100,0)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.moveL(target: wp, ovl: 100, blendR: -1, blendMode: 0, searchFlag: 0, oacc: 100, velAccParamMode: 0) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func moveLLaserTracking() {
        let exampleFrame = "/f/bIII123III203III45IIIMoveL(\"seamPos\",0,0,100,100,100,0,0,0)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.moveLLaserTracking(toolNum: 0, workPieceNum: 0, speed: 100, acc: 100, ovl: 100, blendR: 0, flag: 0, plateType: 0) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func moveLPointName() {
        let exampleFrame = "/f/bIII4III203III11IIIMoveL(\"P1\")III/b/f"
        logExampleFrame(exampleFrame)
        sdk.moveL(pointName: "P1") { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func circle() {
        let wp1 = sampleMoveCWaypoint1()
        let wp2 = sampleMoveCWaypoint2()
        let exampleFrame = "/f/bIII131III540III429IIICircle(52.59449005126953,-97.2631607055664,9.70103645324707,3.6985855102539062,90.23299407958984,-21.759021759033203,35.03575897216797,-121.42925262451172,1056.7550048828125,5.787792205810547,2.0557479858398438,-59.073089599609375,0,0,100,100,0.000,0.000,0.000,0.000,52.77810287475586,10.797059059143066,-24.79603385925293,-76.79747772216797,88.73820495605469,-21.935020446777344,-462.2508239746094,-780.772216796875,269.3205871582031,-1.2102705240249634,0.8727685809135437,-59.17490768432617,0,0,100,180,0.000,0.000,0.000,0.000,10,0,0,0,0,0,0,0,100,0,0)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.circle(point1: wp1, point2: wp2, ovl: 10, offset: .init(), oacc: 100, blendR: 0, velAccParamMode: 0) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func circlePointNames() {
        let exampleFrame = "/f/bIII4III540III17IIICircle(\"P1\",\"P2\")III/b/f"
        logExampleFrame(exampleFrame)
        sdk.circle(midPointName: "P1", targetPointName: "P2") { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func moveCart() {
        let pose = samplePoseL()
        let exampleFrame = "/f/bIII4III351III99IIIMoveCart({35.03575897216797,-121.42925262451172,1056.7550048828125,5.787792205810547,2.0557479858398438,-59.073089599609375},1,1,50,50,50,0,-1)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.moveCart(pose: pose, toolNum: 1, workPieceNum: 1, speed: 50, acc: 50, ovl: 50, blend: 0, config: -1) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func dmpMotion() {
        let joints = sampleJointsL()
        let pose = samplePoseL()
        let exampleFrame = "/f/bIII24III352III221IIIdmpMotion({52.59449005126953,-97.2631607055664,9.70103645324707,3.6985855102539062,90.23299407958984,-21.759021759033203},{35.03575897216797,-121.42925262451172,1056.7550048828125,5.787792205810547,2.0557479858398438,-59.073089599609375},0,0,100,100,100,{0.000,0.000,0.000,0.000})III/b/f"
        logExampleFrame(exampleFrame)
        sdk.dmpMotion(joints: joints, pose: pose, toolNum: 0, workPieceNum: 0, vel: 100, acc: 100, ovl: 100, exaxisPos1: 0, exaxisPos2: 0, exaxisPos3: 0, exaxisPos4: 0) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func splineLINE() {
        let wp = sampleMoveLWaypoint()
        let exampleFrame = "/f/bIII26III348III193IIISplineLINE(52.59449005126953,-97.2631607055664,9.70103645324707,3.6985855102539062,90.23299407958984,-21.759021759033203,35.03575897216797,-121.42925262451172,1056.7550048828125,5.787792205810547,2.0557479858398438,-59.073089599609375,0,0,100,100,100)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.splineLINE(target: wp, ovl: 100) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func splineCIRC() {
        let wp1 = sampleMoveLWaypoint()
        let wp2 = sampleMoveCWaypoint1()
        let exampleFrame = "/f/bIII4III349III372IIISplineCIRC(52.59449005126953,-97.2631607055664,9.70103645324707,3.6985855102539062,90.23299407958984,-21.759021759033203,35.03575897216797,-121.42925262451172,1056.7550048828125,5.787792205810547,2.0557479858398438,-59.073089599609375,0,0,100,100,52.77810287475586,10.797059059143066,-24.79603385925293,-76.79747772216797,88.73820495605469,-21.935020446777344,-462.2508239746094,-780.772216796875,269.3205871582031,-1.2102705240249634,0.8727685809135437,-59.17490768432617,0,0,100,100,100)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.splineCIRC(point1: wp1, point2: wp2, ovl: 100) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func splineEnd() {
        let exampleFrame = "/f/bIII4III350III11IIISplineEnd()III/b/f"
        logExampleFrame(exampleFrame)
        sdk.splineEnd { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func newSplineStart() {
        let exampleFrame = "/f/bIII4III553III22IIINewSplineStart(0,2000)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.newSplineStart(ctlPoint: 0, averageTime: 2000) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func newSplinePoint() {
        let wp = sampleMoveLWaypoint()
        let exampleFrame = "/f/bIII4III555III200IIINewSplinePoint(52.59449005126953,-97.2631607055664,9.70103645324707,3.6985855102539062,90.23299407958984,-21.759021759033203,35.03575897216797,-121.42925262451172,1056.7550048828125,5.787792205810547,2.0557479858398438,-59.073089599609375,0,0,100,100,100,0,0)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.newSplinePoint(target: wp, ovl: 100, blendR: 0, lastFlag: 0) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func newSplineEnd() {
        let exampleFrame = "/f/bIII4III554III14IIINewSplineEnd()III/b/f"
        logExampleFrame(exampleFrame)
        sdk.newSplineEnd { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func unifCircle() {
        let joints = sampleJointsL()
        let pose = samplePoseL()
        let exampleFrame = "/f/bIII4III644III193IIIunifCircle({52.59449005126953,-97.2631607055664,9.70103645324707,3.6985855102539062,90.23299407958984,-21.759021759033203},{35.03575897216797,-121.42925262451172,1056.7550048828125,5.787792205810547,2.0557479858398438,-59.073089599609375},0,0,100,100)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.unifCircle(joints: joints, pose: pose, toolNum: 0, workPieceNum: 0, radius: 100, anvel: 100) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func moveLinear() {
        let joints = sampleJointsL()
        let pose = samplePoseL()
        let exampleFrame = "/f/bIII123III856III238IIIMoveLinear(52.59449005126953,-97.2631607055664,9.70103645324707,3.6985855102539062,90.23299407958984,-21.759021759033203,35.03575897216797,-121.42925262451172,1056.7550048828125,5.787792205810547,2.0557479858398438,-59.073089599609375,0,0,100,100,100,-1,0.000,0.000,0.000,0.000,0,0,0,0,0,0,0,0,1)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.moveLinear(joints: joints, pose: pose, toolNum: 0, workPieceNum: 0, speed: 100, acc: 100, ovl: 100, blendT: -1, exaxisPos1: 0, exaxisPos2: 0, exaxisPos3: 0, exaxisPos4: 0, offset: .init(), oacc: 0, simFlag: 1) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func moveLinearPointName() {
        let exampleFrame = "/f/bIII4III856III18IIIMoveLinear(\"P1\",1)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.moveLinear(pointName: "P1", simFlag: 1) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func moveAxes() {
        let wp1 = sampleMoveCWaypoint1()
        let wp2 = sampleMoveCWaypoint2()
        let exampleFrame = "/f/bIII121III858III447IIIMoveAxes(52.59449005126953,-97.2631607055664,9.70103645324707,3.6985855102539062,90.23299407958984,-21.759021759033203,35.03575897216797,-121.42925262451172,1056.7550048828125,5.787792205810547,2.0557479858398438,-59.073089599609375,0,0,100,100,0.000,0.000,0.000,0.000,0,0,0,0,0,0,0,52.77810287475586,10.797059059143066,-24.79603385925293,-76.79747772216797,88.73820495605469,-21.935020446777344,-462.2508239746094,-780.772216796875,269.3205871582031,-1.2102705240249634,0.8727685809135437,-59.17490768432617,0,0,100,180,0.000,0.000,0.000,0.000,0,0,0,0,0,0,0,100,-1,100,1)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.moveAxes(point1: wp1, point2: wp2, ovl: 100, blendR: -1, oacc: 100, simFlag: 1) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func moveAxesPointNames() {
        let exampleFrame = "/f/bIII4III858III20IIIMoveAxes(\"P1\",\"P2\",1)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.moveAxes(pointName1: "P1", pointName2: "P2", simFlag: 1) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func stopRobot() {
        let exampleFrame = "/f/bIII4III102III4IIISTOPIII/b/f"
        logExampleFrame(exampleFrame)
        sdk.stop { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    // MARK: - Config and Query Commands

    @objc func robotIPConfig() {
        let exampleFrame = "/f/bIII4III263III26IIIRobotIPConfig(192.168.58.2)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.robotIPConfig(ip: "192.168.58.2") { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func setQNXSystemTime() {
        let exampleFrame = "/f/bIII19III343III36IIISetQNXSystemTime(\"27 3 2025\",\" 1705\")III/b/f"
        logExampleFrame(exampleFrame)
        sdk.setQNXSystemTime(dayMonthYear: "27 3 2025", hourMin: " 1705") { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func setMode() {
        let exampleFrame = "/f/bIII20III303III7IIIMode(0)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.setMode(0) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func setRobotInstallPos() {
        let exampleFrame = "/f/bIII23III337III21IIISetRobotInstallPos(0)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.setRobotInstallPos(0) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func robotEnable() {
        let exampleFrame = "/f/bIII39III302III14IIIRobotEnable(0)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.robotEnable(0) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func robotSingleJointEnable() {
        let exampleFrame = "/f/bIII42III820III25IIIRobotSingleJointEnable(1)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.robotSingleJointEnable(1) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func robotSingleJointDisable() {
        let exampleFrame = "/f/bIII43III821III26IIIRobotSingleJointDisable(1)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.robotSingleJointDisable(1) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func setSpeed() {
        let exampleFrame = "/f/bIII44III206III12IIISetSpeed(32)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.setSpeed(32) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func setCustSpeedManualToAuto() {
        let exampleFrame = "/f/bIII66III750III30IIISetCustSpeedManualToAuto(0,20)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.setCustSpeedManualToAuto(status: 0, speed: 20) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func setOaccScale() {
        let exampleFrame = "/f/bIII36III640III16IIISetOaccScale(50)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.setOaccScale(50) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func setMaxCartVelAcc() {
        let exampleFrame = "/f/bIII55III849III26IIISetMaxCartVelAcc(999,2999)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.setMaxCartVelAcc(maxVelRatio: 999, maxAccRatio: 2999) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func setDefaultVelAccRatio() {
        let exampleFrame = "/f/bIII56III850III30IIISetDefaultVelAccRatio(29,29.9)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.setDefaultVelAccRatio(defVelRatio: 29, defAccRatio: 29.9) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func setMinVelAccRatio() {
        let exampleFrame = "/f/bIII57III851III22IIISetMinVelAccRatio(1,1)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.setMinVelAccRatio(minVelRatio: 1, minAccRatio: 1) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func setLimitPositive() {
        let exampleFrame = "/f/bIII506III308III39IIISetLimitPositive(175,85,160,85,175,175)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.setLimitPositive(deg1: 175, deg2: 85, deg3: 160, deg4: 85, deg5: 175, deg6: 175) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func setLimitNegative() {
        let exampleFrame = "/f/bIII507III309III47IIISetLimitNegative(-175,-265,-160,-265,-175,-175)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.setLimitNegative(deg1: -175, deg2: -265, deg3: -160, deg4: -265, deg5: -175, deg6: -175) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func setAnticollision() {
        let exampleFrame = "/f/bIII201III305III35IIISetAnticollision(1,{5,5,5,5,5,5},1)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.setAnticollision(type: 1, levels: [5, 5, 5, 5, 5, 5], configFlag: 1) { [weak self] result in
            self?.logErrcodeResult(result)
        }
    }

    @objc func getMCVersion() {
        let exampleFrame = "/f/bIII37III400III15IIIGetMCVersion(1)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.getMCVersion(flag: 1) { [weak self] result in
            self?.logResult(result)
        }
    }

    @objc func getSlaveHardVersion() {
        let exampleFrame = "/f/bIII39III423III21IIIGetSlaveHardVersion()III/b/f"
        logExampleFrame(exampleFrame)
        sdk.getSlaveHardVersion { [weak self] result in
            self?.logResult(result)
        }
    }

    @objc func getSlaveFirmVersion() {
        let exampleFrame = "/f/bIII40III424III21IIIGetSlaveFirmVersion()III/b/f"
        logExampleFrame(exampleFrame)
        sdk.getSlaveFirmVersion { [weak self] result in
            self?.logResult(result)
        }
    }

    @objc func getSoftwareVersion() {
        let exampleFrame = "/f/bIII4III905III20IIIGetSoftwareVersion()III/b/f"
        logExampleFrame(exampleFrame)
        sdk.getSoftwareVersion { [weak self] result in
            self?.logResult(result)
        }
    }

    @objc func getControlBoxNetMacAddr() {
        let exampleFrame = "/f/bIII4III826III26IIIGetControlBoxNetMacAddr(0)III/b/f"
        logExampleFrame(exampleFrame)
        sdk.getControlBoxNetMacAddr(netNo: 0) { [weak self] result in
            self?.logResult(result)
        }
    }

    @objc func getRobotSN() {
        let exampleFrame = "/f/bIII46III1173III12IIIGetRobotSN()III/b/f"
        logExampleFrame(exampleFrame)
        sdk.getRobotSN { [weak self] result in
            self?.logResult(result)
        }
    }

    @objc func getActualJointPosDegree() {
        let exampleFrame = "/f/bIII4III375III25IIIGetActualJointPosDegree()III/b/f"
        logExampleFrame(exampleFrame)
        sdk.getActualJointPosDegree { [weak self] result in
            self?.logResult(result)
        }
    }

    @objc func getActualTCPPose() {
        let exampleFrame = "/f/bIII4III1152III18IIIGetActualTCPPose()III/b/f"
        logExampleFrame(exampleFrame)
        sdk.getActualTCPPose { [weak self] result in
            self?.logResult(result)
        }
    }

    @objc func getRobotMotionStatus() {
        let exampleFrame = "/f/bIII4III1161III22IIIGetRobotMotionStatus()III/b/f"
        logExampleFrame(exampleFrame)
        sdk.getRobotMotionStatus { [weak self] result in
            self?.logResult(result)
        }
    }

    @objc func getRobotMotionDone() {
        let exampleFrame = "/f/bIII4III1162III20IIIGetRobotMotionDone()III/b/f"
        logExampleFrame(exampleFrame)
        sdk.getRobotMotionDone { [weak self] result in
            self?.logResult(result)
        }
    }

    @objc func getRobotErrorCode() {
        let exampleFrame = "/f/bIII4III1163III19IIIGetRobotErrorCode()III/b/f"
        logExampleFrame(exampleFrame)
        sdk.getRobotErrorCode { [weak self] result in
            self?.logResult(result)
        }
    }

    // MARK: - Sample Data

    private func sampleMoveJWaypoint() -> MotionWaypoint {
        MotionWaypoint(
            joints: .init(j1: 52.59449005126953, j2: -97.2631607055664, j3: 9.70103645324707, j4: 3.6985855102539062, j5: 90.23299407958984, j6: -21.759021759033203),
            pose: .init(x: 35.03575897216797, y: -121.42925262451172, z: 1056.7550048828125, rx: 5.787792205810547, ry: 2.0557479858398438, rz: -59.073089599609375),
            toolNum: 0,
            workPieceNum: 0,
            speed: 100,
            acc: 180
        )
    }

    private func sampleJointsL() -> JointTarget6 {
        JointTarget6(j1: 52.59449005126953, j2: -97.2631607055664, j3: 9.70103645324707, j4: 3.6985855102539062, j5: 90.23299407958984, j6: -21.759021759033203)
    }

    private func samplePoseL() -> CartesianPose {
        CartesianPose(x: 35.03575897216797, y: -121.42925262451172, z: 1056.7550048828125, rx: 5.787792205810547, ry: 2.0557479858398438, rz: -59.073089599609375)
    }

    private func sampleMoveLWaypoint() -> MotionWaypoint {
        MotionWaypoint(
            joints: sampleJointsL(),
            pose: samplePoseL(),
            toolNum: 0,
            workPieceNum: 0,
            speed: 100,
            acc: 100
        )
    }

    private func sampleMoveCWaypoint1() -> MotionWaypoint {
        MotionWaypoint(
            joints: .init(j1: 52.59449005126953, j2: -97.2631607055664, j3: 9.70103645324707, j4: 3.6985855102539062, j5: 90.23299407958984, j6: -21.759021759033203),
            pose: .init(x: 35.03575897216797, y: -121.42925262451172, z: 1056.7550048828125, rx: 5.787792205810547, ry: 2.0557479858398438, rz: -59.073089599609375),
            toolNum: 0,
            workPieceNum: 0,
            speed: 100,
            acc: 100
        )
    }

    private func sampleMoveCWaypoint2() -> MotionWaypoint {
        MotionWaypoint(
            joints: .init(j1: 52.77810287475586, j2: 10.797059059143066, j3: -24.79603385925293, j4: -76.79747772216797, j5: 88.73820495605469, j6: -21.935020446777344),
            pose: .init(x: -462.2508239746094, y: -780.772216796875, z: 269.3205871582031, rx: -1.2102705240249634, ry: 0.8727685809135437, rz: -59.17490768432617),
            toolNum: 0,
            workPieceNum: 0,
            speed: 100,
            acc: 180
        )
    }
}

