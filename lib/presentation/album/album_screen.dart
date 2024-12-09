import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gallery_app/presentation/album/widgets/photos_grid.dart';
import 'package:gallery_app/presentation/universal_widgets/loading.dart';
import 'package:gallery_app/presentation/universal_widgets/error.dart';
import 'package:gallery_app/data/network/service/service_locator.dart';
import 'package:gallery_app/presentation/album/cubit/album_state.dart';
import 'package:gallery_app/presentation/album/cubit/album_cubit.dart';
import 'package:gallery_app/domain/repositories/album_repository.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  final _albumRepository = locator<AlbumRepository>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlbumCubit(_albumRepository)..fetchAlbums(),
      child: BlocBuilder<AlbumCubit, AlbumState>(
        builder: (context, state) {
          if (state is InitialAlbumState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadingAlbumState) {
            return Loading(albumState: state);
          } else if (state is LoadedAlbumState) {
            return PhotosGrid(state.albums);
          } else if (state is ErrorAlbumState) {
            return Error(albumState: state);
          } else {
            return Center(
              child: Text(AppLocalizations.of(context).wrongState),
            );
          }
        },
      ),
    );
  }
}
