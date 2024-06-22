class DoheModal {
  int doheId;
  String hindi, meaning, gujarati, english;

  DoheModal({
    required this.doheId,
    required this.hindi,
    required this.meaning,
    required this.gujarati,
    required this.english,
  });

  factory DoheModal.fromJson(Map m1) {
    return DoheModal(
        doheId: m1['doheId'],
        hindi: m1['hindi'],
        meaning: m1['meaning'],
        gujarati: m1["gujarati"],
        english: m1["english"]);
  }
}
