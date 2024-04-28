
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uts/screen_page/page_login.dart';
import '../model/model_register.dart';

class PageRegisterApi extends StatefulWidget {
  const PageRegisterApi({Key? key}) : super(key: key);

  @override
  State<PageRegisterApi> createState() => _LatPageRegisterApiState();
}

class _LatPageRegisterApiState extends State<PageRegisterApi> {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtnama = TextEditingController();
  TextEditingController txtnobp = TextEditingController();
  TextEditingController txtnohp = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtalamat = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  bool isLoading = false;

  Future<ModelRegisterApi?> registerAccount() async {
    try {
      setState(() {
        isLoading = true;
      });
      http.Response response = await http.post(
        Uri.parse("http://172.20.10.6/uts_mobile/register.php"),
        body: {
          "username": txtUsername.text,
          "nama": txtnama.text,
          "nobp": txtnohp.text,
          "nohp": txtnobp.text,
          "email": txtemail.text,
          "alamat": txtalamat.text,
          "password": txtpassword.text,


        },
      );
      ModelRegisterApi data = modelRegisterApiFromJson(response.body);
      if (data.value == 1) {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${data.message}")),
          );
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const PageLoginApi()),
                (route) => false,
          );
        });
      } else if (data.value == 2) {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${data.message}")),
          );
        });
      } else {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${data.message}")),
          );
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Form  Register'),
      ),
      body: Form(
        key: keyForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtUsername,
                  decoration: InputDecoration(
                    hintText: 'Input username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ) ,
                SizedBox(height: 8,),
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtnama,
                  decoration: InputDecoration(
                    hintText: 'Input nama',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtnobp,
                  decoration: InputDecoration(
                    hintText: 'Input nobp',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtnohp,
                  decoration: InputDecoration(
                    hintText: 'Input nohp',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtemail,
                  decoration: InputDecoration(
                    hintText: 'Input email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtalamat,
                  decoration: InputDecoration(
                    hintText: 'Input alamt',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtpassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Input Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 8,),

                SizedBox(height: 8,),
                SizedBox(height: 15,),
                SizedBox(height: 15,),
                Center(
                  child: isLoading ? Center(
                    child: CircularProgressIndicator(),
                  ) : MaterialButton(
                    onPressed: () {
                      if (keyForm.currentState?.validate() == true) {
                        setState(() {
                          registerAccount();
                        });
                      }
                    },
                    child: Text('Register'),
                    color: Colors.green,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(width: 1, color: Colors.green),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PageLoginApi()),
            );
          },
          child: Text('Anda sudah punya account? Silakan Login'),
        ),
      ),
    );
  }
}