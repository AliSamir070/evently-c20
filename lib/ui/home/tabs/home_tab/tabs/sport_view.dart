import 'package:flutter/material.dart';

import '../../../../../core/remote/network/firestore_manager.dart';
import '../../../../../core/reusable_components/event_item.dart';
import '../../../../../model/event_model.dart';

class SportView extends StatelessWidget {
  const SportView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirestoreManager.getAllEvents(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          // loading status
          return Center(child: CircularProgressIndicator(),);
        }
        if(snapshot.hasError){
          // Error status
          return Column(
            children: [
              Text(snapshot.error.toString()),
              ElevatedButton(onPressed: () {

              }, child: Text("Try Again"))
            ],
          );
        }
        // success status
        List<EventModel> events = snapshot.data??[];
        return ListView.separated(
            itemBuilder: (context, index) => EventItem(event: events[index],),
            separatorBuilder: (context, index) => SizedBox(height: 16,),
            itemCount: events.length
        );
      },
    );
  }
}
