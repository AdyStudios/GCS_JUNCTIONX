import 'dart:collection';

import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
          text: TextSpan(
            children: [
              TextSpan(
                 text: "Video1\n",
                  recognizer: TapGestureRecognizer()..onTap =  () async{
                    var url = "https://www.youtube.com/channel/UCwxiHP2Ryd-aR0SWKjYguxw?view_as=subscriber";
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                  }
              ),
              TextSpan(
                 text: "Video2\n",
                  recognizer: TapGestureRecognizer()..onTap =  () async{
                    var url = "https://www.youtube.com/channel/UCwxiHP2Ryd-aR0SWKjYguxw?view_as=subscriber";
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                  }
              ),
              TextSpan(
                 text: "Video3\n",
                  recognizer: TapGestureRecognizer()..onTap =  () async{
                    var url = "https://www.youtube.com/channel/UCwxiHP2Ryd-aR0SWKjYguxw?view_as=subscriber";
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                  }
              ),
              TextSpan(
                 text: "Video4\n",
                  recognizer: TapGestureRecognizer()..onTap =  () async{
                    var url = "https://www.youtube.com/channel/UCwxiHP2Ryd-aR0SWKjYguxw?view_as=subscriber";
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                  }
              ),
            ]
        ));
  }
}