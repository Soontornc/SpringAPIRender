# เลือก Image ที่จะใช้ ในที่นี้เลือกใช้ openjdk:17-jdk-slim , 3maven:3.8.4-openjdk-17-slim
FROM openjdk:17-jdk-slim
FROM maven:3.8.4-openjdk-17-slim

# กำหนด directory ที่เราจะใช้เก็บโค้ดของเรา
WORKDIR /SpringAPI/app

# คัดลอกไฟล์ทั้งหมดไปยัง container
COPY . .

# Build โค้ดของเรา
RUN mvn clean package -DskipTests

# ตั้งค่า Environment Variables
ENV SPRING_DATASOURCE_URL=jdbc:postgresql://dpg-crbl6jtsvqrc73f20010-a.oregon-postgres.render.com:5432/gosampledb_ps0c
ENV SPRING_DATASOURCE_USERNAME=gosampledb_user
ENV SPRING_DATASOURCE_PASSWORD=o3D2GxzlG6w84oHe3ZaFUkzliC7FuBG4

# กำหนด port ที่เราจะใช้
EXPOSE 8080

# คำสั่งรัน Application Spring
ENTRYPOINT ["java","-jar","/SpringAPI/app/target/springboot-store-api-0.0.1-SNAPSHOT.jar"]