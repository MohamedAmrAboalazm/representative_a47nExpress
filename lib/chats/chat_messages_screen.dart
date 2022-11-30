import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:representative_a47nexpress/components/bloc/cubit/cubit.dart';
import 'package:representative_a47nexpress/components/bloc/cubit/states.dart';
import 'package:representative_a47nexpress/components/items.dart';
import 'package:representative_a47nexpress/models/message_model.dart';

import '../colors.dart';

class ChatMessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textController=TextEditingController();
    return BlocBuilder<MandobCubit,MandobStates>(
     builder: (context, state) =>  Scaffold(
       appBar: customAppBar(context, imageTitle: "assets/icons/noun-talk-4679128.svg",imageAction: "assets/icons/menu.svg", text: "دردشة"),
      /* body: Column(
         children: [
           Column(
             children: [
               buildMessage(context),
               buildMyMessage(context),


             ],
           ),
           Spacer(),
           Directionality(
             textDirection: TextDirection.ltr,
             child: Container(
               margin: EdgeInsets.symmetric(horizontal:10,vertical: 10),
               decoration:BoxDecoration(
                 border: Border.all(
                   color: Colors.grey,
                   width:1,
                 ),
                 borderRadius: BorderRadius.circular(15),
               ),
               clipBehavior: Clip.antiAliasWithSaveLayer,
               child: Row(
                 children: [
                   Expanded(
                     child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 15),
                       child: TextFormField(
                         controller: textController,
                         onFieldSubmitted: (s){

                         },
                         decoration: InputDecoration(
                             border:InputBorder.none,
                             hintText:"type your message here ...."

                         ),
                       ),
                     ),
                   ),
                   Container(
                     height: 60,
                     color: purple,
                     child: MaterialButton(onPressed: (){
                       MandobCubit.get(context).sendMessage(text:textController.text,receiverId:1000 ,datetime:DateTime.now().toString());
                       textController.text="";
                     },
                       minWidth: 1,
                       child: Icon(Icons.send,color: Colors.white,size: 16,),
                     ),
                   )
                 ],
               ),
             ),
           ),

         ],
       ),*/
       body:Center(child: Text("SOOOON",style: TextStyle(fontSize: 30),),


     ),

        ));
  }
  Widget buildMessage(context)=> Container(
    margin: EdgeInsetsDirectional.only(top: 20,start: 20),
    child: Row(
      children: [
        Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.height-40,
            ),
            decoration: BoxDecoration(
              color: purple.withOpacity(.2),
              borderRadius: BorderRadiusDirectional.only(
                  bottomStart:Radius.circular(8),
                  topEnd: Radius.circular(8),
                  topStart: Radius.circular(8)
              ),
            ),
            padding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("message  vfb"),



              ],
            )
        ),
        SizedBox(width: 5,),
        Stack(
          children: [
            CircleAvatar(
              radius: MediaQuery. of(context).size.height * .04,
              backgroundColor: purple,
              child: CircleAvatar(
                radius: MediaQuery. of(context).size.height * .034,
                backgroundImage: NetworkImage(
                    "https://tinypng.com/images/social/website.jpg"),
              ),
            ),
          ],
        ),
      ],
    ),
  );
  Widget buildMyMessage(context)=> Container(
    margin: EdgeInsetsDirectional.only(top:20,end: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CircleAvatar(
              radius: MediaQuery. of(context).size.height * .04,
              backgroundColor: purple,
              child: CircleAvatar(
                radius: MediaQuery. of(context).size.height * .034,
                backgroundImage: NetworkImage(
                    "https://tinypng.com/images/social/website.jpg"),
              ),
            ),
          ],
        ),
        SizedBox(width: 5,),
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width-40,),
            decoration: BoxDecoration(
              color: purple.withOpacity(.2),
              borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(8),
                  topStart: Radius.circular(8),
                bottomEnd: Radius.circular(8),

              ),
            ),
            padding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20
            ),
            child: Text("messagffffffffffffffffffffevfb")
        ),


      ],
    ),
  );
}
