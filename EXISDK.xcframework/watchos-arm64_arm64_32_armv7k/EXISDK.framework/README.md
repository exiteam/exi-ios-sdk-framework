# EXI iOS SDK

## Table of Contents

1. [EXI iOS SDK](#EXIiOSSDK)
2. [Overview](#Overview)
2. [Introduction](#Introduction)
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

Minimum iOS Version Supported: iOS 14.3

## Introduction

SDK stands for software development kit or devkit for short.

It’s a set of software tools and programs used by developers to create applications for specific platforms. SDK tools will include a range of things, including libraries, documentation, code samples, processes, and guides that developers can use and integrate into their own apps. SDKs are designed to be used for specific platforms or programming languages.

## Purpose of SDK

The purpose of SDK is to avoid reusing code so that the development team can concentrate on creative work. SDK provides all of the necessary code that a user will need to build an application that uses API.


## Getting Started

To begin using our SDK, you will need to have an active account with us. Once you have an account, you can access the SDK documentation and download the SDK from our website.

## The EXI SDK

The EXI SDK is an exercise prescription SDK that delivers personalized exercises that are clinically validated and digitally delivered for people with or at risk of chronic conditions. It will deal with approximately 23 chronic conditions.

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

- Access CMS: https://cms.development.exi.health/
--  For other environments, replace .development with the environment you want i.e. .mobile
--  If you need access to the CMS, message anyone with access to send you an invite.
- Go to Organizations

![Import Package](Documentation/usage/org.png)

- Create a new org 

![Import Package](Documentation/usage/create_org.png)

- Go to the edit org page (only available in edit and not create phase)

![Import Package](Documentation/usage/edit_org.png)

- Go to API “subpage” in dropdown

![Import Package](Documentation/usage/api.png)

- Get the api key from there

## Get New JWS Token

![Import Package](Documentation/usage/jws.png)

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
```SH
:git => 'https://{git_username}@github.com/exiteam/exi-ios-framework.git',
:branch => 'pods'
```
`NOTE: Currently, pods are not pushed to the public cocoapods repo. These can be accessed only after authenticating with the user with access to the private repo.`

## Install using SPM
Importing EXISDK into Project

Step 1: Click on Xcode project file

Step 2: Click on Swift Packages and click on the plus to add a package

Step 3: Enter the following repository url 'https://github.com/exiteam/exi-ios-framework.git' and click next

Step 4: Leave the default settings to get the most recent release and click next to finish importing

```SH
Version: 0.0.1
```

![Import Package](Documentation/usage/spm.png)

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
    func getCustomFields() async -> EXIResult<[EXICustomField]>
```
##### Get health conditions
```swift
    func getHealthConditions() async -> EXIResult<[EXIHealthCondition]>
```
##### Get prescription
```swift
    func getPrescription() async -> EXIResult<EXIPrescription>
```
##### Get prescription for single week
```swift
    func getPrescription(week: Int) async -> EXIResult<EXIPrescription>
```
##### Get user badge according to week
```swift
    func getUserBadge(week: Int) async -> EXIResult<EXIBadge>
```
##### Get user profile
```swift
    func getUser() async -> EXIResult<EXIProfile>
```
##### Delete Account
```swift
    func deleteAccount() async -> EXIResult<Bool>
```
##### Restart prescription
```swift
    func restartPrescription() async -> EXIResult<EXIPrescription>
```
##### Update user profile
```swift
    func updateUser(user: EXIProfileRequest) async -> EXIResult<EXIProfile>
```
##### Get health condition details
```swift
    func getHealthCondition(conditionId: String) async -> EXIResult<EXIHealthCondition>
```
#####  Check prescription availability
```swift
    func isPrescriptionAvailable() async -> EXIResult<Bool>
```
#####  Get all activity groups
```swift
    func getActivityGroups(intensity: EXIIntensity) async -> EXIResult<[EXIActivityGroup]>
```
#####  Get all activities list
```swift
    func getAllActivities(intensity: EXIIntensity) async -> EXIResult<[EXIActivity]>
```
#####  Log activity
```swift
    func logActivity(request: EXILogActivityRequest) async -> EXIResult<EXIActivityLog>
```
#####  Get activities logs
```swift
    func getActivityLogs(loggedAt: String) async -> EXIResult<[EXIActivityLog]>
```
#####  Get user activities types
```swift
    func getUserActivityTypes(intensity: EXIIntensity) async -> EXIResult<[EXIActivityType]>
```
#####  Update health metrics
```swift
    func updateHealthMetrics(healthMetrics: [EXIHealthMetric]) async -> EXIResult<[EXIHealthMetric]>
```
#####  Log six minute walk test
```swift
    func logSixMinuteWalk(request: EXISixMinuteWalkRequest) async -> EXIResult<EXISixMinuteWalkLog>
```
#####  Get user health metrics
```swift
    func getUserHealthMetrics(startDate: String?, metrics: [EXIHealthMetricName]?) async -> EXIResult<[EXIUserHealthMetric]>
```
#####  Get due user health metrics
```swift
    func getDueHealthMetrics() async -> EXIResult<[EXIHealthMetricName]>
```
#####  Get trackable user health metrics
```swift
    func getTrackableHealthMetrics() async -> EXIResult<[EXIMetric]>
```
#####  Get Health records
```swift
    func getHealthRecords() async -> EXIResult<[EXIGraph]> 
```
#####  Get Analysis Report
```swift
    func getAnalysisReport() async -> EXIResult<String>
```
#####  Get Media URL
```swift
    func getMediaURL(key: String) async -> EXIResult<String>
```
#####  Get Weekly reward threshold
```swift
    func getRewardThreshold(week: Int) async -> EXIResult<EXIRewardWeekThreshold>
```
#####  Get Media URL
```swift
    func getRewardScheme(week: Int?) async -> EXIResult<EXIRewardScheme>
```
#####  Get reward code
```swift
    func generateCode(rewardId: String) async -> EXIResult<RewardWearableCode> 
```
#####  Claim reward
```swift
    func claimReward(presenter: UIViewController, theme: EXIThemeable? = nil, reward: EXIStoreFrontProvider) -> AnyPublisher<EXIStorefrontResponse, Never>
```
#####  Confirm reward delivery after receving reward
```swift
    public func confirmRewardDelivery(rewardId: String) async -> EXIResult<Bool>
```
#####  Request healthkit permission
```swift
    func requestHealthKitPermission() async throws -> Bool
```
#####  Check healthkit permissions status
```swift
    func healthKitPermissionGranted() async throws -> Bool
```
#####  Start workout/activity
```swift
    func startWorkout(activityType: Int?) async throws -> AnyPublisher<EXIWorkoutData, Never>
```
#####  Pause workout/activity
```swift
    func pauseWorkout() async
```
#####  Resume workout/activity
```swift
    func resumeWorkout() async
```
#####  Submit workout/activity
```swift
    func submitWorkout(metrics: [EXIActivityTrackingMetrics]? = nil) async throws
```
#####  Get steps count within range
```swift
    func fetchSteps(from: Date, to: Date) async throws -> Int?
```
#####  Sync workouts from connected sdks
```swift
    func syncWorkouts(since: Date) async
```
#####  Connect to a sdk/device
```swift
    func connect(clientId: String, callbackScheme: String, anchor: ASPresentationAnchor) async -> Bool
```
#####  Check if device/sdk is connected 
```swift
    func isConnected(device: EXIDevice) -> Bool
```
#####  Disconnect sdk/device
```swift
    func disconnect(device: EXIDevice) async -> Bool
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
    public var duration, heartRate, rpe, steps: Int?
    public var distance: Double?
    public init(loggedAt: String, activityType: String, duration: Int, heartRate: Int? = nil, rpe: Int? = nil, distance: Double? = nil, steps: Int? = nil) {
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

```swift
public struct EXISixMinuteWalkRequest: Codable, Equatable {
    public var heartBeatsPerMinute: Int?
    public var distance: Double
    public var loggedAt: String
    public var rpe, stepCount, timeInterval: Int?
    public var calorie: EXICalorie?
    public var path: [EXIGeoPoint]?
    public var heartRateTrace: [EXIHeartRateTrace]?
    public init(heartBeatsPerMinute: Int? = nil, distance: Double, loggedAt: String, rpe: Int? = nil, stepCount: Int? = nil, timeInterval: Int? = nil, calorie: EXICalorie? = nil, path: [EXIGeoPoint]? = nil, heartRateTrace: [EXIHeartRateTrace]? = nil) {
        self.heartBeatsPerMinute = heartBeatsPerMinute
        self.distance = distance
        self.loggedAt = loggedAt
        self.rpe = rpe
        self.stepCount = stepCount
        self.timeInterval = timeInterval
        self.calorie = calorie
        self.path = path
        self.heartRateTrace = heartRateTrace
    }
}
```

##### HealthKit read types:

```swift    
        HKObjectType.electrocardiogramType(),
        HKObjectType.quantityType(forIdentifier: .activeEnergyBurned),
        HKObjectType.quantityType(forIdentifier: .appleExerciseTime),
        HKObjectType.quantityType(forIdentifier: .basalEnergyBurned),
        HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning),
        HKObjectType.categoryType(forIdentifier: .highHeartRateEvent),
        HKObjectType.quantityType(forIdentifier: .heartRate),
        HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN),
        HKObjectType.categoryType(forIdentifier: .irregularHeartRhythmEvent),
        HKObjectType.categoryType(forIdentifier: .lowHeartRateEvent),
        HKObjectType.categoryType(forIdentifier: .lowCardioFitnessEvent),
        HKObjectType.quantityType(forIdentifier: .oxygenSaturation),
        HKObjectType.quantityType(forIdentifier: .respiratoryRate),
        HKObjectType.quantityType(forIdentifier: .restingHeartRate),
        HKObjectType.quantityType(forIdentifier: .sixMinuteWalkTestDistance),
        HKObjectType.categoryType(forIdentifier: .sleepAnalysis),
        HKObjectType.quantityType(forIdentifier: .stairAscentSpeed),
        HKObjectType.quantityType(forIdentifier: .stairDescentSpeed),
        HKObjectType.quantityType(forIdentifier: .stepCount),
        HKObjectType.quantityType(forIdentifier: .vo2Max),
        HKObjectType.quantityType(forIdentifier: .walkingAsymmetryPercentage),
        HKObjectType.quantityType(forIdentifier: .walkingHeartRateAverage),
        HKObjectType.quantityType(forIdentifier: .walkingDoubleSupportPercentage),
        HKObjectType.quantityType(forIdentifier: .walkingSpeed),
        HKObjectType.quantityType(forIdentifier: .walkingStepLength),
        HKObjectType.characteristicType(forIdentifier: .dateOfBirth),
        HKObjectType.characteristicType(forIdentifier: .biologicalSex),
        HKQuantityType.workoutType(),
        HKSeriesType.workoutRoute()
``` 

##### HealthKit write types:
   
```swift   
        HKObjectType.quantityType(forIdentifier: .stepCount),
        HKObjectType.quantityType(forIdentifier: .heartRate),
        HKObjectType.quantityType(forIdentifier: .sixMinuteWalkTestDistance),
        HKSampleType.workoutType(),
        HKSeriesType.workoutRoute()
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
