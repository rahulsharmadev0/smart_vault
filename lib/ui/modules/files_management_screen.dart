import 'package:edukit/ui/bloc/bucket_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilesManagementScreen extends StatelessWidget {
  final String bucketId;
  const FilesManagementScreen({super.key, required this.bucketId});

  @override
  Widget build(BuildContext context) {
    context.read<BucketBloc>().state.map(
      initial: (_) => context.read<BucketBloc>().add(BucketEvent.loadOrgBuckets(bucketId)),
      loading: (_) => const CircularProgressIndicator(),
      error: (state) => Text(state.msg),
      loaded: buildChild,
    );

    return const Placeholder();
  }

  Widget buildChild(LoadedBucketState state) {
    return ListView.builder(
      itemCount: state.bucket.length,
      itemBuilder: (context, index) {
        final bucket = state.bucket[index];
        return ListTile(title: Text(bucket.title), subtitle: Text(bucket.description));
      },
    );
  }
}
