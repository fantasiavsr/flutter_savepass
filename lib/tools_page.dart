import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:savepass/generate_password_tools.dart';
/* import 'package:savepass/add_page.dart'; */
import 'package:savepass/main_page.dart';

class ToolsPage extends StatefulWidget {
  const ToolsPage({super.key});

  @override
  State<ToolsPage> createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF4361EE)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Tools', style: TextStyle(color: Color(0xFF4361EE))),
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
      body: Container(
        color: const Color(0xFFF6F9F8),
        child: SingleChildScrollView(
          padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              /* mainAxisAlignment: MainAxisAlignment.start, */
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: const [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 2),
                      child: Text(
                        "Easy to use tools,",
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
                        "pilih alat untuk digunakan",
                        style: TextStyle(
                          color: Color(0xff6C7C8F),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Card(
                  child: ListTile(
                    title: const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 20, 0, 5),
                      child: Text("Password Manager"),
                    ),
                    subtitle: const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 20),
                      child: Text(
                          "pembuatan password yang kuat menggunakan algoritma enkripsi"),
                    ),
                    trailing: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: IconButton(
                        icon: const FaIcon(FontAwesomeIcons.key,
                            color: Color(0xff6C7C8F)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const GeneratePasswordTools(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
