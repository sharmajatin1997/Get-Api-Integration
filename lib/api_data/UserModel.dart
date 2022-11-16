class UserModel {
  int? id;
  String? role;
  String? name;
  String? companyName;
  String? email;
  String? phone;
  String? countryCode;
  String? password;
  String? notificationSent;
  String? image;
  String? status;
  String? rememberToken;
  String? deviceType;
  String? deviceToken;
  String? mailSent;
  String? isApproved;
  String? teamConnected;
  int? otp;
  int? isVerify;
  String? forgotPasswordHash;
  String? latitude;
  String? longitude;
  String? location;
  String? createdAt;
  int? supervisorId;
  String? updatedAt;

  UserModel(
      {this.id,
      this.role,
      this.name,
      this.companyName,
      this.email,
      this.phone,
      this.countryCode,
      this.password,
      this.notificationSent,
      this.image,
      this.status,
      this.rememberToken,
      this.deviceType,
      this.deviceToken,
      this.mailSent,
      this.isApproved,
      this.teamConnected,
      this.otp,
      this.isVerify,
      this.forgotPasswordHash,
      this.latitude,
      this.longitude,
      this.location,
      this.createdAt,
      this.supervisorId,
      this.updatedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    name = json['name'];
    companyName = json['company_name'];
    email = json['email'];
    phone = json['phone'];
    countryCode = json['country_code'];
    password = json['password'];
    notificationSent = json['notification_sent'];
    image = json['image'];
    status = json['status'];
    rememberToken = json['rememberToken'];
    deviceType = json['device_type'];
    deviceToken = json['device_token'];
    mailSent = json['mail_sent'];
    isApproved = json['is_approved'];
    teamConnected = json['team_connected'];
    otp = json['otp'];
    isVerify = json['is_verify'];
    forgotPasswordHash = json['forgotPasswordHash'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    location = json['location'];
    createdAt = json['createdAt'];
    supervisorId = json['supervisor_id'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role'] = this.role;
    data['name'] = this.name;
    data['company_name'] = this.companyName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['country_code'] = this.countryCode;
    data['password'] = this.password;
    data['notification_sent'] = this.notificationSent;
    data['image'] = this.image;
    data['status'] = this.status;
    data['rememberToken'] = this.rememberToken;
    data['device_type'] = this.deviceType;
    data['device_token'] = this.deviceToken;
    data['mail_sent'] = this.mailSent;
    data['is_approved'] = this.isApproved;
    data['team_connected'] = this.teamConnected;
    data['otp'] = this.otp;
    data['is_verify'] = this.isVerify;
    data['forgotPasswordHash'] = this.forgotPasswordHash;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['location'] = this.location;
    data['createdAt'] = this.createdAt;
    data['supervisor_id'] = this.supervisorId;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
