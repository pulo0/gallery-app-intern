import 'package:equatable/equatable.dart';

class Album extends Equatable {
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

  @override
  List<Object?> get props => [albumId, id, title, url, thumbnailUrl];
}
