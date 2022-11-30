class RepresenativeShipmentId {
  bool? status;
  var errNum;
  var msg;
  List<Detali>? detali;

  RepresenativeShipmentId({this.status, this.errNum, this.msg, this.detali});

  RepresenativeShipmentId.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['detali'] != null) {
      detali = <Detali>[];
      json['detali'].forEach((v) {
        detali!.add(new Detali.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.detali != null) {
      data['detali'] = this.detali!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Detali {
  var id;
  var representativeId;
  var shipmentId;
  var shipmentStatusId;
  var storeId;
  var createdAt;
  var updatedAt;
  Representative? representative;
  Shipment? shipment;
  Shipmentstatu? shipmentstatu;
  Store? store;

  Detali(
      {this.id,
        this.representativeId,
        this.shipmentId,
        this.shipmentStatusId,
        this.storeId,
        this.createdAt,
        this.updatedAt,
        this.representative,
        this.shipment,
        this.shipmentstatu,
        this.store});

  Detali.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    representativeId = json['representative_id'];
    shipmentId = json['shipment_id'];
    shipmentStatusId = json['shipment_status_id'];
    storeId = json['store_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    representative = json['representative'] != null
        ? new Representative.fromJson(json['representative'])
        : null;
    shipment = json['shipment'] != null
        ? new Shipment.fromJson(json['shipment'])
        : null;
    shipmentstatu = json['shipmentstatu'] != null
        ? new Shipmentstatu.fromJson(json['shipmentstatu'])
        : null;
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['representative_id'] = this.representativeId;
    data['shipment_id'] = this.shipmentId;
    data['shipment_status_id'] = this.shipmentStatusId;
    data['store_id'] = this.storeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.representative != null) {
      data['representative'] = this.representative!.toJson();
    }
    if (this.shipment != null) {
      data['shipment'] = this.shipment!.toJson();
    }
    if (this.shipmentstatu != null) {
      data['shipmentstatu'] = this.shipmentstatu!.toJson();
    }
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
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
  User? user;

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
  UserData? userData;

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

class Shipment {
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

  Shipment(
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
        this.totalShipment});

  Shipment.fromJson(Map<String, dynamic> json) {
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
