class DoheModal {
  int doheId;
  String hindi, meaning, gujarati, english;
  bool islike;

  DoheModal({
    required this.doheId,
    required this.hindi,
    required this.meaning,
    required this.gujarati,
    required this.english,
    required this.islike
  });

  factory DoheModal.fromJson(Map m1) {
    return DoheModal(
        doheId: m1['doheId'],
        hindi: m1['hindi'],
        meaning: m1['meaning'],
        gujarati: m1["gujarati"],
        english: m1["english"],
      islike: m1['like'],
    );
  }
}
