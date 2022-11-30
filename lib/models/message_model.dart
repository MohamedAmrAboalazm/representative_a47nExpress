class MessageModel
{

  String? text;
  String? dateTime;
  int? senderuId;
  int? receiveruId;


 MessageModel({this.receiveruId, this.senderuId, this.text,this.dateTime });

 MessageModel.fromJson( Map<String,dynamic>? json)
  {
    senderuId=json?["senderuId"];
    receiveruId=json?["receiveruId"];
    text=json?["text"];
    dateTime=json?["dateTime"];
  }
  Map<String,dynamic> toMap()
  {
    return
      {
        "senderuId":senderuId,
        "receiveruId":receiveruId,
        "text":text,
        "dateTime":dateTime,


      };
  }

}
