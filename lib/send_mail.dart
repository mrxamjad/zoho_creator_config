import 'package:dio/dio.dart';
import 'dart:math';

void sendEmail(
    {required String receiver,
    required String subject,
    required String body,
    bool isBody = true,
    String? otp}) async {
  try {
    var dio = Dio();

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization':
          'Zoho-enczapikey PHtE6r1YF++93zF9pxEHs/K6E8GhYNx9rLllfQRP5YtEC/RVTE1QrtEiwzO/q0stU/hCF6PJwYNgs72ds+rULG7rYGtECGqyqK3sx/VYSPOZsbq6x00bsFgTdEzcU4Lqc9dq1SzRv9reNA==',
    };

    var data = {
      "from": {"address": "gallus@rapteemotors.com"},
      "to": [
        {
          "email_address": {
            "address": receiver,
            "name": "Amjad",
          }
        }
      ],
      "subject": subject,
      "htmlbody": !isBody ? getHtmlBody(otp!) : "<div><b> $body. </b></div>",
    };

    var response = await dio.post(
      'https://api.zeptomail.in/v1.1/email',
      data: data,
      options: Options(headers: headers),
    );

    print('Response: $response');
  } catch (e) {
    print('Error: $e');
  }
}

String generateRandomNumber() {
  Random random = Random();
  String randomNumber;

  do {
    randomNumber = (random.nextInt(900000) + 100000).toString();
  } while (randomNumber.startsWith('0'));

  return randomNumber;
}

String getHtmlBody(String otp) {
  return """
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>OTP Verification</title>
  <style>
    body {
      font-family: 'Helvetica Neue', Arial, sans-serif;
      background-color: #f7f7f7;
      margin: 0;
      padding: 0;
    }

    .container {
      max-width: 600px;
      margin: 0 auto;
      background-color: #ffffff;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    }

    h1 {
      color: #008080;
      text-align: center;
      margin-bottom: 30px;
    }

    p {
      color: #666666;
      line-height: 1.6;
      margin-bottom: 20px;
    }

    a {
      color: #008080;
      text-decoration: none;
    }

    .otp {
      font-size: 36px;
      font-weight: bold;
      color: #008080;
      text-align: center;
      margin: 30px 0;
      padding: 20px;
      background-color: #e0f7f7;
      border-radius: 5px;
    }
    .company-name{
      background-color: #e0f7f7;
      font-size: 36px;
      font-weight: bold;
      color: #008080;
      
    }

    .timer {
      font-size: 18px;
      color: #999999;
      text-align: center;
      margin-bottom: 30px;
    }

    .illustration {
      text-align: center;
      margin-bottom: 30px;
    }

    .illustration img {
      max-width: 200px;
      height: auto;
    }

    .footer {
      text-align: center;
      margin-top: 30px;
      font-size: 16px;
    }

    /* Media Queries */
    @media (max-width: 600px) {
      .container {
        padding: 20px;
      }

      .otp {
        font-size: 28px;
        padding: 15px;
      }

      .illustration img {
        max-width: 150px;
      }
    }

    @media (max-width: 400px) {
      .otp {
        font-size: 24px;
      }
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="illustration">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKPtrKO7tYdTnfD_M1cAHmsYhK4kohRR_q7vWnBNJLyZyN2KddSCTR8HJ25tM3S5AmcA&usqp=CAU" alt="Illustration">
    </div>
    <h1>OTP Verification</h1>
    <p>Dear User,</p>
    <p>You have requested for a one-time password (OTP) to verify your account. Please use the following OTP:</p>
    <div class="otp">$otp</div>
    <div class="timer">This OTP will expire in 2 minutes.</div>
    <p>If you did not request for an OTP, please ignore this email.</p>
    <p>Thank you for using our service.</p>
    <p>Best regards,<br class="company-name">RAPTEE</p>
  </div>
  <div class="footer">
    <a href="https://www.raptee.com" target="_blank">www.raptee.com</a>
  </div>
</body>
</html>

""";
}
