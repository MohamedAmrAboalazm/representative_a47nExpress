class RepresentativeModel {
 var id;
 var email;
 var phoneNumber;
 var isActive;
 var userType;
 var token;
 var createdAt;
 var updatedAt;

  RepresentativeModel(
      {this.id,
        this.email,
        this.phoneNumber,
        this.isActive,
        this.userType,
        this.token,
        this.createdAt,
        this.updatedAt,});

  RepresentativeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    isActive = json['is_active'];
    userType = json['user_type'];
    token = json['token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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

    return data;
  }
}


