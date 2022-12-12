import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:savepass/main_page.dart';
import 'package:savepass/tools_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:savepass/welcome_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
/* import 'package:cloud_firestore/cloud_firestore.dart'; */

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    var email = user!.email;
    var username = email!.split('@')[0];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF4361EE)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title:
            const Text('Settings', style: TextStyle(color: Color(0xFF4361EE))),
        backgroundColor: const Color(0xFFF6F9F8),
        elevation: 0,
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
          height: 56,
          child: Column(
            children: [
              /* ElevatedButton(
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
              ), */
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
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SettingsPage(),
                            ),
                            (Route<dynamic> route) => false,
                          );
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
      body: SafeArea(
          child: Container(
        color: const Color(0xFFF6F9F8),
        child: SingleChildScrollView(
          padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 30, 0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              /* mainAxisAlignment: MainAxisAlignment.start, */
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  /* height: MediaQuery.of(context).size.height * 0.2, */
                  decoration: BoxDecoration(
                    color: const Color(0xFFFfffff),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(17, 0, 0, 0),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 40, 0, 20),
                          child: Image.asset(
                            'images/dummy_user.png',
                            width: 80,
                            height: 80,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 20, 0, 20),
                          child: Text(username,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                        ),
                        /* GestureDetector(
                          onTap: () async {
                            await GoogleSignIn().signOut();
                            await FirebaseAuth.instance.signOut();

                            // ignore: use_build_context_synchronously
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WelcomePage(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                            child: Text("Logout",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFFEE4343))),
                          ),
                        ), */
                        ElevatedButton(
                          onPressed: () async {
                            await GoogleSignIn().signOut();
                            await FirebaseAuth.instance.signOut();

                            // ignore: use_build_context_synchronously
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WelcomePage(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            foregroundColor: Colors.black,
                            backgroundColor: const Color(0xffffffff),
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.8, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Log out',
                            style: TextStyle(
                              color: Color(0xffEE4343),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 10),
                  child: ElevatedButton(
                    onPressed: () async {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xff191E23),
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * 0.8, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Bantuan',
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: const Color(0xffffffff),
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * 0.8, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Tentang kami',
                    style: TextStyle(
                      color: Color(0xff191E23),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
