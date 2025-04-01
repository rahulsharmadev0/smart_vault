import 'package:app_foundation/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_suite/flutter_suite.dart';
import 'package:intl/intl.dart';
import 'package:repositories/models.dart';

class DocumentTile extends StatelessWidget {
  final DocumentFile documentFile;
  final VoidCallback? onAiChat;
  final VoidCallback? onShare;
  final VoidCallback? onDownload;
  final VoidCallback? onDelete;
  const DocumentTile({
    super.key,
    this.onAiChat,
    this.onShare,
    this.onDownload,
    this.onDelete,
    required this.documentFile,
  });

  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: const Color(0xFF828282)),
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildThumbnail(context),
          Expanded(child: innerContent(context)),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [buildDateTimeStamp(context), buildActions(context)],
          ),
        ],
      ),
    );
  }

  Container buildThumbnail(BuildContext context) {
    return Container(
      width: 1284,
      height: 200,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
      child: documentFile.type.icon.svg(),
    );
  }

  Column innerContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(
          documentFile.isDraft ? 'Draft' : documentFile.type.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.TxT.h2,
        ),
        Text(
          documentFile.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.TxT.h2,
        ),
        Text(
          documentFile.name,
          style: context.TxT.b2,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget buildDateTimeStamp(BuildContext context) {
    return Text(
      DateFormat('dd MMM yyyy').format(documentFile.uploadedAt),
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
