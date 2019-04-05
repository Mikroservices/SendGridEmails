# :email: Mikroservices - SendGridEmails

Microservice for sending emails via SendGrid system.

## API

### Sending email

Endpoint is responsible for sending emails.

**Request**

```
METHOD: POST
URL: /emails
BODY:
{
    "to": {
        "address": "john.doe@email.com",
        "name": "John Doe"
    },
    "from": {
        "address": "anna.doe@email.com",
        "name": "Anna Doe"
    },
    "replyTo": {
        "address": "john.doe@email.com",
        "name": "John Doe"
    },
    "title": "Important message",
    "body": "Hi. This is my message..."
}
```

**Response**

```
STATUS: 200 (Ok)
```

## Developing

Downloading source code and building in command line:

```bash
$ git clone https://github.com/Mikroservices/SendGridEmails.git
$ swift package update
$ swift build
```
Opening project in XCode:

```bash
$ swift package generate-xcodeproj
$ open SendGridEmails.xcodeproj
```

Before running service you need to set one environment variable: `MIKROSERVICE_SENDGRIDEMAILS_KEY`.
This is secret key genereted by Sendgrid service. Running service:

```bash
$ .build/debug/Run --port 8002
```

## Contributing

You can fork and clone repository. Do your changes and pull a request.

