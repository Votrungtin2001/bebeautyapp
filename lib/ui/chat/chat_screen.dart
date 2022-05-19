import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/ui/chat/widget/ChatMessage.dart';
import 'package:bebeautyapp/ui/chat/widget/message.dart';
import 'package:flutter/material.dart';

class ChatScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: ListView.builder(
                itemCount: demoChatMessages.length,
                itemBuilder: (context, index) =>
                    Message(message: demoChatMessages[index]),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding / 2,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 32,
                  color: kPrimaryColor.withOpacity(0.08),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 0.75,
                      ),
                      decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: kDefaultPadding / 4),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Type message",
                                focusColor: kTextLightColor,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.attach_file,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .color!
                                .withOpacity(0.64),
                          ),
                          SizedBox(width: kDefaultPadding / 4),
                          Icon(
                            Icons.camera_alt_outlined,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .color!
                                .withOpacity(0.64),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: kDefaultPadding / 4),
                  Icon(
                    Icons.send,
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .color!
                        .withOpacity(0.64),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          kAppNameTextPinksm,
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.local_phone),
          color: kCopy,
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }
}
