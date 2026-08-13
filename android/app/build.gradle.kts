plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.nexus.store.flutter_ecommerce"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.nexus.store.flutter_ecommerce"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

// Copy the built APK to a stable, easy-to-find location after each assemble.
// Classic API still supported in AGP 9.0.1.
afterEvaluate {
    android.applicationVariants.forEach { variant ->
        variant.outputs.forEach { output ->
            val copyTask = tasks.register(
                "copy${variant.name.replaceFirstChar { it.uppercase() }}Apk",
                Copy::class
            ) {
                from(output.outputFile)
                into(File(rootProject.projectDir, "../build/apk"))
                rename { "NexusStore-${variant.name}.apk" }
            }
            // copyTask must depend on the package task whose output it reads.
            copyTask.configure { dependsOn(variant.packageApplicationProvider) }
            variant.assembleProvider.configure { dependsOn(copyTask) }
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}
