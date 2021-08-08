import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/shard/components/component.dart';
import 'package:socialapp/styles/colors.dart';

class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.all(8.0),
            elevation: 20.0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Image(
                  image: NetworkImage(
                      "https://image.freepik.com/free-photo/amazed-young-female-with-freckles-wears-striped-longsleeve-openes-mouth-widely-excitement-dropped-jaw-draws-attention-isolated-pink-wall_295783-1568.jpg"),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Communicate with friends',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.white
                  ),),
                )
              ],

            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(
                horizontal: 8.0),
            elevation: 10.0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child:Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25.0,
                        backgroundImage: NetworkImage(
                          "https://image.freepik.com/free-photo/stunned-emotional-man-stares-with-bugged-eyes-expresses-shock-wears-creative-wear-made-sticky-notes-opens-mouth-with-wonder-isolated-pink-wall-hears-latest-news-bad-concequences_273609-42322.jpg"
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [

                                  Text(
                                    "Ahmed Mohamed Ghanam",
                                    style:TextStyle(
                                      height: 1.3
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(Icons.check_circle,
                                    color:defaultColor ,
                                      size: 16.0,
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                "January 21, 2021 at 11:00 pm",
                                style: Theme.of(context).textTheme.caption.copyWith(
                                  height: 1.3
                                ),
                              )
                            ],
                          ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      IconButton(
                          onPressed:(){} ,
                          icon: Icon(
                            Icons.more_horiz,
                            size: 16.0,
                          ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 1.0,
                      color: Colors.grey[300],
                    ),
                  ),
                  Text(
                    "Text messages are used for personal, family, business and social purposes. Governmental and non-governmental organizations use text messaging for communication between colleagues. In the 2010s, the sending of short informal messages became an accepted part of many cultures",
                    style:Theme.of(context).textTheme.subtitle1 ,
                  ),
                  MaterialButton(
                    minWidth: 1.0,
                      padding: EdgeInsets.zero,
                      onPressed: (){},
                    textColor: defaultColor,
                      child: Text(
                    "#software"
                  ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5.0,0, 0),
                    height: 165,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(
                        4.0,
                      ) ,
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://image.freepik.com/free-photo/surprised-african-male-sitting-couch-home-eating-popcorn-watching-exciting-tv-show-online-laptop-computer-shocked-with-cliffhanger-ending-detective-series-keeping-his-mouth-open_273609-1060.jpg"),
                        fit: BoxFit.cover,

                      ),
                    ),
                  )

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
