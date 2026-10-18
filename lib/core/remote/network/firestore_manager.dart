import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_c20/model/event_model.dart';
import 'package:evently_c20/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class FirestoreManager {

  static CollectionReference<User> getUserCollection(){
    var collection = FirebaseFirestore.instance.collection("User").withConverter(
      fromFirestore:(snapshot, options) {
        Map<String,dynamic>? data = snapshot.data();
        return User.fromFireStore(data);
      } ,
      toFirestore: (user, options) {
        return user.toFireStore();
      },);
    return collection;
  }
  static Future<void> saveUser(User myUser){
    var collection = getUserCollection();
    var doc = collection.doc(myUser.id);
    return doc.set(myUser);

  }

  static Future<User?> getUser()async{
    var collection = getUserCollection();
    var doc = collection.doc(auth.FirebaseAuth.instance.currentUser?.uid);
    var snapshot = await doc.get();
    return snapshot.data();
  }

  static CollectionReference<EventModel> getEventsCollection(){
    var collection = FirebaseFirestore.instance.collection("Event").withConverter(
        fromFirestore: (snapshot, options) {
          var docSnapshot = snapshot.data();
          return EventModel.fromFirestore(docSnapshot);
        },
        toFirestore:  (value, options) {
          return value.toFirestore();
        },
    );
    return collection;
  }
  static Future<void> saveEvent(EventModel event){
    var collection = getEventsCollection();
    var doc = collection.doc();
    event.id = doc.id;
    return doc.set(event);
  }

  static Future<List<EventModel>> getAllEvents()async{
    var collection = getEventsCollection();
    var queryDocSnapshot = await collection.get();
    var docs = queryDocSnapshot.docs;
    List<EventModel> events = docs.map((document) => document.data(),).toList();
    return events;
  }
}


/*
*  {
*   "name" :"Ahmed",
*   "age":25,
*   "friends: [
*        {
*         "name":"wael",
*         "phone":"01020202"
*         },
*         {
*         "name":"Said",
*         "phone":"01120202"
*         }
*        ]
*   }
*
*
*
* */