# EXI iOS SDK

## Table of Contents

1. [Introduction](#Introduction)
2. [Overview](#Overview)
8. [SDK Overview](#SDKOverview)
9. [Integration Steps](#IntegrationSteps)
10. [Conclusion](#Conclusion)
11. [Set up Guide](#SetupGuide)
    - [Get Authorization Tokens and Keys](#GetAuthorizationTokensandKeys)
    - [Get New API Access Token](#GetNewAPIAccessToken)
    - [Get New JWS Token](#GetNewJWSToken)
14. [EXI iOS SDK Quick Start Guide](#EXIiOSSDKQuickStartGuide)
    - [Install SDK](#InstallSDK)
        - [Install using CocoaPods](#InstallusingCocoaPods)
        - [Install using SPM](#InstallusingSPM)
18. [Project Setup](#ProjectSetup)

## Overview

Developer: EXI

Support: info@exi.life

Xcode 13.4 or later

Deployable in: Swift 5.3 or later

Minimum iOS Version Supported: iOS 10.0

## Introduction

The EXI SDK is an exercise prescription SDK that delivers personalized exercises that are clinically validated and digitally delivered for people with or at risk of chronic conditions. It will deal with approximately 23 chronic conditions.

## Getting Started

To begin using our SDK, you will need to have an active account with us. Once you have an account, you can access the SDK documentation and download the SDK from our website.


## SDK Features

The SDK provides the following features:

- Health Condition Assessment: The SDK assesses the user's health condition based on their medical history and health data, including age, gender, weight, height, and medical conditions.
- Physical Activity Recommendations and extend prescription: Based on the user's health condition assessment, the SDK recommends a set of physical activities that are safe and appropriate for the user. The activities are categorized based on their type, intensity level, and duration.
- Customization: The SDK can be customized to meet the specific needs of your application, including branding, user interface, and language support.

## Integration Requirements

To integrate the SDK into your application, you need the following:
- Access to the SDK: You can obtain access to the SDK by contacting the provider of the SDK.
- Development Environment: The SDK supports multiple programming languages, including Kotlin and Swift. You should have a development environment that supports the language of your choice.
- API Key: You need an API key to authenticate your application with the SDK. The API key is provided by the SDK provider. To check the steps to get access to API key and JWS Token go to Setup Guide Page.

## SDK Overview

EXI provides a client-side SDK for Android and iOS development.
EXI provides a convenient collection of objects, methods, and events to connect your client-side application to Conversations.
For the most up-to-date installation methods, version history, and documentation, please check out:
The  Android, or iOS download page

## Integration Steps

The following steps describe how to integrate the SDK into your application:

>Step 1: Obtain Access to the SDK

Contact the SDK provider to obtain access to the SDK. The provider will provide you with the necessary information and documentation to use the SDK.

>Step 2: Choose a Programming Language

Choose a programming language that is supported by the SDK and set up your development environment.

>Step 3: Obtain an API Key

Obtain an API key from the SDK provider. The API key is used to authenticate your application with the SDK.

>Step 4: Add the SDK to Your Project

Add the SDK to your project by including the SDK library in your project's dependencies.

>Step 5: Initialize the SDK

Initialize the SDK by passing the Context, API key, and enableMockResponse(optional) to the SDK constructor. When enableMockResponse is enabled only a sample hardcoded response is returned by the SDK, this will be helpful during the development when in offline mode.

>Step 6: Set JWS Token

Set the JWS token which is used to authorize users of the SDK and also identify each user of the SDK.

>Step 7: Assess the User's Health Condition

Use the SDK's health condition assessment feature to assess the user's health condition based on their medical history and health data.

>Step 8: Get Physical Activity Recommendations and prescription.

Use the SDK's physical activity recommendation feature to get a list of physical activities that are safe and appropriate for the user along with prescriptions letting users know about durations to perform activities.

>Step 9: Log Activity

Use the SDK's Log Activity feature to track the user's physical activity.

>Step 10: Get Prescription Progress

Use the SDK's Prescription progress to track the user's physical activity.

## Conclusion

The SDK provides a solution for e-prescribing physical activities based on a user's health condition. It assesses the user's health condition, recommends physical activities, integrates with wearable devices, and can be customized to meet the specific needs of your application. Follow the integration steps to integrate the SDK into your application and provide personalized physical activity recommendations to your users.

# Set up Guide

## Get Authorization Tokens and Keys
`Note: Currently all the API Access Tokens and JWS Tokens are generated by the APIs directly. In the future, a new UI will be introduced in CMS and it will behave or provision to set up the SDK will be similar.`

## Get New API Access Token

- Access CMS: https://cms.integration.exi.life/
--  For other environments, replace .integration with the environment you want i.e. .mobile
--  If you need access to the CMS, message anyone with access to send you an invite.
- Get the api key from there

## Get New JWS Token

You must encrypt your organisationId, userId, email and exp in the payload (claims)
Then you must sign the following with your keys.
```swift
{
  /**You can find the ID in the CMS: Edit your or and copy ID from URL*/
  "organisationId": "0574acae-4252-4b49-8b2b-53963b39e598",
  /**This is the user ID from yhe customer's system*/
  "userId": "123456789",
  "email": "email@gmail.com"
  /**This is a date in the future, safe to use*/
  "exp": 1713571200000
}
```

1. Generate JWS credentials: https://8gwifi.org/jwsgen.jsp
    - Use 'RS256' algorithm
    - Save all credentials somewhere safe
2. Open JWT.IO and paste your credentials to verify signature
    - You can use this website and credentials to easily change the payload and get a new token fast
3. Your kid, public_key must be added in the us-development DB, then you can do request with Authorization in place


# EXI iOS SDK Quick Start Guide

## Install SDK
To use the EXI iOS SDK, you have the following options:
- Install it with CocoaPods
- Install it with SPM (Recent Code not tested. Experimental)

## Install using CocoaPods

Step 1 - Add to your Podfile
```SH
 pod 'EXISDK'
```
Step 2 - Install pod by running the following command in the directory with the
```sh
$ pod install
```

## Install using SPM
Importing EXISDK into Project

Step 1: Click on Xcode project file

Step 2: Click on Swift Packages and click on the plus to add a package

Step 3: Enter the following repository url 'https://github.com/exiteam/exi-ios-sdk-framework.git' and click next

Step 4: Leave the default settings to get the most recent release and click next to finish importing


## Project Setup

Visible Initialization process


##### Main SDK setup method:

```swift
public func setup(configuration: EXIConfiguration)
```

### SDK setup example (iOS):

```swift
import EXISDK
let configuration = EXIConfiguration(apiKey: "YOUR_DEVELOPER_API_KEY", jwsToken: "YOUR_JWT_TOKEN")
EXISDK.setup(configuration: configuration)
init(
    apiKey: String,
    jwsToken: String? = nil,
    logggingEnabled: Bool = true,
    mockEnabled: Bool = false
)
```

### SDK method call example (iOS):

```swift
let configuration = EXIConfiguration(apiKey: "YOUR_DEVELOPER_API_KEY", jwsToken: "YOUR_JWT_TOKEN")
        EXISDK.setup(configuration: configuration)
            EXISDK.getPrescription { result in
                switch result {
                case .success:
                print("All Good")
                case .failure(let error):
                print(error)
                }
            }
```
 
### Visible method names (Tentative)
 
##### Get regions
```swift
    func getRegions(completion:@escaping (Result<[EXIRegion], EXIError>) -> Void)
```
##### Get custom fields
```swift
    func getCustomFields(completion:@escaping (Result<[EXICustomField], EXIError>) -> Void)
```
##### Get health conditions
```swift
    func getHealthConditions(completion:@escaping (Result<[EXIHealthCondition], EXIError>) -> Void)
```
##### Get prescription
```swift
    func getPrescription(completion:@escaping (Result<EXIPrescription, EXIError>) -> Void)
```
##### Get prescription for single week
```swift
    func getPrescription(week: Int, completion:@escaping EXIResult<EXIPrescription>)
```
##### Get user profile
```swift
    func getUser(completion:@escaping (Result<EXIProfile?, EXIError>) -> Void)
```
##### Delete user
```swift
    func deleteUser(completion:@escaping (Result<Bool, EXIError>) -> Void)
```
##### Restart prescription
```swift
    func restartPrescription(completion:@escaping (Result<EXIPrescription, EXIError>) -> Void)
```
##### Update user profile
```swift
    func updateUser(completion:@escaping (Result<EXIProfile?, EXIError>) -> Void)
```
##### Delete user profile
```swift
    func deleteUser(completion:@escaping (Result<Bool, EXIError>) -> Void)
```
##### Get health condition details
```swift
    func getHealthCondition(conditionId: String, completion:@escaping EXIResult<EXIHealthCondition>)
```
#####  Check prescription availability
```swift
    func isPrescriptionAvailable(completion:@escaping EXIResult<Bool>)
```
#####  Get all activity groups
```swift
    func getActivityGroups(intensity: EXIIntensity, completion:@escaping EXIResult<[EXIActivityGroup]>)
```
#####  Get all activities list
```swift
    func getAllActivities(intensity: EXIIntensity, completion:@escaping EXIResult<[EXIActivity]>)
```
#####  Log activity
```swift
    func logActivity(activityLog: EXILogActivityRequest, completion:@escaping EXIResult<EXIActivityLog>)
```
#####  Get activities logs
```swift
    func getActivityLogs(loggedAt: String, completion:@escaping EXIResult<[EXIActivityLog]>)
```
#####  Get user activities types
```swift
    func getUserActivityTypes(completion:@escaping EXIResult<[EXIUserActivityType]>)
```
#####  Update health metrics
```swift
    func updateHealthMetrics(healthMetrics: [EXIHealthMetric], completion:@escaping EXIResult<[EXIHealthMetric]>)
```

##### Main global error enum:

```swift
public enum EXIError: Error, Equatable {
    case invalidHeaders
    case nilConfiguration
    case emptyApiKey
    case emptyJwtToken
    case invalidKey
    case invalidKeyPrefix
    case invalidKeyLength
    case expiredToken
    case invalidJwtToken
    case invalidJwtHeader
    case invalidJwtTokenPayload
    case missingToken
    case invalidData
    case noInternet
    case unsupportedURL
    case jsonDecodingFailure
    case organisationNotFound
    case invalidConditionUUID
    case userNotFound(description: String)
    case responseUnsuccessful(description: String)
    case decodingTaskFailure(description: String)
    case requestFailed(description: String)
    case jsonConversionFailure(description: String)
    case postParametersEncodingFailure(description: String)
    case requestError(description: String)
}
```

##### Requests classes:

```swift
public struct EXICustomFieldRequest: Codable, Equatable {
    public var name: String
    public var value: String
    public init(name: String, value: String) {
        self.name = name
        self.value = value
    }
}
```

```swift
public struct EXIProfileRequest: Codable, Equatable {
    public var firstName, lastName, dateOfBirth: String?
    public var betaBlockers: Bool?
    public var healthConditions: [String]?
    public var locale: String?
    public var customFields: [EXICustomField]?
    public var timezone: String?
    public var region: EXIRegion?
    public var gender: EXIGender?
    public var unitSystem: EXIUnit?
    public var healthMetric: [EXIHealthMetric]?
}
```

```swift
public struct EXILogActivityRequest: Codable, Equatable {
    public var loggedAt, activityType: String?
    public var duration, heartRate, rpe, distance, steps: Int?
    public init(loggedAt: String, activityType: String, duration: Int, heartRate: Int? = nil, rpe: Int? = nil, distance: Int? = nil, steps: Int? = nil) {
        self.loggedAt = loggedAt
        self.activityType = activityType
        self.duration = duration
        self.heartRate = heartRate
        self.rpe = rpe
        self.distance = distance
        self.steps = steps
    }
}
```

##### Response classes:


```swift
EXIPrescription
```
```swift
EXIProfile
```
```swift
EXIMedialQS
```
```swift
EXIHealthMetricName
```
```swift
EXIHealthCondition
```
```swift
EXIGender
```
```swift
EXICustomField
```
```swift
EXIActivityLevel
```
```swift
EXIActivityType
```
```swift
EXIActivity
```
```swift
EXIActivityGroup
```
```swift
EXIActivityLog
```
