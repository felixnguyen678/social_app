import 'package:flutter/material.dart';
import 'package:social_app/common/widgets/stateful/upload/image_upload_item.dart';
import 'package:social_app/common/widgets/stateful/upload/upload_group_value.dart';

class UploadGroupStateController extends ValueNotifier<UploadGroupValue> {
  UploadGroupStateController()
      : super(const UploadGroupValue(<ImageUploadItem>[]));

  set state(UploadGroupValue state) {
    value = state;
  }
}
