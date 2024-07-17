class AddressModel {
    String? address;
    List<Amount>? amount;
    String? stakeAddress;
    String? type;
    bool? script;

    AddressModel({
        this.address,
        this.amount,
        this.stakeAddress,
        this.type,
        this.script,
    });

    factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        address: json["address"],
        amount: json["amount"] == null ? [] : List<Amount>.from(json["amount"]!.map((x) => Amount.fromJson(x))),
        stakeAddress: json["stake_address"],
        type: json["type"],
        script: json["script"],
    );

}

class Amount {
    String? unit;
    String? quantity;

    Amount({
        this.unit,
        this.quantity,
    });

    factory Amount.fromJson(Map<String, dynamic> json) => Amount(
        unit: json["unit"],
        quantity: json["quantity"],
    );

  
}
