import 'package:flutter/material.dart';
import 'dart:math';
import 'package:clipboard/clipboard.dart';
import 'package:savepass/edit_page.dart';

class GeneratePassword extends StatefulWidget {
  final String username, password, note, type, id;

  const GeneratePassword(
      {Key? key,
      required this.username,
      required this.password,
      required this.note,
      required this.type,
      required this.id})
      : super(key: key);

  @override
  State<GeneratePassword> createState() => _GeneratePasswordState();
}

class _GeneratePasswordState extends State<GeneratePassword> {
  @override
  Widget build(BuildContext context) {
    /* String password = ""; */
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF4361EE)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Password Generator',
            style: TextStyle(color: Color(0xFF4361EE))),
        backgroundColor: const Color(0xFFF6F9F8),
        elevation: 0,
      ),
      body: Container(
        color: const Color(0xFFF6F9F8),
        child: SingleChildScrollView(
          padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              children: [
                /* Passowrd Textfield */
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 24),
                  child: TextFormField(
                    controller: passwordController,
                    enabled: false,
                    /* initialValue: 'asdads', */
                    decoration: InputDecoration(
                      fillColor: const Color(0xffEEEEEE),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xff4361EE),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      /* prefixIcon: const Icon(
                          Icons.email,
                          color: Color(0xff191E23),
                        ), */
                      labelText: 'Generate',
                      labelStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Color(0xff191E23),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                /* Button */
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 7, 0),
                        child: ElevatedButton(
                          onPressed: () {
                            FlutterClipboard.copy(passwordController.text).then(
                                (value) => ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        content: Text('Password copied'))));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffffffff),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            textStyle: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Salin',
                            style: TextStyle(color: Color(0xff4361EE)),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(7, 0, 0, 0),
                        child: ElevatedButton(
                          onPressed: () {
                            String upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
                            String lower = 'abcdefghijklmnopqrstuvwxyz';
                            String numbers = '1234567890';
                            String symbols = '!@#\$%^&*()<>,./';
                            int passLength = 16;
                            String seed = upper + lower + numbers + symbols;
                            String password = '';
                            List<String> list = seed.split('').toList();
                            Random rand = Random();

                            for (int i = 0; i < passLength; i++) {
                              int index = rand.nextInt(list.length);
                              password += list[index];
                            }
                            passwordController.text = password;
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff191E23),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            textStyle: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('Generate'),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                /* Button */
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 34),
                  child: ElevatedButton(
                    onPressed: () {
                      if (passwordController.text == '') {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Generate Terlebih Dahulu')));
                        return;
                      }
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditPage(
                            username: widget.username,
                            password: passwordController.text,
                            note: widget.note,
                            type: widget.type,
                            id: widget.id,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xff4361EE),
                      fixedSize: Size(MediaQuery.of(context).size.width, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Gunakan',
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
