import 'package:Hazir/colors.dart';
import 'package:Hazir/coursepage.dart';
import 'package:Hazir/models/attendance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Notifications extends StatelessWidget {
  String userid;
  Notifications({@required this.userid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Notifications'),
      ),
      body: NotificationList(),
    );
  }
}

class NotificationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final changeAttendanceprovider = Provider.of<Attendance>(context, listen: true);

    return new StreamBuilder(
      stream: FirebaseFirestore.instance.collection('notifications').doc(changeAttendanceprovider.id).collection('notifications').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

        if (snapshot.data.docs.length == 0) {
          return Center(child: Text('You have no notifications'));
        }

        return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text(
                    snapshot.data.docs[index]['notification']['title'],
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: snapshot.data.docs[index]['notification']['title'] == 'Absent Notification' ? kPrimaryColor : kAccentColor),
                  ),
                  subtitle: Text(
                    snapshot.data.docs[index]['notification']['body'],
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  onTap: () {
                    for (var course in changeAttendanceprovider.coursedata) {
                      if (course.coursename == snapshot.data.docs[index]['data']['coursename']) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => CoursePage(
                                      coursedata: course,
                                      highlightedDate: snapshot.data.docs[index]['data']['date'],
                                    )));
                      }
                    }
                  },
                  leading: snapshot.data.docs[index]['notification']['title'] == 'Absent Notification'
                      ? Icon(
                          Icons.notification_important,
                          color: kPrimaryColor,
                        )
                      : Icon(
                          Icons.done,
                          color: kAccentColor,
                        ));
            });
      },
    );
  }
}
