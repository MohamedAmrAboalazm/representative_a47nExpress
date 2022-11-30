class NoteModel {
  bool? status;
  var errNum;
  var msg;
  Shipment? shipment;

  NoteModel({this.status, this.errNum, this.msg, this.shipment});

  NoteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    shipment = json['shipment'] != null
        ? new Shipment.fromJson(json['shipment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.shipment != null) {
      data['shipment'] = this.shipment!.toJson();
    }
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
