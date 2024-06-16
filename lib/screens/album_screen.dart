import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/logic/album_state.dart';
import 'package:gallery_app/logic/album_cubit.dart';
import 'package:gallery_app/widgets/loading.dart';
import 'package:gallery_app/widgets/error.dart';
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
      child: BlocBuilder<AlbumCubit, AlbumState>(
        builder: (context, state) {
          switch (state.status) {
            case AlbumStatus.initial:
              return const Center(child: CircularProgressIndicator());
            case AlbumStatus.loading:
              return Loading(() => AlbumCubit().fetchAlbums());
            case AlbumStatus.finished:
              return PhotosGrid(state.albums);
            case AlbumStatus.error:
              return Error(albumState: state);
          }
        },
      ),
    );
  }
}
