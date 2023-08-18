import 'package:flutter/material.dart';

const TextStyle menuStyle = TextStyle(color: Colors.white, fontSize: 20);
const Color backgroundColor = Color(0xFF343442);

class MenuDashboard extends StatefulWidget {
  const MenuDashboard({super.key});

  @override
  State<MenuDashboard> createState() => _MenuDashboardState();
}

class _MenuDashboardState extends State<MenuDashboard>
    with SingleTickerProviderStateMixin {
  late double screenHeight, screenWidth;
  bool isOpen = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _scaleMenuAnimation;
  late Animation<Offset> _menuOffsetAnimation;
  final Duration _duration = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
    _scaleAnimation = Tween(begin: 1.0, end: 0.6).animate(_controller);
    _scaleMenuAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _menuOffsetAnimation = Tween(
            begin: const Offset(-1, 0), end: const Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            createMenu(context),
            createDashboard(context),
          ],
        ),
      ),
    );
  }

  createMenu(BuildContext context) {
    return SlideTransition(
      position: _menuOffsetAnimation,
      child: ScaleTransition(
        scale: _scaleMenuAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextButton.icon(
                  onPressed: null,
                  icon: const Icon(
                    Icons.restaurant_menu,
                    color: Colors.purple,
                  ),
                  label: const Text(
                    "Dashboard",
                    style: menuStyle,
                  ),
                ),
                TextButton.icon(
                  onPressed: null,
                  icon: const Icon(
                    Icons.message,
                    color: Colors.purple,
                  ),
                  label: const Text(
                    "Messages",
                    style: menuStyle,
                  ),
                ),
                TextButton.icon(
                  onPressed: null,
                  icon: const Icon(
                    Icons.accessibility_new,
                    color: Colors.purple,
                  ),
                  label: const Text(
                    "Utility Bills",
                    style: menuStyle,
                  ),
                ),
                TextButton.icon(
                  onPressed: null,
                  icon: const Icon(
                    Icons.transform,
                    color: Colors.purple,
                  ),
                  label: const Text(
                    "Funds Transfer",
                    style: menuStyle,
                  ),
                ),
                TextButton.icon(
                  onPressed: null,
                  icon: const Icon(
                    Icons.build,
                    color: Colors.purple,
                  ),
                  label: const Text(
                    "Branches",
                    style: menuStyle,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  createDashboard(BuildContext context) {
    return AnimatedPositioned(
      duration: _duration,
      top: 0,
      bottom: 0,
      left: isOpen ? 0.4 * screenWidth : 0,
      right: isOpen ? -0.4 * screenWidth : 0,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          borderRadius:
              isOpen ? const BorderRadius.all(Radius.circular(40)) : null,
          elevation: 8,
          color: backgroundColor,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (isOpen) {
                              _controller.reverse();
                            } else {
                              _controller.forward();
                            }
                            isOpen = !isOpen;
                          });
                        },
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "My Cards",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      const Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 200,
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: 200,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          child: Image.network(
                            "https://images.unsplash.com/photo-1524721696987-b9527df9e512?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: 200,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          child: Image.network(
                            "https://cdn.pixabay.com/photo/2015/12/09/01/02/psychedelic-1084082__340.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: 200,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          child: Image.network(
                            "https://images.unsplash.com/photo-1528557692780-8e7be39eafab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(
                            Icons.person,
                            color: Colors.teal,
                          ),
                          title: Text("Student $index", style: menuStyle),
                          trailing: const Icon(
                            Icons.add,
                            color: Colors.purple,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          height: 2,
                        );
                      },
                      itemCount: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
