//
//  FlowEnum.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 19/12/25.
//

public enum FlowEnum: String, Codable {
    case oneOrderPrepaidActivationNew = "OneOrderPrepaidActivationNew"
    case oneOrderPrepaidActivationExisting = "OneOrderPrepaidActivationExisting"
    case oneOrderMassActivationNew = "OneOrderMassActivationNew"
    case oneOrderMassActivationExisting = "OneOrderMassActivationExisting"
    case oneOrderPortInNew = "OneOrderPortInNew"
    case oneOrderPortInExisting = "OneOrderPortInExisting"
    case oneOrderEditStandalone = "OneOrderEditStandalone"
    case oneOrderTakeOver = "OneOrderTakeOver"
    case youthPrepaidNoUser = "YouthPrepaidNoUser"
    case youthPrepaidNew = "YouthPrepaidNew"
    case youthPrepaidExisting = "YouthPrepaidExisting"
    case eSimChangeB2C = "ESimChangeB2C"
    case eSigmChangeB2B = "ESimChangeB2B"
}
