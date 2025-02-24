import 'package:app_foundation/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DocFileTile extends StatelessWidget {
  final VoidCallback? onDownload, onChat, onShare, onDelete;
  final String title, about;
  final DateTime dateTime;
  const DocFileTile({
    super.key,
    this.onDownload,
    this.onChat,
    this.onShare,
    this.onDelete,
    required this.dateTime,
    required this.title,
    required this.about,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: 1652,
      height: 116,
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: Color(0xFF828282)),
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      child: Row(
        spacing: 12,
        children: [
          Assets.svg.doc.svg(width: 92),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(about, style: textTheme.titleMedium),
              Text(title, style: textTheme.bodyMedium),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(DateFormat.yMMMd().format(dateTime), style: textTheme.labelMedium),
              Spacer(),
              Row(
                spacing: 12,
                children: [
                  IconButton.filledTonal(
                    onPressed: onDownload,
                    icon: Assets.icon.download.svg(),
                  ),
                  IconButton.filledTonal(
                    onPressed: onChat,
                    icon: Assets.icon.aiChat.svg(),
                  ),
                  IconButton.filledTonal(
                    onPressed: onShare,
                    icon: Assets.icon.share.svg(),
                  ),
                  IconButton.filledTonal(
                    onPressed: onDelete,
                    icon: Assets.icon.delete.svg(),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
