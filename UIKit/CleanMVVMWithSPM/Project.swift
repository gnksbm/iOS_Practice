import ProjectDescription

let name = "CleanMVVMWithSPM"
let shortVersion = "1.0"
let version = "1.0"

let target = Target(
    name: name,
    platform: .iOS,
    product: .app,
    bundleId: "com.Pepsi-Club.YamYamPick",
    infoPlist: .extendingDefault(with:
        [
            "CFBundleDisplayName": .string(name),
            "CFBundleShortVersionString": .string(shortVersion),
            "CFBundleVersion": .string(version),
            "UILaunchStoryboardName": "LaunchScreen",
            "UIApplicationSceneManifest": [
                "UIApplicationSupportsMultipleScenes": false,
                "UISceneConfigurations": [
                    "UIWindowSceneSessionRoleApplication": [
                        [
                            "UISceneConfigurationName": "Default Configuration",
                            "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                        ],
                    ]
                ]
            ],
            "NAVER_CLIENT_ID": "$(NAVER_CLIENT_ID)",
            "NAVER_CLIENT_SECRET": "$(NAVER_CLIENT_SECRET)"
        ]
    ),
    sources: ["\(name)/Sources/**"],
    resources: ["\(name)/Resources/**"],
    dependencies: [
        .package(product: "Domain"),
        .package(product: "Data"),
        .package(product: "Presentation"),
        .package(product: "Network"),
        .package(product: "Core"),
//        .package(product: "RxSwift"),
//        .package(product: "RxCocoa"),
    ],
    settings: .settings(configurations: [
        .debug(name: .debug, xcconfig: "\(name)/Resources/Secret.xcconfig")
    ])
)

let project = Project(
    name: name,
    organizationName: "gnksbm",
    packages: [
        .local(path: .relativeToManifest("SPM")),
//        .package(
//            url: "https://github.com/ReactiveX/RxSwift",
//            .upToNextMajor(from: "6.0.0")
//        )
    ],
//    settings: <#T##Settings?#>,
    targets: [
        target
    ]
)
