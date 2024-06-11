import 'package:nftapp/header.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height / 6.6,
          ),
          Center(
            child: Container(
              height: height * 0.45,
              width: width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "asset/intro.png",
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height / 18,
          ),
          Text(
            "DISCOVER THE WORLD OF NFTS",
            style: MyGoogleFonts.robotoBold(height),
          ),
          SizedBox(
            height: height / 150,
          ),
          Text(
            "AND BE PART OF THE NFTCULTURE",
            style: MyGoogleFonts.robotoBold(height),
          ),
          SizedBox(
            height: height / 11,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed("/login");
                },
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    alignment: Alignment.center,
                    height: height / 12,
                    width: width / 2.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    child: Text(
                      "Explore",
                      style:
                          TextStyle(color: Colors.white, fontSize: height / 38),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width / 25,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  alignment: Alignment.center,
                  height: height / 12,
                  width: width / 2.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 3,
                      color: Colors.grey,
                    ),
                    color: Colors.white,
                  ),
                  child: Text(
                    "Create",
                    style:
                        TextStyle(color: Colors.black, fontSize: height / 38),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MyGoogleFonts {
  static TextStyle robotoBold(double height) {
    return GoogleFonts.roboto(
      fontSize: height / 37,
      fontWeight: FontWeight.w400,
    );
  }
}
