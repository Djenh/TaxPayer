class InvoiceCheckTinRequire {
  bool? decision;
  String? comment;

  InvoiceCheckTinRequire({
    this.decision,
    this.comment,
  });

  factory InvoiceCheckTinRequire.fromJson(Map<String, dynamic> json) => InvoiceCheckTinRequire(
    decision: json["decision"],
    comment: json["comment"],
  );

  Map<String, dynamic> toJson() => {
    "decision": decision,
    "comment": comment,
  };
}