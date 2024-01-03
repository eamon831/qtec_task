class VideoModel {
  String? thumbnail;
  int? id;
  String? title;
  DateTime? dateAndTime;
  String? slug;
  DateTime? createdAt;
  String? manifest;
  int? liveStatus;
  String? liveManifest;
  bool? isLive;
  String? channelImage;
  String? channelName;
  String? channelUsername;
  bool? isVerified;
  String? channelSlug;
  String? channelSubscriber;
  int? channelId;
  String? type;
  String? viewers;
  String? duration;
  String? objectType;

  VideoModel({
    this.thumbnail,
    this.id,
    this.title,
    this.dateAndTime,
    this.slug,
    this.createdAt,
    this.manifest,
    this.liveStatus,
    this.liveManifest,
    this.isLive,
    this.channelImage,
    this.channelName,
    this.channelUsername,
    this.isVerified,
    this.channelSlug,
    this.channelSubscriber,
    this.channelId,
    this.type,
    this.viewers,
    this.duration,
    this.objectType,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      thumbnail: json['thumbnail'],
      id: json['id'],
      title: json['title'],
      dateAndTime: json['date_and_time'] != null ? DateTime.parse(json['date_and_time']) : null,
      slug: json['slug'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      manifest: json['manifest'],
      liveStatus: json['live_status'],
      liveManifest: json['live_manifest'],
      isLive: json['is_live'],
      channelImage: json['channel_image'],
      channelName: json['channel_name'],
      channelUsername: json['channel_username'],
      isVerified: json['is_verified'],
      channelSlug: json['channel_slug'],
      channelSubscriber: json['channel_subscriber'],
      channelId: json['channel_id'],
      type: json['type'],
      viewers: json['viewers'],
      duration: json['duration'],
      objectType: json['object_type'],
    );
  }
}
