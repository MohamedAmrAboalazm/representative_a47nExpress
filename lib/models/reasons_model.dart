class ReasonsModel {
  bool? status;
  var errNum;
  var msg;
  List<Reason>? reason;

  ReasonsModel({this.status, this.errNum, this.msg, this.reason});

  ReasonsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['reason'] != null) {
      reason = <Reason>[];
      json['reason'].forEach((v) {
        reason!.add(new Reason.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.reason != null) {
      data['reason'] = this.reason!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reason {
  var id;
  var name;
  var createdAt;
  var updatedAt;

  Reason({this.id, this.name, this.createdAt, this.updatedAt});

  Reason.fromJson(Map<String, dynamic> json) {
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
