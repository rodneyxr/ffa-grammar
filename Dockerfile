FROM docker.io/library/gradle:7-jre16
COPY gradle.properties .
COPY build.gradle.kts .
COPY src/ .

# Create grammar-VERSION.jar in '/home/gradle/build/libs' by default
ENTRYPOINT ["gradle"]
CMD ["jar"]