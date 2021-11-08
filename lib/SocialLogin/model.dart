// ================================================
//            M O D E L    I N D E X
// ================================================
//    R E Q U E S T
//    _____________
//    1. GoogleSignUpRequestModel

// ------------------------------------------------
//    R E S P O N S E
//    _______________
//    1. GoogleSignUpResponseModel
// keytool -exportcert -alias androiddebugkey -keystore "C:\Users\safvan\.android\debug.keystore" |"C:\Users\safvan\openssl\bin\openssl" sha1 -binary | "C:\Users\safvan\openssl\bin\openssl" base64

// keytool -exportcert -alias androiddebugkey -keystore "C:\Users\USERNAME\.android\debug.keystore" | "PATH_TO_OPENSSL_LIBRARY\bin\openssl" sha1 -binary | "PATH_TO_OPENSSL_LIBRARY\bin\openssl" base64
//    2.

// ================================================
// ------------------------------------------------
// ================================================
//    R E Q U E S T
// ================================================
// ------------------------------------------------

class GoogleSignUpRequestModel {
  String? userName;
  String? email;
  String? country;
  String? platform;
  String? authKey;
  // String? dp;

  GoogleSignUpRequestModel({
    this.userName,
    this.email,
    this.country,
    this.platform,
    this.authKey,
    // this.dp,
  });

  Map<String, dynamic> toJson() => {
        "username": userName,
        "email_id": email,
        "country": country,
        "platform": platform,
        "auth_key": authKey,
        // "dp": dp,
      };
}

class FacbookSignUpRequestModel {
  String? userName;
  String? email;
  String? country;
  String? platform;
  String? authKey;
  // String? dp;

  FacbookSignUpRequestModel({
    this.userName,
    this.email,
    this.country,
    this.platform,
    this.authKey,
    // this.dp,
  });

  Map<String, dynamic> toJson() => {
        "username": userName,
        "email_id": email,
        "country": country,
        "platform": platform,
        "auth_key": authKey,
        // "dp": dp,
      };
}

// ------------------------------------------------
// ================================================
//    R E S P O N S E
// ================================================
// ------------------------------------------------

class GoogleSignUpResponseModel {
  int? id;
  String? userName;
  String? email;
  String? language;
  String? primaryMobile;
  String? primaryMobileCode;
  String? secondaryMobile;
  String? secondaryMobileCode;
  String? userDp;
  bool? hideStatus;
  bool? oTPVerified;
  bool? shopUpgraded;
  String? rating;
  String? userType;
  int? user;
  int? countryId;
  int? currencyId;
  String? password;
  String? refreshToken;
  String? accessToken;

  GoogleSignUpResponseModel({
    this.id,
    this.userName,
    this.email,
    this.language,
    this.primaryMobile,
    this.primaryMobileCode,
    secondaryMobile,
    secondaryMobileCode,
    userDp,
    hideStatus,
    oTPVerified,
    shopUpgraded,
    rating,
    userType,
    user,
    countryId,
    currencyId,
    password,
    refreshToken,
    accessToken,
  });

  GoogleSignUpResponseModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userName = json["first_name"];
    email = json["email"];
    language = json["language"];
    primaryMobileCode = json["primary_mobile_code"];
    primaryMobile = json["primary_mobile"];
    secondaryMobileCode = json["secondary_mobile_code"];
    secondaryMobile = json["secondary_mobile"];
    userDp = json["dp"];
    oTPVerified = json["otp_verified"];
    hideStatus = json["hide_status"];
    shopUpgraded = json["shop_upgraded"];
    userType = json["user_type"];
    user = json["user"];
    countryId = json["country_id"];
    currencyId = json["currency_id"];
    accessToken = json["access_token"];
    refreshToken = json["refresh_token"];
  }
}
