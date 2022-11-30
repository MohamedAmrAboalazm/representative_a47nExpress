class UserDataModel {
  var accessToken;
  var tokenType;
 var expiresIn;
  User? user;

  UserDataModel({this.accessToken, this.tokenType, this.expiresIn, this.user});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
 var id;
  var email;
  var phoneNumber;
  var isActive;
  var userType;
  var token;
  var createdAt;
  var updatedAt;
  UserData? userData;

  User(
      {this.id,
        this.email,
        this.phoneNumber,
        this.isActive,
        this.userType,
        this.token,
        this.createdAt,
        this.updatedAt,
        this.userData});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    isActive = json['is_active'];
    userType = json['user_type'];
    token = json['token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['is_active'] = this.isActive;
    data['user_type'] = this.userType;
    data['token'] = this.token;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    return data;
  }
}

class UserData {
 var id;
  var name;
  var address;
  var photo;
  var licensePhoto;
  var nationalId;
 var commission;
 var salary;
 var isActive;
 var userId;
 var cityId;
  var createdAt;
  var updatedAt;
  var imagePath;
  var licensePhotoPath;
  var fishPhotoPath;
  var cvPath;

  UserData(
      {this.id,
        this.name,
        this.address,
        this.photo,
        this.licensePhoto,
        this.nationalId,
        this.commission,
        this.salary,
        this.isActive,
        this.userId,
        this.cityId,
        this.createdAt,
        this.updatedAt,
        this.imagePath,
        this.licensePhotoPath,
        this.fishPhotoPath,
        this.cvPath});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    photo = json['photo'];
    licensePhoto = json['license_photo'];
    nationalId = json['national_id'];
    commission = json['commission'];
    salary = json['salary'];
    isActive = json['is_active'];
    userId = json['user_id'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imagePath = json['image_path'];
    licensePhotoPath = json['license_photo_path'];
    fishPhotoPath = json['fish_photo_path'];
    cvPath = json['cv_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['photo'] = this.photo;
    data['license_photo'] = this.licensePhoto;
    data['national_id'] = this.nationalId;
    data['commission'] = this.commission;
    data['salary'] = this.salary;
    data['is_active'] = this.isActive;
    data['user_id'] = this.userId;
    data['city_id'] = this.cityId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_path'] = this.imagePath;
    data['license_photo_path'] = this.licensePhotoPath;
    data['fish_photo_path'] = this.fishPhotoPath;
    data['cv_path'] = this.cvPath;
    return data;
  }
}
