import 'package:app_foundation/gen/assets.gen.dart';
import 'package:edukit/ui/app/routes.dart';
import 'package:edukit/ui/material/scaffold.dart';
import 'package:edukit/ui/modules/attribute_management/attribute_management_bloc.dart';
import 'package:edukit/ui/modules/bucket_screen/bloc/bucket_cubit.dart';
import 'package:edukit/ui/modules/bucket_screen/bloc/files_cubit.dart';
import 'package:edukit/ui/modules/bucket_screen/widgets/document_tile.dart';
import 'package:edukit/ui/modules/bucket_screen/widgets/sync_upload_document_tile.dart';
import 'package:edukit/ui/modules/bucket_screen/widgets/text_field_attribute.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_suite/flutter_suite.dart';
import 'package:go_router/go_router.dart';
import 'package:repositories/models.dart';
import 'package:repositories/repositories.dart';
import 'package:storage_service/storage_service.dart';

/*
 Loading Bucket (bucketId or first bucket):
 - If BucketLoading: Show CircularProgressIndicator
 - If BucketError: Show Error Message
 - If BucketNotFound: Show "Bucket not found"
 - If BucketLoaded:
   - Check if bucket.attributes.isEmpty
     - Yes: Redirect to Attribute Management Screen
     - No: Show Dashboard (_BucketLayout)
 - If Unknown state: Show "Unknown state"
*/
class BucketScreen extends StatelessWidget {
  final String bucketId;

  const BucketScreen({super.key, required this.bucketId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BucketBloc(bucketId, bucketRepo, orgRepo)..add(LoadBucket()),
        ),
        BlocProvider(create: (_) => FilesCubit(fileRepository: fileRepo)),
      ],
      child: BlocConsumer<BucketBloc, BucketState>(
        listener: (context, state) {
          if (state is BucketNotFound) {
            context.go(AppRoutes.I.createBucket());
          } else if (state is BucketLoaded) {
            if (state.bucket.attributes.isEmpty) {
              context.go(AppRoutes.I.attributeManagement(state.bucket.bucketId));
            } else {
              if (bucketId.isEmpty) {
                context.goNamed(
                  'bucket',
                  pathParameters: {'bucketId': state.bucket.bucketId},
                );
              } else {
                // Load files for the bucket
                context.read<FilesCubit>().loadFiles(bucketId);
              }
            }
          }
        },
        builder: (context, state) {
          return switch (state) {
            BucketLoading _ => Center(child: CircularProgressIndicator()),
            BucketError _ => Center(child: Text('Error: ${state.error}')),
            BucketNotFound _ => Center(child: Text('Bucket not found')),
            BucketLoaded _ => RepositoryProvider.value(
              value: state.bucket,
              child: AppScaffold(body: const _BucketScreenLayout()),
            ),
            _ => Center(child: Text('Unknown state')),
          };
        },
      ),
    );
  }
}

/*
 Bucket Layout divided into 3 sections:
   - TextFieldAttribute Section -> 2In1TextFieldAttribute, TextFieldAttribute
   - SelectFieldAttribute Section -> MultiSelectDropdown, SingleSelectDropdown, DateSelectorFieldAttribute
   - BucketResultBody Section -> SyncUploadDocumentTile | Draft | DocumentTile
  */
class _BucketScreenLayout extends StatelessWidget {
  const _BucketScreenLayout();

  @override
  Widget build(BuildContext context) {
    var bucket = RepositoryProvider.of<Bucket>(context);

    // Sort attributes by type for easier handling
    var attributesByType = _sortAttributesByType(bucket.attributes);

    return AppScaffold(
      titleText: bucket.title,
      appBarActions: const [BuildActions()],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Only show text field section if there are appropriate attributes
          if (attributesByType.fixedAttributes.isNotEmpty ||
              attributesByType.textAttributes.isNotEmpty)
            TextFieldAttributeSection(
              fixedAttributes: attributesByType.fixedAttributes,
              otherAttributes: attributesByType.textAttributes,
            ),

          // Only show select field section if there are appropriate attributes
          if (attributesByType.hasSelectAttributes)
            SelectFieldAttributeSection(
              mulitAttributes: attributesByType.multiSelectAttributes,
              singleAttributes: attributesByType.singleSelectAttributes,
              dateAttributes: attributesByType.dateAttributes,
            ),

          // Show files section
          Expanded(child: _BucketResultBody()),
        ],
      ),
    );
  }

  // Helper method to sort attributes by type
  _AttributesByType _sortAttributesByType(List<Attribute> attributes) {
    final result = _AttributesByType();

    for (var attribute in attributes) {
      switch (attribute) {
        case TextAttribute _:
          if (result.fixedAttributes.length < 2 &&
              fixedAttributesMap.keys.contains(attribute.attributeId)) {
            result.fixedAttributes.add(attribute);
          } else {
            result.textAttributes.add(attribute);
          }
        case MultiSelectAttribute _:
          result.multiSelectAttributes.add(attribute);
        case SingleSelectAttribute _:
          result.singleSelectAttributes.add(attribute);
        case DateTimeAttribute _:
          result.dateAttributes.add(attribute);
      }
    }

    return result;
  }
}

// Helper class to organize attributes by type
class _AttributesByType {
  final List<Attribute> fixedAttributes = [];
  final List<Attribute> textAttributes = [];
  final List<Attribute> multiSelectAttributes = [];
  final List<Attribute> singleSelectAttributes = [];
  final List<Attribute> dateAttributes = [];

  bool get hasSelectAttributes =>
      multiSelectAttributes.isNotEmpty ||
      singleSelectAttributes.isNotEmpty ||
      dateAttributes.isNotEmpty;
}

class _BucketResultBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Display files being uploaded
        _UploadingTiles(),

        Expanded(
          child: BlocBuilder<FilesCubit, FilesState>(
            builder:
                (_, s) => switch (s) {
                  FilesLoading _ => Center(child: CircularProgressIndicator()),
                  FilesError _ => Center(child: Text('Error: ${s.error}')),
                  FilesLoaded data => regularTiles(context, data),
                  _ => Center(child: Text('Unknown state')),
                },
          ),
        ),
      ],
    );
  }

  Widget regularTiles(BuildContext context, FilesLoaded data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: 8.$.edges, child: Text('Files', style: context.TxT.t2)),
        Expanded(
          child: ListView.builder(
            itemCount: data.files.length,
            itemBuilder:
                (context, index) => DocumentTile(
                  documentFile: data.files[index],
                  onAiChat: () {
                    context.pushNamed('chat', extra: data.files[index].fullPath);
                  },
                  onShare: () async {
                    var text =
                        await StorageService()
                            .createRef(data.files[index].fullPath)
                            .getDownloadURL();
                    Clipboard.setData(ClipboardData(text: text));
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Link copied to clipboard!'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  onDownload: () {}, // Implement download functionality
                  onDelete: () => _handleDeleteFile(context, data.files[index].fileId),
                ),
          ),
        ),
      ],
    );
  }

  void _handleDeleteFile(BuildContext context, String fileId) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Delete File'),
            content: const Text('Are you sure you want to delete this file?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  context.read<FilesCubit>().deleteFile(fileId);
                  Navigator.of(context).pop();
                },
                child: const Text('Delete'),
              ),
            ],
          ),
    );
  }
}

class _UploadingTiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: StorageService().uploadTasks,
      builder: (context, tasks, __) {
        if (tasks.isEmpty) return const SizedBox.shrink();
        return Expanded(
          flex: tasks.isEmpty ? 0 : 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: 8.$.edges,
                child: Text('Uploading Files', style: context.TxT.t2),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder:
                      (context, index) => SyncUploadDocumentTile(
                        index: index,
                        onAiChat: () {}, // Implement AI chat functionality
                        onShare: () {}, // Implement share functionality
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SelectFieldAttributeSection extends StatelessWidget {
  final List<Attribute> mulitAttributes;
  final List<Attribute> singleAttributes;
  final List<Attribute> dateAttributes;
  const SelectFieldAttributeSection({
    super.key,
    required this.mulitAttributes,
    required this.singleAttributes,
    required this.dateAttributes,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        for (var attr in mulitAttributes) MultiSelectDropdown(attribute: attr),

        for (var attr in singleAttributes) SingleSelectDropdown(attribute: attr),

        for (var attr in dateAttributes) DateSelectorFieldAttribute(attribute: attr),
      ],
    );
  }
}

// -----------------------------------------------------
//  Attribute Section
//    - TextFieldAttribute: TextField for text input
//    - TwoInOneTextFieldAttribute: Two text fields for input
// -----------------------------------------------------
class TextFieldAttributeSection extends StatelessWidget {
  final List<Attribute> fixedAttributes;
  final List<Attribute> otherAttributes;
  const TextFieldAttributeSection({
    super.key,
    required this.fixedAttributes,
    required this.otherAttributes,
  });

  @override
  Widget build(BuildContext context) {
    var twoInOneTextFieldAttribute = [
      TwoInOneTextFieldAttribute(
        first: fixedAttributes[0],
        second: fixedAttributes[1],
        textFieldController: TextEditingController(),
      ),
      for (var attr in otherAttributes)
        TextFieldAttribute(attribute: attr, textFieldController: TextEditingController()),
    ];
    return Row(
      spacing: 12,
      children: twoInOneTextFieldAttribute.map((e) => Expanded(child: e)).toList(),
    );
  }
}

// -----------------------------------------------------
//  Actions for the AppBar
//    - Download: Bulk download
//    - Upload: Pick files & upload
// -----------------------------------------------------
class BuildActions extends StatelessWidget {
  const BuildActions({super.key});

  void pickedAndUploadFiles() async {
    final exts = DocumentType.values.map((e) => e.extension).toList();
    final files = await StorageService().pickFiles(allowedExtensions: exts);
    if (files.isEmpty) return;
    // Upload files
    StorageService().uploadFiles(files);
  }

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
          onPressed: pickedAndUploadFiles,
          icon: Assets.icon.upload.svg(colorFilter: fgColor),
          label: Text('Upload'),
        ),
      ],
    );
  }
}
