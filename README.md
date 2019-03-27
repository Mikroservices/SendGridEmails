# :email: Letterer - Emails

Microservice for sending emails from Letterer system.

## API

### Sending email

Endpoint is responsible for sending emails.

**PATH**

```
POST /emails
```

**REQUEST BODY**

| Object   | Description                     |
|----------|---------------------------------|
| EmailDto | JSON object with email details. |

**REQUEST PARAMETERS**

No parameters.

## Schema definitions

### EmailDto

| Property | Type             | Description                                   |
|----------|------------------|-----------------------------------------------|
| to       | EmailAddressDto  | The recipient's email address.                |
| from     | EmailAddressDto? | Sender's email address.                       |
| replyTo  | EmailAddressDto? | Email address where responses should be send. |
| title    | String           | Email title.                                  |
| body     | String           | Email body.                                   |

### EmailAddressDto

| Property | Type    | Description            |
|----------|---------|------------------------|
| address  | String  | Email address.         |
| name     | String? | Recipient/sender name. |

## Developing

Downloading source code and building in command line:

```bash
$ git clone https://github.com/Letterer/Emails.git
$ swift package update
$ swift build
```
Opening project in XCode:

```bash
$ swift package generate-xcodeproj
$ open Emails.xcodeproj
```

Before running service you need to set one environment variable: `LETTERER_SENDGRID_KEY`.
This is secret key genereted by Sendgrid service. Running service:

```bash
$ .build/debug/Run --port 8001
```

## Contributing

You can fork and clone repository. Do your changes and pull a request.

