import 'package:app_foundation/gen/assets.gen.dart';
import 'package:edukit/ui/app/routes.dart';
import 'package:edukit/ui/material/scaffold.dart';
import 'package:edukit/ui/modules/attribute_management/attribute_management_bloc.dart';
import 'package:edukit/ui/modules/bucket_screen/bucket_cubit.dart';
import 'package:edukit/ui/modules/bucket_screen/files_cubit.dart';
import 'package:edukit/ui/modules/bucket_screen/widgets/document_tile.dart';
import 'package:edukit/ui/modules/bucket_screen/widgets/sync_upload_document_tile.dart';
import 'package:edukit/ui/modules/bucket_screen/widgets/text_field_attribute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        BlocProvider(create: (context) => BucketCubit(bucketId)..onLoadBuckets()),
        BlocProvider(create: (context) => FilesCubit(fileRepository: fileRepo)),
      ],
      child: Builder(
        builder: (context) {
          return BlocListener<BucketCubit, BucketState>(
            listener: (context, state) {
              if (state is BucketNotFound) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.go(AppRoutes.I.createBucket());
                });
              } else if (state is BucketLoaded) {
                if (state.bucket.attributes.isEmpty) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    context.go(AppRoutes.I.attributeManagement(state.bucket.bucketId));
                  });
                } else {
                  context.read<FilesCubit>().loadFiles(state.bucket.bucketId);
                }
              }
            },
            child: BlocBuilder<BucketCubit, BucketState>(
              builder: (context, state) {
                return switch (state) {
                  BucketLoading _ => const AppScaffold(
                    titleText: 'Loading Bucket...',
                    body: Center(child: CircularProgressIndicator()),
                  ),
                  BucketError _ => AppScaffold(
                    titleText: 'Error',
                    body: Center(child: Text('Error: ${state.error}')),
                  ),
                  BucketNotFound _ => const AppScaffold(
                    titleText: 'Bucket Not Found',
                    body: Center(child: Text('Bucket not found')),
                  ),
                  BucketLoaded _ => RepositoryProvider.value(
                    value: state.bucket,
                    child: const _BucketLayout(),
                  ),
                  _ => AppScaffold(
                    titleText: 'Unknown State',
                    body: Center(child: Text('Unknown state')),
                  ),
                };
              },
            ),
          );
        },
      ),
    );
  }
}

/*
 Bucket Layout divided into 3 sections:
   - TextFieldAttribute Section -> 2In1TextFieldAttribute, TextFieldAttribute
   - SelectFieldAttribute Section -> MultiSelectDropdown, SingleSelectDropdown, DateSelectorFieldAttribute
   - BucketResultBody Section -> SyncUploadDocumentTile | DocumentTile
  */
class _BucketLayout extends StatelessWidget {
  const _BucketLayout();

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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFieldAttributeSection(
                fixedAttributes: attributesByType.fixedAttributes,
                otherAttributes: attributesByType.textAttributes,
              ),
            ),

          // Only show select field section if there are appropriate attributes
          if (attributesByType.hasSelectAttributes)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SelectFieldAttributeSection(
                mulitAttributes: attributesByType.multiSelectAttributes,
                singleAttributes: attributesByType.singleSelectAttributes,
                dateAttributes: attributesByType.dateAttributes,
              ),
            ),

          // Show files section
          Expanded(child: BucketResultBody(bucketId: bucket.bucketId)),
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

class BucketResultBody extends StatelessWidget {
  final String bucketId;

  const BucketResultBody({super.key, required this.bucketId});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Display files being uploaded
        ValueListenableBuilder(
          valueListenable: StorageService().uploadTasks,
          builder: (context, tasks, __) {
            print('tasks: $tasks');
            if (tasks.isEmpty) return const SizedBox.shrink();

            return Expanded(
              flex: tasks.isEmpty ? 0 : 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Uploading Files',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder:
                          (context, index) => Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: SyncUploadDocumentTile(
                              task: tasks[index],
                              onAiChat: () {}, // Implement AI chat functionality
                              onShare: () {}, // Implement share functionality
                            ),
                          ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        // Display files from the database
        Expanded(
          flex: 2,
          child: BlocBuilder<FilesCubit, FilesState>(
            builder: (context, state) {
              if (state is FilesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FilesError) {
                return Center(child: Text('Error: ${state.error}'));
              } else if (state is FilesLoaded) {
                if (state.files.isEmpty) {
                  return const Center(
                    child: Text('No files found. Upload files to get started.'),
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Files',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.files.length,
                        itemBuilder:
                            (context, index) => Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: DocumentTile(
                                documentFile: state.files[index],
                                onAiChat: () {}, // Implement AI chat functionality
                                onShare: () {}, // Implement share functionality
                                onDownload: () {}, // Implement download functionality
                                onDelete:
                                    () => _handleDeleteFile(
                                      context,
                                      state.files[index].fileId,
                                    ),
                              ),
                            ),
                      ),
                    ),
                  ],
                );
              }

              return const Center(child: Text('No files found'));
            },
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

/// Section for TextFieldAttribute
/// Render 2In1TextFieldAttribute, TextFieldAttribute
/// based on the attribute type
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
