FROM shoothzj/compile:jdk17-mvn AS compiler

RUN git clone --depth 1 https://github.com/apache/streampipes

RUN cd streampipes && \
mvn -B clean package -DskipTests

FROM shoothzj/base:jdk17

ENV STREAMPIPES_HOME /opt/streampipes

COPY --from=compiler /streampipes/streampipes-backend/target/streampipes-backend.jar /opt/streampipes/streampipes-backend.jar

WORKDIR /opt/streampipes
