// import 'dart:io';

// import 'package:chat_app/Models/userMode.dart';
// import 'package:chat_app/components/customTextField.dart';
// import 'package:chat_app/components/customeButton.dart';
// import 'package:chat_app/components/customeColors.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';

// class CompleteProfile extends StatefulWidget {
//   final UserModel userModel;
//   final User firebaseUser;
//   const CompleteProfile(
//       {super.key, required this.userModel, required this.firebaseUser});

//   @override
//   State<CompleteProfile> createState() => _CompleteProfileState();
// }

// class _CompleteProfileState extends State<CompleteProfile> {
//   File? imageFile;

//   void selectImage(ImageSource source) async {
//     XFile? pickedFile = await ImagePicker().pickImage(source: source);

//     if (pickedFile != null) {
//       cropImage(pickedFile);
//     }
//   }

//   void cropImage(XFile file) async {
//     File? croppedImage = (await ImageCropper.platform.cropImage(
//       sourcePath: file.path,
//       maxWidth: null,
//       maxHeight: null,
//       aspectRatio: null,
//       aspectRatioPresets: const [
//         CropAspectRatioPreset.original,
//         CropAspectRatioPreset.square,
//         CropAspectRatioPreset.ratio3x2,
//         CropAspectRatioPreset.ratio4x3,
//         CropAspectRatioPreset.ratio16x9
//       ],
//       cropStyle: CropStyle.rectangle,
//       compressFormat: ImageCompressFormat.jpg,
//       compressQuality: 20,
//       uiSettings: null,
//     )) as File?;

//     if (croppedImage != null) {
//       setState(() {
//         imageFile = croppedImage;
//       });
//     }
//   }

//   void showPhotoOptions() {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text("Upload Profile Picture"),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ListTile(
//                   onTap: () {
//                     Navigator.pop(context);
//                     selectImage(ImageSource.gallery);
//                   },
//                   leading: Icon(Icons.photo_album),
//                   title: Text("Select From Gallery"),
//                 ),
//                 ListTile(
//                   onTap: () {
//                     Navigator.pop(context);
//                     selectImage(ImageSource.camera);
//                   },
//                   leading: Icon(Icons.camera_alt),
//                   title: Text("Take A Photo"),
//                 ),
//               ],
//             ),
//           );
//         });
//   }

//   final TextEditingController _nameController = TextEditingController();

//   void checkValue() {
//     String fullName = _nameController.text.trim();

//     if (fullName == "" || imageFile == null) {
//       print("Please fill all The fields");
//     } else {
//       uploadData();
//     }
//   }

//   void uploadData() async {
//     UploadTask uploadTask = FirebaseStorage.instance
//         .ref('ProfilePictures')
//         .child(widget.userModel!.uid.toString())
//         .putFile(imageFile!);

//     TaskSnapshot snapshot = await uploadTask;

//     String imageUrl = await snapshot.ref.getDownloadURL();
//     String fullName = _nameController.text.trim();

//     widget.userModel.fullName = fullName;
//     widget.userModel.profileImage = imageUrl;

//     await FirebaseFirestore.instance
//         .collection('user')
//         .doc(widget.userModel.uid)
//         .set(widget.userModel.toMap())
//         .then((value) {
//       print("Data Uploaded");
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: CustomeColors.hintDark,
//         centerTitle: true,
//         title: Text("Complete Profile"),
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: 40),
//         child: ListView(
//           children: [
//             const SizedBox(
//               height: 30,
//             ),
//             CupertinoButton(
//               onPressed: () {
//                 showPhotoOptions();
//               },
//               padding: EdgeInsets.all(0),
//               child: CircleAvatar(
//                   radius: 60,
//                   backgroundImage:
//                       (imageFile != null) ? FileImage(imageFile!) : null,
//                   child: (imageFile == null)
//                       ? Icon(
//                           Icons.person,
//                           size: 60,
//                         )
//                       : null),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             MyTextField(
//                 hintText: 'Full Name',
//                 obscureText: true,
//                 controller: _nameController),
//             const SizedBox(
//               height: 20,
//             ),
//             CupertinoButton(
//                 onPressed: () {
//                   checkValue();
//                 },
//                 child: const My_Button(text: 'Submit')),
//           ],
//         ),
//       ),
//     );
//   }
// }
