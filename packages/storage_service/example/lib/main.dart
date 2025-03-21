
// /// A concrete implementation of [UploadTaskListTile] with a standard list tile appearance.
// ///
// /// This implementation provides a simple way to display upload tasks with minimal effort.
// class StandardUploadTaskListTile extends UploadTaskListTile {
//   const StandardUploadTaskListTile({
//     super.key,
//     required super.task,
//     required super.onDismissed,
//     super.onDownload,
//     super.onDownloadLink,
//     super.onDelete,
//     this.leading,
//     this.title,
//   });

//   /// Optional widget to display before the title.
//   final Widget? leading;

//   /// Optional title for the upload task. If null, the file name will be displayed.
//   final Widget? title;

//   @override
//   Widget buildContent(BuildContext context, AsyncSnapshot<TaskSnapshot> asyncSnapshot) {
//     final TaskSnapshot? snapshot = asyncSnapshot.data;
//     final TaskState? state = snapshot?.state;
    
//     // Create the subtitle based on the current state
//     Widget subtitle;
//     if (asyncSnapshot.hasError) {
//       if (asyncSnapshot.error is FirebaseException &&
//           (asyncSnapshot.error as FirebaseException).code == 'canceled') {
//         subtitle = const Text('Upload canceled.');
//       } else {
//         subtitle = const Text('Something went wrong.');
//       }
//     } else if (snapshot != null) {
//       subtitle = Text('$state: ${_bytesTransferred(snapshot)}');
//     } else {
//       subtitle = const Text('Starting upload...');
//     }

//     // Default title if none provided
//     final effectiveTitle = title ?? Text(task.snapshot.ref.name);
    
//     // Button actions based on state
//     final List<Widget> actions = [];
    
//     if (state == TaskState.success) {
//       if (onDownload != null) {
//         actions.add(IconButton(
//           icon: const Icon(Icons.file_download),
//           onPressed: onDownload,
//           tooltip: 'Download',
//         ));
//       }
      
//       if (onDownloadLink != null) {
//         actions.add(IconButton(
//           icon: const Icon(Icons.link),
//           onPressed: onDownloadLink,
//           tooltip: 'Get link',
//         ));
//       }
      
//       if (onDelete != null) {
//         actions.add(IconButton(
//           icon: const Icon(Icons.delete),
//           onPressed: onDelete,
//           tooltip: 'Delete',
//         ));
//       }
//     } else if (state == TaskState.running) {
//       // Add cancel button when running
//       actions.add(IconButton(
//         icon: const Icon(Icons.cancel),
//         onPressed: () => task.cancel(),
//         tooltip: 'Cancel upload',
//       ));
//     }

//     return Dismissible(
//       key: Key(task.hashCode.toString()),
//       onDismissed: (_) => onDismissed(),
//       background: Container(
//         color: Colors.red,
//         alignment: Alignment.centerRight,
//         padding: const EdgeInsets.only(right: 16.0),
//         child: const Icon(Icons.delete, color: Colors.white),
//       ),
//       child: ListTile(
//         leading: leading ?? const Icon(Icons.upload_file),
//         title: effectiveTitle,
//         subtitle: subtitle,
//         trailing: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: actions,
//         ),
//       ),
//     );
//   }
// }
