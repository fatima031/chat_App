class MessageModel {
  String? sender;
  String? text;
  bool? seen;
  DateTime? createdOn;

  MessageModel({this.sender, this.text, this.seen, this.createdOn, required messageid, required DateTime createdon});

  MessageModel.fromMap(Map<String, dynamic> map) {
    sender = map["Sender"];
    text = map["text"];
    seen = map["seen"];
    createdOn = map["created on"].toDate();
  }

  String? get messageid => null;

  Map<String, dynamic> toMap() {
    return {
      "sender": sender,
      "text": text,
      "seen": seen,
      "created on": createdOn
    };
  }
}
