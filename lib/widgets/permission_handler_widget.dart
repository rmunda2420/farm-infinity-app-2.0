import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerWidget extends StatefulWidget {
  final Widget child;
  final List<Permission> permissions;

  const PermissionHandlerWidget(
      {Key? key, required this.child, required this.permissions})
      : super(key: key);

  @override
  State<PermissionHandlerWidget> createState() =>
      _PermissionHandlerWidgetState();
}

class _PermissionHandlerWidgetState extends State<PermissionHandlerWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void initState() {
    super.initState();
    requestPermissions(widget.permissions);
  }

  Future<void> requestPermissions(List<Permission> permissions) async {
    // You can handle each permission request individually
    for (final permission in permissions) {
      final status = await permission.request();
      if (!status.isGranted) {
        // Handle what to do if permission is not granted
        handlePermissionDenied(permission);
      }
    }

    // Alternatively, you can handle permissions as a group
    // Uncomment the below code if you want to handle permissions as a group
    // Map<Permission, PermissionStatus> statuses = await permissions.request();
    // for (final permission in permissions) {
    //   if (!statuses[permission]!.isGranted) {
    //     handlePermissionDenied(permission);
    //   }
    // }
  }

  void handlePermissionDenied(Permission permission) {
    // Handle what to do if the permission is denied
    // For example, you can show an explanation dialog or take appropriate actions.
  }
}
