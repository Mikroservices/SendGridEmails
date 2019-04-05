FROM swift:4.2
LABEL Description="Mikroservice SendGridEmails" Vendor="Marcin Czachurski" Version="1.0"

ADD . /emails
WORKDIR /emails

RUN swift build --configuration release
EXPOSE 8002
ENTRYPOINT [".build/release/Run", "--port", "8002", "--hostname", "0.0.0.0"]