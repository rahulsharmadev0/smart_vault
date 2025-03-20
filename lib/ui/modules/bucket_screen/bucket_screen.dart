import 'package:edukit/ui/app/routes.dart';
import 'package:edukit/ui/material/scaffold.dart';
import 'package:edukit/ui/modules/bucket_screen/bucket_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:repositories/models/organization.dart';
import 'package:repositories/repositories.dart';

/*

Loading Bucket (bucketId ?? first bucket)
    ↓  
Check bucket.isNotEmpty  
    → Yes → Dashboard  
    → No → Check attributes  

*/
class BucketScreen extends StatelessWidget {
  final String bucketId;

  const BucketScreen({super.key, required this.bucketId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BucketCubit(bucketId)..onLoadBuckets(),
      child: AppScaffold(
        titleText: 'Files Management',
        body: BlocBuilder<BucketCubit, BucketState>(
          builder: (context, state) {
            if (state is BucketLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BucketError) {
              return Center(child: Text('Error: ${state.error}'));
            } else if (state is BucketNotFound) {
              context.go(AppRoutes.I.createBucket());
              return const Center(child: Text('Bucket not found'));
            } else if (state is BucketLoaded) {
              final bucket = state.bucket;
              if (state.bucket.attributes.isEmpty) {
                context.go(AppRoutes.I.attributeManagement(bucket.bucketId));
              }
              return _BucketView(bucket);
            }

            return const Center(child: Text('Unknown state'));
          },
        ),
      ),
    );
  }
}

class _BucketView extends StatelessWidget {
  final Bucket bucket;
  const _BucketView(this.bucket);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Bucket: ${bucket.toJson()}'));
  }
}

class FileView extends StatelessWidget {
  const FileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
