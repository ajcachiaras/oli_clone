import 'package:flutter/material.dart';
import 'package:noli/pages/chat_page.dart';

class NoliPage extends StatefulWidget {
  const NoliPage({Key? key}) : super(key: key);

  @override
  State<NoliPage> createState() => _NoliPageState();
}

class _NoliPageState extends State<NoliPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _showNewContainer = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 750))
      ..addStatusListener((status) {
        if (status == AnimationStatus.forward) {
          Future.delayed(Duration(milliseconds: 500), () {
            setState(() {
              _showNewContainer = true;
            });
          });
        }
        if (status == AnimationStatus.reverse) {
          Future.delayed(Duration(milliseconds: 500), () {
            setState(() {
              _showNewContainer = false;
            });
          });
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() async {
    await _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
              width: 200, height: 200, child: Image.asset('images/noli.png')),
          const Text(
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              'Howdy, Andrew!'),
          const SizedBox(
            height: 50,
          ),
          _showNewContainer
              ? GestureDetector(
                  onTap: () async {
                    await _controller.reverse();
                  },
                  child: AnimatedBuilder(
                      animation: _controller,
                      builder: (BuildContext context, Widget? child) {
                        return Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, .001)
                            ..rotateX(_controller.value * 3.14),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width - 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(width: .5, color: Colors.grey)),
                            child: PhysicalModel(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                elevation: 8,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Center(
                                    child: Container(
                                      width: 100,
                                      height: 10,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ),
                                )
                                // child: Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Image.asset(
                                //       'images/community.png',
                                //       scale: 10,
                                //     ),
                                //     Text(
                                //       'Community',
                                //       style: TextStyle(fontWeight: FontWeight.bold),
                                //     )
                                //   ],
                                // ),
                                ),
                          ),
                        );
                      }),
                )
              : GestureDetector(
                  onTap: () async {
                    _startAnimation();
                  },
                  child: AnimatedBuilder(
                      animation: _controller,
                      builder: (BuildContext context, Widget? child) {
                        return Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, .001)
                            ..rotateX(_controller.value * 3.14),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width - 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(width: .5, color: Colors.grey)),
                            child: PhysicalModel(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              elevation: 8,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'images/community.png',
                                    scale: 10,
                                  ),
                                  Text(
                                    'Community',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
          const SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ChatPage()));
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: .5, color: Colors.grey)),
              child: PhysicalModel(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/noli.png',
                        scale: 10,
                      ),
                      Text(
                        'Ask Noli something....',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
