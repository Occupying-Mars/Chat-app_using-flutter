import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  
  
  getUserByUsername(String username)async{
     return await FirebaseFirestore.instance.collection("users")
      .where("name", isEqualTo: username)
     .get();
  }
  getUserByUserEmail(String userEmail)async{
    return await FirebaseFirestore.instance.collection("users")
        .where("Email", isEqualTo: userEmail)
        .get();
  }

  uploadUserInfo(userMap){
    FirebaseFirestore.instance.collection("users")
    .add(userMap).catchError((e){
      print(e.toString());
    });
  }

  createChatRoom(String charRoomId, chatRoomMap){
    FirebaseFirestore.instance.collection("ChatRoom")
      .doc(charRoomId).set(chatRoomMap).catchError((e){
        print(e.toString());
    });
  }
}