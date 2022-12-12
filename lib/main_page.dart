import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savepass/tools_page.dart';
import 'package:savepass/welcome_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:savepass/detail_page.dart';
import 'package:savepass/add_page.dart';

// ignore: must_be_immutable
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference kode = firestore.collection('kode');

    var user = FirebaseAuth.instance.currentUser;
    /* var username = FirebaseAuth.instance.currentUser?.displayName.toString(); */

    return Scaffold(
      backgroundColor: const Color(0xffF6F9F8),
      /* appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        flexibleSpace: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(30, 50, 30, 0),
          child: Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    print('Tapped on logo');
                  },
                  child: Image.asset(
                    'images/savepass_logo_small_dark.png',
                    width: 87.3,
                    height: 31.39,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    /* FirebaseAuth.instance.signOut(); */
                    print('Tapped on dots');
                  },
                  child: Image.asset(
                    'images/dots.png',
                    width: 32,
                    height: 32,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ), */
      // ignore: sized_box_for_whitespace
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(30, 50, 30, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            /* mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center, */
            children: [
              /* Top Bar */
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/savepass_logo_small_dark.png',
                      width: 87.3,
                      height: 31.39,
                      fit: BoxFit.fitHeight,
                    ),
                    GestureDetector(
                      onTap: () {
                        showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierLabel: MaterialLocalizations.of(context)
                              .modalBarrierDismissLabel,
                          barrierColor: Colors.black.withOpacity(0.5),
                          transitionDuration: const Duration(milliseconds: 200),
                          pageBuilder: (BuildContext buildContext,
                              Animation animation,
                              Animation secondaryAnimation) {
                            return Align(
                              alignment: Alignment.bottomCenter,
                              // ignore: sized_box_for_whitespace
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                /* height: 300, */
                                /* color: Colors.white, */
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        minimumSize:
                                            MaterialStateProperty.all<Size>(
                                          Size(
                                              MediaQuery.of(context).size.width,
                                              50),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                const Color(0xffF6F9F8)),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        )),
                                      ),
                                      onPressed: () async {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                        await GoogleSignIn().signOut();
                                        await FirebaseAuth.instance.signOut();
                                        // ignore: use_build_context_synchronously
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (dialogContex) =>
                                                const WelcomePage(),
                                          ),
                                          (r) => false,
                                        );
                                      },
                                      child: const Text(
                                        'Log out',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          transitionBuilder:
                              (context, animation, secondaryAnimation, child) =>
                                  SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, 1),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          ),
                        );
                      },
                      child: Image.asset(
                        'images/dots.png',
                        width: 32,
                        height: 32,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ),
              /* Main Content */
              // ignore: sized_box_for_whitespace
              Container(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                height: MediaQuery.of(context).size.height * 0.750,
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  /* padding: const EdgeInsets.all(8), */
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                          child: Text(
                            "Secure your data,",
                            style: TextStyle(
                              color: Color(0xff4361EE),
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                          child: Text(
                            "tekan tanda + untuk menambahkan",
                            style: TextStyle(
                              color: Color(0xff6C7C8F),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    StreamBuilder(
                      stream: kode
                          .where('email', isEqualTo: user?.email)
                          .orderBy('createdAt', descending: true)
                          .snapshots(),
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: snapshot.data!.docs.map((document) {
                              return Card(
                                child: ListTile(
                                  title: Text(document['type']),
                                  subtitle: Text(document['username']),
                                  trailing: IconButton(
                                    icon: const FaIcon(
                                        FontAwesomeIcons.ellipsisVertical,
                                        color: Color(0xff6C7C8F)),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailPage(
                                            id: document.id,
                                            type: document['type'],
                                            username: document['username'],
                                            password: document['password'],
                                            note: document['note'],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        } else {
                          return const Text('Loading');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        // ignore: sized_box_for_whitespace
        child: Container(
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.transparent,
                  spreadRadius: 0,
                  blurRadius: 0,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
              border: Border.all(color: const Color(0xffF6F9F8), width: 0),
              color: const Color(0xffF6F9F8)),
          height: 106,
          child: Column(
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xff4361EE)),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(MediaQuery.of(context).size.width * 0.7, 50),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                  ),
                  shadowColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(0, 0, 0, 0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddPage(
                        username: '',
                        note: '',
                        password: '',
                        type: '',
                      ),
                    ),
                  );
                },
                child: const Text(
                  '+',
                  style: TextStyle(
                    fontSize: 36,
                  ),
                ),
              ),
              /* Bottom Nav */
              Container(
                  /* padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0), */
                  color: Colors.white,
                  child: /* Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.home,
                        color: Color.fromRGBO(67, 97, 238, 1),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        /* Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        ); */
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Color.fromRGBO(67, 97, 238, 1),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        /* Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        ); */
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Color.fromRGBO(67, 97, 238, 1),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        /* Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        ); */
                      },
                      icon: const Icon(
                        Icons.person,
                        color: Color.fromRGBO(67, 97, 238, 1),
                      ),
                    ),
                  ],
                ), */
                      /* BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white,
                  selectedItemColor: const Color.fromRGBO(67, 97, 238, 1),
                  unselectedItemColor: const Color.fromRGBO(67, 97, 238, 1),
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: FaIcon(
                        FontAwesomeIcons.screwdriverWrench,
                        size: 18.5,
                      ),
                      label: 'Tools',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Settings',
                    ),
                  ],
                ), */
                      Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainPage(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        },
                        icon: const Icon(
                          Icons.home,
                          color: Color.fromRGBO(67, 97, 238, 1),
                        ),
                        tooltip: 'Home',
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ToolsPage(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.screwdriverWrench,
                          size: 18.5,
                          color: Color.fromRGBO(67, 97, 238, 1),
                        ),
                        tooltip: 'Tools',
                      ),
                      IconButton(
                        onPressed: () {
                          /* Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        ); */
                        },
                        icon: const Icon(
                          Icons.settings,
                          color: Color.fromRGBO(67, 97, 238, 1),
                        ),
                        tooltip: 'Add',
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
