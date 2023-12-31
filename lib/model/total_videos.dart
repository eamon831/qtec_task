class TotalVideos {
  int? totalVideos;


  // Private constructor
  TotalVideos._();

  // Singleton instance
  static final TotalVideos _instance = TotalVideos._();

  // Factory constructor to return the singleton instance
  factory TotalVideos() => _instance;

  // Deserialize from JSON
  factory TotalVideos.fromJson(Map<String, dynamic> json) {
    return TotalVideos()
      ..totalVideos = json['total'] as int?;

  }

  // Serialize to JSON
  Map<String, dynamic> toJson() {
    return {
      'totalVideos': totalVideos,

    };
  }

}