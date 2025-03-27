import 'package:app_foundation/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_suite/flutter_suite.dart';
import 'package:intl/intl.dart';
import 'package:repositories/models.dart';
import 'package:storage_service/storage_task_widget.dart';

class SyncUploadDocumentTile extends StorageTaskWidget {
  final VoidCallback? onAiChat;
  final VoidCallback? onShare;
  const SyncUploadDocumentTile({
    super.key,
    required super.task,
    this.onAiChat,
    this.onShare,
  });

  @override
  Widget buildContent(context, asyncSnapshot) {
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
    var buttons = [
      (icon: Assets.icon.download, onTap: onDownload),
      (icon: Assets.icon.aiChat, onTap: onAiChat),
      (icon: Assets.icon.share, onTap: onShare),
      (icon: Assets.icon.delete, onTap: onDelete),
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var button in buttons)
          IconButton(icon: button.icon.svg(), onPressed: button.onTap),
      ],
    );
  }
}
