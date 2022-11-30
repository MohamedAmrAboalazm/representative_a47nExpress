class ShipmentModel {
  bool? status;
  var errNum;
  var msg;
  List<ShipmentRepresentative>? shipmentRepresentative;

  ShipmentModel(
      {this.status, this.errNum, this.msg, this.shipmentRepresentative});

  ShipmentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['Shipment_Representative'] != null) {
      shipmentRepresentative = <ShipmentRepresentative>[];
      json['Shipment_Representative'].forEach((v) {
        shipmentRepresentative!.add(new ShipmentRepresentative.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.shipmentRepresentative != null) {
      data['Shipment_Representative'] =
          this.shipmentRepresentative!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShipmentRepresentative {
  var id;
  var nameShipment;
  var description;
  var customerCode;
  var productPrice;
  var orderNumber;
  var count;
  var shippingPrice;
  var returnPrice;
  var weight;
  var size;
  var notes;
  var deliveryDate;
  var clientId;
  var areaId;
  var serviceTypeId;
  var storeId;
  var shipmentStatusId;
  var representativeId;
  var senderId;
  var additionalServiceId;
  var reasonId;
  var end;
  var createdAt;
  var updatedAt;
  var totalShipment;
  dynamic area;
  dynamic client;
  dynamic representative;
  dynamic shipmentstatu;
  var additionalservice;
  dynamic store;
  dynamic user;

  ShipmentRepresentative(
      {this.id,
        this.nameShipment,
        this.description,
        this.customerCode,
        this.productPrice,
        this.orderNumber,
        this.count,
        this.shippingPrice,
        this.returnPrice,
        this.weight,
        this.size,
        this.notes,
        this.deliveryDate,
        this.clientId,
        this.areaId,
        this.serviceTypeId,
        this.storeId,
        this.shipmentStatusId,
        this.representativeId,
        this.senderId,
        this.additionalServiceId,
        this.reasonId,
        this.end,
        this.createdAt,
        this.updatedAt,
        this.totalShipment,
        this.area,
        this.client,
        this.representative,
        this.shipmentstatu,
        this.additionalservice,
        this.store,
        this.user});

  ShipmentRepresentative.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameShipment = json['name_shipment'];
    description = json['description'];
    customerCode = json['customer_code'];
    productPrice = json['product_price'];
    orderNumber = json['order_number'];
    count = json['count'];
    shippingPrice = json['shipping_price'];
    returnPrice = json['return_price'];
    weight = json['weight'];
    size = json['size'];
    notes = json['notes'];
    deliveryDate = json['delivery_date'];
    clientId = json['client_id'];
    areaId = json['area_id'];
    serviceTypeId = json['service_type_id'];
    storeId = json['store_id'];
    shipmentStatusId = json['shipment_status_id'];
    representativeId = json['representative_id'];
    senderId = json['sender_id'];
    additionalServiceId = json['additional_service_id'];
    reasonId = json['reason_id'];
    end = json['end'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    totalShipment = json['total_shipment'];
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
    representative = json['representative'] != null
        ? new Representative.fromJson(json['representative'])
        : null;
    shipmentstatu = json['shipmentstatu'] != null
        ? new Shipmentstatu.fromJson(json['shipmentstatu'])
        : null;
    additionalservice = json['additionalservice'];
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_shipment'] = this.nameShipment;
    data['description'] = this.description;
    data['customer_code'] = this.customerCode;
    data['product_price'] = this.productPrice;
    data['order_number'] = this.orderNumber;
    data['count'] = this.count;
    data['shipping_price'] = this.shippingPrice;
    data['return_price'] = this.returnPrice;
    data['weight'] = this.weight;
    data['size'] = this.size;
    data['notes'] = this.notes;
    data['delivery_date'] = this.deliveryDate;
    data['client_id'] = this.clientId;
    data['area_id'] = this.areaId;
    data['service_type_id'] = this.serviceTypeId;
    data['store_id'] = this.storeId;
    data['shipment_status_id'] = this.shipmentStatusId;
    data['representative_id'] = this.representativeId;
    data['sender_id'] = this.senderId;
    data['additional_service_id'] = this.additionalServiceId;
    data['reason_id'] = this.reasonId;
    data['end'] = this.end;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['total_shipment'] = this.totalShipment;
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    if (this.representative != null) {
      data['representative'] = this.representative!.toJson();
    }
    if (this.shipmentstatu != null) {
      data['shipmentstatu'] = this.shipmentstatu!.toJson();
    }
    data['additionalservice'] = this.additionalservice;
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Area {
  var id;
  var name;
  var provinceId;
  var createdAt;
  var updatedAt;

  Area({this.id, this.name, this.provinceId, this.createdAt, this.updatedAt});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    provinceId = json['province_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['province_id'] = this.provinceId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Client {
  var id;
  var name;
  var email2;
  var address;
  var phone;
  var phone2;
  var photo;
  var googleLocation;
  var userId;
  var cityId;
  var createdAt;
  var updatedAt;
  var imagePath;

  Client(
      {this.id,
        this.name,
        this.email2,
        this.address,
        this.phone,
        this.phone2,
        this.photo,
        this.googleLocation,
        this.userId,
        this.cityId,
        this.createdAt,
        this.updatedAt,
        this.imagePath});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email2 = json['email_2'];
    address = json['address'];
    phone = json['phone'];
    phone2 = json['phone_2'];
    photo = json['photo'];
    googleLocation = json['google_location'];
    userId = json['user_id']??0;
    cityId = json['city_id']??0;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email_2'] = this.email2;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['phone_2'] = this.phone2;
    data['photo'] = this.photo;
    data['google_location'] = this.googleLocation;
    data['user_id'] = this.userId;
    data['city_id'] = this.cityId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_path'] = this.imagePath;
    return data;
  }
}

class Representative {
  var id;
  var name;
  var address;
  var photo;
  var licensePhoto;
  var fishPhoto;
  var nationalId;
  var wallet;
  var salary;
  var commission;
  var isActive;
  var cv;
  var userId;
  var cityId;
  var createdAt;
  var updatedAt;
  var imagePath;
  var licensePhotoPath;
  var fishPhotoPath;
  var cvPath;
  dynamic user;

  Representative(
      {this.id,
        this.name,
        this.address,
        this.photo,
        this.licensePhoto,
        this.fishPhoto,
        this.nationalId,
        this.wallet,
        this.salary,
        this.commission,
        this.isActive,
        this.cv,
        this.userId,
        this.cityId,
        this.createdAt,
        this.updatedAt,
        this.imagePath,
        this.licensePhotoPath,
        this.fishPhotoPath,
        this.cvPath,
        this.user});

  Representative.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    photo = json['photo'];
    licensePhoto = json['license_photo'];
    fishPhoto = json['fish_photo'];
    nationalId = json['national_id'];
    wallet = json['wallet'];
    salary = json['salary'];
    commission = json['commission'];
    isActive = json['is_active'];
    cv = json['cv'];
    userId = json['user_id'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imagePath = json['image_path'];
    licensePhotoPath = json['license_photo_path'];
    fishPhotoPath = json['fish_photo_path'];
    cvPath = json['cv_path'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['photo'] = this.photo;
    data['license_photo'] = this.licensePhoto;
    data['fish_photo'] = this.fishPhoto;
    data['national_id'] = this.nationalId;
    data['wallet'] = this.wallet;
    data['salary'] = this.salary;
    data['commission'] = this.commission;
    data['is_active'] = this.isActive;
    data['cv'] = this.cv;
    data['user_id'] = this.userId;
    data['city_id'] = this.cityId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_path'] = this.imagePath;
    data['license_photo_path'] = this.licensePhotoPath;
    data['fish_photo_path'] = this.fishPhotoPath;
    data['cv_path'] = this.cvPath;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  var id;
  var email;
  var emailVerifiedAt;
  var phoneNumber;
  var isActive;
  var userType;
  var token;
  var firebaseId;
  var createdAt;
  var updatedAt;
  dynamic userData;

  User(
      {this.id,
        this.email,
        this.emailVerifiedAt,
        this.phoneNumber,
        this.isActive,
        this.userType,
        this.token,
        this.firebaseId,
        this.createdAt,
        this.updatedAt,
        this.userData});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phoneNumber = json['phone_number'];
    isActive = json['is_active'];
    userType = json['user_type'];
    token = json['token'];
    firebaseId = json['firebase_id'];
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
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone_number'] = this.phoneNumber;
    data['is_active'] = this.isActive;
    data['user_type'] = this.userType;
    data['token'] = this.token;
    data['firebase_id'] = this.firebaseId;
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
  var fishPhoto;
  var nationalId;
  var wallet;
  var salary;
  var commission;
  var isActive;
  var cv;
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
        this.fishPhoto,
        this.nationalId,
        this.wallet,
        this.salary,
        this.commission,
        this.isActive,
        this.cv,
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
    fishPhoto = json['fish_photo'];
    nationalId = json['national_id'];
    wallet = json['wallet'];
    salary = json['salary'];
    commission = json['commission'];
    isActive = json['is_active'];
    cv = json['cv'];
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
    data['fish_photo'] = this.fishPhoto;
    data['national_id'] = this.nationalId;
    data['wallet'] = this.wallet;
    data['salary'] = this.salary;
    data['commission'] = this.commission;
    data['is_active'] = this.isActive;
    data['cv'] = this.cv;
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

class Shipmentstatu {
  var id;
  var name;
  var createdAt;
  var updatedAt;

  Shipmentstatu({this.id, this.name, this.createdAt, this.updatedAt});

  Shipmentstatu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Store {
  var id;
  var name;
  var phone;
  var address;
  var brancheId;
  var employeeId;
  var createdAt;
  var updatedAt;

  Store(
      {this.id,
        this.name,
        this.phone,
        this.address,
        this.brancheId,
        this.employeeId,
        this.createdAt,
        this.updatedAt});

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    brancheId = json['branche_id'];
    employeeId = json['employee_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['branche_id'] = this.brancheId;
    data['employee_id'] = this.employeeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}