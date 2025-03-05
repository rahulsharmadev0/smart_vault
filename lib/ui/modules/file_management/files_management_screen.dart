import 'package:collection/collection.dart';
import 'package:edukit/ui/bloc/bucket_bloc.dart';
import 'package:edukit/ui/bloc/organization_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FilesManagementScreen extends StatefulWidget {
  final String? bucketId;
  const FilesManagementScreen({super.key, this.bucketId});

  @override
  State<FilesManagementScreen> createState() => _FilesManagementScreenState();
}

class _FilesManagementScreenState extends State<FilesManagementScreen> {
  @override
  void initState() {
    super.initState();
    var read = context.read<BucketBloc>();
    if (read.state is InitialBucketState) {
      final id = context.read<OrganizationBloc>().orgId;
      read.add(BucketEvent.loadOrgBuckets(id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BucketBloc, BucketState>(
      listenWhen: (previous, current) => previous is InitialBucketState && current is LoadedBucketState,
      listener: (context, state) {
        if (state is LoadedBucketState) {
          context.go('/${widget.bucketId}');
        }
      },
      builder: (context, state) {
        return state.map(
          error: (e) => Center(child: Text(e.msg)),
          orElse: () => const Center(child: CircularProgressIndicator()),
          loaded: (_) {
            return const Center(child: Text('Loaded'));
          },
        );
      },
    );
  }
}
