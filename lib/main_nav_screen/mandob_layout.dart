import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/bloc/cubit/cubit.dart';
import '../components/bloc/cubit/states.dart';

class MandobLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MandobCubit, MandobStates>(
        builder: (context, state) {
          var cubit = MandobCubit.get(context);
          return Scaffold(
              body: cubit.bottomScreens[cubit.CurrentIndex],
              bottomNavigationBar: BottomNavigationBar(
                onTap: (value) {
                  cubit.changeIndex(value,context);


                },
                currentIndex: cubit.CurrentIndex,
                items: cubit.BottomItem,
                selectedFontSize: 10,
              ));
              // drawer: Drawer(
              //   child:Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Container(
              //         margin: EdgeInsetsDirectional.only(top:40,start: 10),
              //         child: Row(children: [
              //           CustomCircleAvatarNetworkImage(bigRadius: .08, smallRedius: .072, backgroundColorBig: purple, backgroundColorSmall: Colors.white,image:"https://tinypng.com/images/social/website.jpg"),
              //           SizedBox(width: 15,),
              //           Column(
              //             children: [
              //               Text("محمود محمد",),
              //               Text("01148920246")
              //             ],
              //           )
              //         ],),
              //       ),
              //       SizedBox(height: 50,),
              //       Expanded(
              //         flex: 4,
              //         child: ListView.separated(
              //           physics: NeverScrollableScrollPhysics(),
              //             itemBuilder: (context, index) =>  InkWell(
              //               onTap: (){
              //                 navigateTo(context,cubit.drawerScreens[index]);
              //               },
              //               child: Container(
              //                 margin: EdgeInsetsDirectional.only(start:10),
              //                 child: Row(
              //                   children: [
              //                     SvgPicture.asset(cubit.SvgPics[index],width:40,height: 40,color:purple),
              //                     SizedBox(width: 10,),
              //                     Text(cubit.drawerNames[index],style: TextStyle(fontSize: 20,color:purple)),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //             separatorBuilder: (context,index)=> Padding(
              //               padding: const EdgeInsets.all(10),
              //               child: Container(
              //                 height: 2,
              //                 color: Colors.grey[300],
              //
              //               ),
              //             ),
              //             itemCount: 5),
              //       ),
              //       Expanded(flex: 1,child: InkWell(
              //         onTap: (){},
              //         child: Container(
              //           margin: EdgeInsetsDirectional.all(15),
              //           child: Row(
              //             children: [
              //               SvgPicture.asset("assets/icons/logout.svg",width: 60,height: 60,color: Colors.red),
              //               SizedBox(width: 10,),
              //               Text("خروج",style: TextStyle(fontSize: 20,color:Colors.red),),
              //             ],
              //           ),
              //         ),
              //       ))
              //
              //     ],
              //   ),
              //
              // ));
        });
  }
}
