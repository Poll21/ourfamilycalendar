//добавить разрешения для работы с iPhone в фаил
//<project root>/ios/Runner/Info.plist:

// <key>NSPhotoLibraryUsageDescription</key>
// <string>Choose photo from gallery.</string>
// <key>NSCameraUsageDescription</key>
// <string>Take photo from camera.</string>
// <key>NSMicrophoneUsageDescription</key>
// <string>Used to capture audio for image picker plugin.</string>
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:our_family_calendar/blocs/auth_bloc/auth_bloc.dart';

File? _imageFile;

class GetImagesScreen extends StatefulWidget {

  const GetImagesScreen({Key? key}) : super(key: key);

  @override
  State<GetImagesScreen> createState() => _GetImagesScreenState();
}

class _GetImagesScreenState extends State<GetImagesScreen> {
  Widget? _image;

  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      _imageFile = imageTemporary;
    });
    if (_imageFile != null) {
      _image = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CircleAvatar(
        radius: 200,
          backgroundImage: FileImage(
                _imageFile!,

              )
        ),
      );
    }
  }
  Future<String> uploadFiles(String userId) async{

    final path = 'userAvatars/${userId}';
    final file = File(_imageFile!.path!);
// Создаем ссылку на хранилище из нашего приложения
    final ref = FirebaseStorage.instance.ref().child(path);
      ref.putFile(file);
      final _avatarURL = await ref.getDownloadURL();
      return _avatarURL;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      icon: const Icon(Icons.photo_camera_outlined,
                          size: 55, ),
                      onPressed: () => getImage(ImageSource.camera)),
                  IconButton(
                      icon: const Icon(Icons.image,
                          size: 55, ),
                      onPressed: () => getImage(ImageSource.gallery)),
                ],
              ),
            ),
            _image ?? const SizedBox.shrink(),
            Visibility(
              visible:  (_image != null),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
              icon: const Icon(Icons.save,
                        size: 55, ),
              onPressed: () async{
              final _photoURL = await uploadFiles(context.read<AuthBloc>().state.user!.uid);
             context.read<AuthBloc>().add(AuthUpdateProfileEvent(photoURL: _photoURL));
              Navigator.of(context).pop();
              }
            ),
                      IconButton(
                          icon: const Icon(Icons.delete,
                            size: 55, ),
                          onPressed: () => setState(() {
                            _imageFile =null;
                          })
                      ),
                    ],
                  ),
                ),

          ],
        ),
      ),
    );
  }
}

