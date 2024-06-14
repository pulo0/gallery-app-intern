import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/models/album.dart';
import 'package:gallery_app/logic/album_cubit.dart';
import 'package:gallery_app/widgets/loading_error.dart';
import 'package:gallery_app/widgets/photos_grid.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreeenState();
}

class _AlbumScreeenState extends State<AlbumScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlbumCubit()..fetchAlbums(),
      child: BlocBuilder<AlbumCubit, List<Album>>(
        builder: (context, state) {
          if (state.isEmpty) {
            return LoadingError(() => AlbumCubit().fetchAlbums());
          } else {
            return PhotosGrid(state);
          }
        },
      ),
    );
  }
}
