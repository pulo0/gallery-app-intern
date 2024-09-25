import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

// Album Model
// The @JsonSerializable() annotation tells the 
// json_serializable package to generate code for this class
// in album.g.dart file
@JsonSerializable()
class Album {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Album({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  // A factory constructor that creates an Album instance from a JSON object
  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  // A method that converts an Album instance into a JSON object
  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
