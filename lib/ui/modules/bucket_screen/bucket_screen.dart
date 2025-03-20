import 'package:app_foundation/gen/assets.gen.dart';
import 'package:edukit/ui/app/routes.dart';
import 'package:edukit/ui/material/scaffold.dart';
import 'package:edukit/ui/modules/bucket_screen/bucket_cubit.dart';
import 'package:edukit/ui/modules/bucket_screen/widgets/text_field_attribute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_suite/flutter_suite.dart';
import 'package:go_router/go_router.dart';
import 'package:repositories/models/organization.dart';

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
      child: BlocConsumer<BucketCubit, BucketState>(
        listener: (context, state) {
          if (state is BucketNotFound) {
            context.go(AppRoutes.I.createBucket());
          }
        },
        builder: (context, state) {
          if (state is BucketLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BucketError) {
            return Center(child: Text('Error: ${state.error}'));
          } else if (state is BucketNotFound) {
            return const Center(child: Text('Bucket not found'));
          } else if (state is BucketLoaded) {
            final bucket = state.bucket;
            if (state.bucket.attributes.isEmpty) {
              context.go(AppRoutes.I.attributeManagement(bucket.bucketId));
            }
            return _BucketLayout(bucket);
          }

          return const Center(child: Text('Unknown state'));
        },
      ),
    );
  }
}

var bucket = Bucket(
  orgId: 'orgId',
  title: 'Class 12th',
  description: 'Class 12th students',
  attributes: [
    Attribute.text(label: 'Name'),
    Attribute.text(label: 'Roll Number'),
    Attribute.multiSelect(
      label: 'Subjects',
      options: [
        Option(value: 'Physics'),
        Option(value: 'Chemistry'),
        Option(value: 'Mathematics'),
      ],
    ),
  ],
  fileTypes: [DocumentType.pdf, DocumentType.doc, DocumentType.md],
);


class XApp extends StatelessWidget {
  const XApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: GoRouter(
        initialLocation: '/',
        routes: [GoRoute(path: '/', builder: (_, _) => _BucketLayout(bucket))],
      ),
    );
  }
}

class _BucketLayout extends StatelessWidget {
  final Bucket bucket;
  const _BucketLayout(this.bucket);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      titleText: 'Files Management',
      appBarActions: [BuildActions()],
      body: Column(
        children: [
          BuildSearchAttributes(),
          BuildSelectedFieldAttribute(),
          Expanded(child: ListView(children: [])),
        ],
      ),
    );
  }
}

class BuildSelectedFieldAttribute extends StatelessWidget {
  const BuildSelectedFieldAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        MultiSelectDropdown(
         attribute: Attribute.multiSelect(label: 'Course', options: [
           Option(value: 'MCA', id: '1'),
           Option(value: 'BCA', id: '23'),
           Option(value: 'DCA', id: '3'),
           Option(value: 'FCA', id: '4'),
           Option(value: 'GCS', id: '21'),
           Option(value: 'PCA', id: '45'),
         ]),
        ),
        SingleSelectDropdown(
         attribute: Attribute.singleSelect(label: 'Course', options: [
           Option(value: 'MCA', id: '1'),
           Option(value: 'BCA', id: '23'),
           Option(value: 'DCA', id: '3'),
           Option(value: 'FCA', id: '4'),
           Option(value: 'GCS', id: '21'),
           Option(value: 'PCA', id: '45'),
         ]),
        ),
        DateSelectorFieldAttribute(
         attribute: Attribute.dateTime(label: 'Course Join Date', 
         firstDate: DateTime(2023), 
         lastDate: DateTime(2024)),
        ),
      ],
    );
  }
}

class BuildSearchAttributes extends StatelessWidget {
  const BuildSearchAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    var twoInOneTextFieldAttribute = [
      TwoInOneTextFieldAttribute(
        first: Attribute.text(label: 'Name'),
        second: Attribute.text(label: 'Roll Number'),
        textFieldController: TextEditingController(),
      ),
      TextFieldAttribute(
        attribute: Attribute.text(label: 'Name'),
        textFieldController: TextEditingController(),
      ),
      TextFieldAttribute(
        attribute: Attribute.text(label: 'Name'),
        textFieldController: TextEditingController(),
      ),
      TextFieldAttribute(
        attribute: Attribute.text(label: 'Name'),
        textFieldController: TextEditingController(),
      ),
    ];
    return Row(
      spacing: 12,
      children: twoInOneTextFieldAttribute.map((e) => Expanded(child: e)).toList(),
    );
  }
}

class BuildActions extends StatelessWidget {
  const BuildActions({super.key});

  @override
  Widget build(BuildContext context) {
    var fgColor = ColorFilter.mode(Colors.white, BlendMode.srcIn);
    return Row(
      spacing: 12,
      children: [
        FilledButton.icon(
          onPressed: null,
          icon: Assets.icon.download.svg(colorFilter: fgColor),
          label: Text('Download'),
        ),
        FilledButton.icon(
          onPressed: () {},
          icon: Assets.icon.upload.svg(colorFilter: fgColor),
          label: Text('Upload'),
        ),
      ],
    );
  }
}
