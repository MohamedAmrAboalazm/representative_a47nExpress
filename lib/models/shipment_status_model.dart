class ShipmentStatusModel {
  bool? status;
 var errNum;
 var msg;
  List<ShipmentStatuRepresentative>? shipmentStatuRepresentative;

  ShipmentStatusModel(
      {this.status, this.errNum, this.msg, this.shipmentStatuRepresentative});

  ShipmentStatusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['Shipment_Statu_Representative'] != null) {
      shipmentStatuRepresentative = <ShipmentStatuRepresentative>[];
      json['Shipment_Statu_Representative'].forEach((v) {
        shipmentStatuRepresentative!
            .add(new ShipmentStatuRepresentative.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.shipmentStatuRepresentative != null) {
      data['Shipment_Statu_Representative'] =
          this.shipmentStatuRepresentative!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShipmentStatuRepresentative {
  int? id;
 var name;
 var createdAt;
 var updatedAt;

  ShipmentStatuRepresentative(
      {this.id, this.name, this.createdAt, this.updatedAt});

  ShipmentStatuRepresentative.fromJson(Map<String, dynamic> json) {
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
