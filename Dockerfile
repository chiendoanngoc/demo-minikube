# Sử dụng image base là Maven để build ứng dụng
FROM maven:3.8.6-openjdk-18-slim AS build

# Thiết lập thư mục làm việc
WORKDIR /app

# Sao chép file `pom.xml` vào thư mục làm việc
COPY pom.xml .

# Sao chép các tệp Maven vào thư mục làm việc
COPY src ./src

# Build ứng dụng sử dụng Maven
RUN mvn package

# Sử dụng image base là OpenJDK 18
FROM maven:3.8.6-openjdk-18-slim

# Thiết lập thư mục làm việc
WORKDIR /app

# Sao chép file JAR đã build từ image Maven vào image Java
COPY --from=build /app/target/*.jar app.jar

# Câu lệnh entrypoint để chạy ứng dụng Spring Boot khi container được khởi động
ENTRYPOINT ["java", "-jar", "app.jar"]
