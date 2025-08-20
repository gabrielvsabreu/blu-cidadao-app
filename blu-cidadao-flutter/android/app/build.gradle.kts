plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android") // Plugin oficial do Kotlin
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.blu_cidadao"
    compileSdk = 34
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    defaultConfig {
        applicationId = "com.example.blu_cidadao"
        minSdk = 21
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    //source("../..")
}
