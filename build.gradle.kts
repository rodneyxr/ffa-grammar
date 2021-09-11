plugins {
    `java-library-distribution`
    `maven-publish`
    antlr
}

group = "edu.utsa.fileflow"
version = "1.0"

repositories {
    mavenCentral()
}

dependencies {
    antlr("org.antlr:antlr4:4.5")
}

distributions {
    main {
        distributionBaseName.set("grammar")
    }
}

publishing {
    publications {
        create<MavenPublication>("grammar") {
            artifact(tasks.jar)
        }
    }
}