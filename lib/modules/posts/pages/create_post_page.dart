import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_app/common/widgets/stateful/upload/image_upload_group.dart';
import 'package:social_app/common/widgets/stateful/upload/image_upload_item.dart';
import 'package:social_app/common/widgets/stateful/upload/upload_group_value.dart';
import 'package:social_app/common/widgets/stateless/loading_hide_keyboard.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  late final TextEditingController _desCtrl;
  late final FocusNode _focusNodeDes;
  bool isLoading = false;

  UploadGroupValue _currentGroupUploadValue =
      const UploadGroupValue(<ImageUploadItem>[]);

  @override
  void initState() {
    super.initState();

    _desCtrl = TextEditingController();
    _focusNodeDes = FocusNode();
  }

  @override
  void dispose() {
    _desCtrl.dispose();
    _focusNodeDes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create post page'),
      ),
      body: LoadingHideKeyboard(
        isLoading: isLoading,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: TextField(
                        controller: _desCtrl,
                        focusNode: _focusNodeDes,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type description here...',
                          filled: true,
                        ),
                        autocorrect: false,
                        minLines: 5,
                        maxLines: 15,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(300),
                        ],
                        keyboardType: TextInputType.multiline,
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                    ImageUploadGroup(
                      isFullGrid: false,
                      onValueChanged: (UploadGroupValue value) {
                        setState(() {
                          _currentGroupUploadValue = value;
                        });
                      },
                      pickImageDone: () {
                        FocusScope.of(context).unfocus();
                      },
                      listImages: [],
                    ),
                  ],
                ),
              ),
              SafeArea(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Create Post'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
