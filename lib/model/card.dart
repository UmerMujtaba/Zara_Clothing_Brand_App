class CardModel {
  String? id;
  String? cardHolderName;
  String? cvc;
  String? cardNumber;
  String? expiryDate;

  CardModel({
    this.id,
    this.cardHolderName,
    this.cvc,
    this.cardNumber,
    this.expiryDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cardHolderName': cardHolderName,
      'cvc': cvc,
      'cardNumber': cardNumber,
      'expiryDate': expiryDate,
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      id: map['id'],
      cardHolderName: map['cardHolderName'],
      cvc: map['cvc'],
      cardNumber: map['cardNumber'],
      expiryDate: map['expiryDate'],
    );
  }
}
