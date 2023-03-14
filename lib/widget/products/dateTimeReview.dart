
import 'package:flutter/material.dart';

class DateTimeReview extends StatefulWidget {
  final DateTime createdAt;
  DateTimeReview(this.createdAt);
  @override
  State<DateTimeReview> createState() => _DateTimeReviewState(this.createdAt);
}

class _DateTimeReviewState extends State<DateTimeReview> {
  final DateTime createdAt;
  _DateTimeReviewState(this.createdAt);
  late int diefriens;
  late Text ddddd;
  // @override
  //   void initState() {
  //    // diefriens= DateTime.now().difference(createdAt).inDays;
  // diefriens = DateTime.now().year - createdAt.year;
  // if(diefriens==0){
  //     diefriens = DateTime.now().month - createdAt.month;
  //     if(diefriens==0){
  //       diefriens = DateTime.now().day - createdAt.day;
  //     }
  //
  // }
  //     super.initState();
  //   }
  Dt(){
    diefriens = DateTime.now().year - createdAt.year;
    if(diefriens==0){
      diefriens = DateTime.now().month - createdAt.month;
      if(diefriens==0){
        diefriens = DateTime.now().day - createdAt.day;
        return Text(diefriens!=0?'${diefriens} day':'today',style: const TextStyle(fontWeight: FontWeight.w600,fontSize:15,color: Colors.black38),);
      }else{
        return Text('${diefriens} mon',style: const TextStyle(fontWeight: FontWeight.w600,fontSize:15,color: Colors.black38),);


      }
    }else{
      return Text('${diefriens} year',style: const TextStyle(fontWeight: FontWeight.w600,fontSize:17,color: Colors.black38),);
    }
  }
  @override
  void initState() {
    ddddd=Dt();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ddddd;
  }
}