import 'package:app_foundation/gen/assets.gen.dart';
import 'package:edukit/ui/modules/bucket_screen/bloc/bucket_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_suite/flutter_suite.dart';
import 'package:intl/intl.dart';
import 'package:repositories/models.dart';
import 'package:repositories/repositories.dart';
import 'package:storage_service/storage_service.dart';

class SyncUploadDocumentTile extends StatelessWidget {
  final VoidCallback? onAiChat;
  final VoidCallback? onShare;
  final int index;

  const SyncUploadDocumentTile({
    super.key,
    required this.index,
    this.onAiChat,
    this.onShare,
  });

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  UploadTask get task => StorageService().uploadTasks.value[index];

  @override
  Widget build(context) {
    return StorageTaskBuilder(
      task: task,
      onSuccess: () async {
        await fileRepo.create(
          DocumentFile(
            orgId: orgRepo.orgId!,
            fullPath: task.snapshot.ref.fullPath,
            name: task.snapshot.ref.name,
            isDraft: true,
            bucketId: RepositoryProvider.of<Bucket>(context).bucketId,
            type: DocumentType.values.byName(
              task.snapshot.ref.name.split('.').last.toLowerCase(),
            ),
          ),
        );

        if (context.mounted) {
          StorageService().removeTask(index);
          showSnackBar(context, 'File uploaded successfully');
        }
      },
      onCancel: () {
        showSnackBar(context, 'Upload canceled');
      },
      builder: (context, snapshot) {
        return Container(
          width: double.infinity,
          padding: 12.$.edges,
          height: 92,
          decoration: ShapeDecoration(shape: 18.$.rounded.shape),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildThumbnail(context, task.snapshot.ref.name),
                    Expanded(child: innerContent(context, task.snapshot.ref.name)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildDateTimeStamp(context),
                        Expanded(child: buildActions(context)),
                      ],
                    ),
                  ],
                ),
              ),
              LinearProgressIndicator(
                value: task.snapshot.bytesTransferred / task.snapshot.totalBytes,
                backgroundColor: context.colorScheme.primary.withAlpha(50),
                valueColor: AlwaysStoppedAnimation<Color>(context.colorScheme.primary),
              ),
            ],
          ),
        );
      },
    );
  }

  Container buildThumbnail(BuildContext context, String name) {
    var ext = task.snapshot.ref.name.split('.').last.toLowerCase();
    return Container(
      width: 92,
      height: 92,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
      child: DocumentType.values
          .map((e) {
            if (e.extension == ext) {
              return e.icon.svg();
            }
            return null;
          })
          .firstWhere((element) => element != null, orElse: () => Assets.svg.txt.svg()),
    );
  }

  Column innerContent(BuildContext context, String name) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: context.TxT.h2),
      ],
    );
  }

  Widget buildDateTimeStamp(BuildContext context) {
    return Text(
      DateFormat.yMEd().format(DateTime.now()),
      style: context.TxT.b2?.copyWith(color: const Color(0xFF828282)),
    );
  }

  Widget buildActions(BuildContext context) {
    final actions = [
      (Assets.icon.download, () => StorageService().deleteFile(task.snapshot.ref)),
      (Assets.icon.aiChat, onAiChat),
      (
        Assets.icon.share,
        () async {
          final url = await task.snapshot.ref.getDownloadURL();
          Clipboard.setData(ClipboardData(text: url));
          if (context.mounted) {
            showSnackBar(context, 'Link copied to clipboard');
          }
        },
      ),
      (Assets.icon.delete, () => StorageService().deleteFile(task.snapshot.ref)),
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children:
          actions
              .map((action) => IconButton(icon: action.$1.svg(), onPressed: action.$2))
              .toList(),
    );
  }
}
