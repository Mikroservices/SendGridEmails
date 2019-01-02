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
