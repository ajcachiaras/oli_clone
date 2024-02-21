import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool _displayApiCall = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              color: Colors.cyan,
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 100,
                      child: TextField(
                        controller: controller,
                        maxLines: 1,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey),
                            ),
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: 'Chat with Oli'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async{
                        setState(() {
                          _displayApiCall = true;
                        });
                        await Future.delayed(Duration(seconds: 2), () {
                          setState(() {
                            _displayApiCall = false;
                          });
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        // color: Colors.cyan,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.cyan),
                        child: Icon(Icons.send),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              _displayApiCall ? Text('Calling API using Get_It') : SizedBox()
            ],
          ),
        ));
  }
}
