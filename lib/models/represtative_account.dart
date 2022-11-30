class RepresentativeAccount {
  bool? status;
  var errNum;
  var msg;
  Data? data;

  RepresentativeAccount({this.status, this.errNum, this.msg, this.data});

  RepresentativeAccount.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  var collectionBalance;
  var totalCommissions;

  Data({this.collectionBalance, this.totalCommissions});

  Data.fromJson(Map<String, dynamic> json) {
    collectionBalance = json['collection_balance'];
    totalCommissions = json['total_commissions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['collection_balance'] = this.collectionBalance;
    data['total_commissions'] = this.totalCommissions;
    return data;
  }
}