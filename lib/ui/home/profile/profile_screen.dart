import 'package:BaseApp/ui/dashboard/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared/shared.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> with BaseView{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppConstant.profile),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => navigation.onIntent(RoutName.settingScreen)
          ),
        ],
      ),
      body: _buildProfileWidget(),
    );
  }

  Widget _buildProfileWidget(){
    return Padding(
        padding: EdgeInsets.all(Sizes.dp16(context)),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            _buildAccountWidget(),
            SizedBox(height: Sizes.dp20(context),),
            CardPortfolio(
              imageAsset: ImagesAssets.linkedIn,
              title: 'LinkedIn',
              url: UrlConstant.urlLinkedIn,
            ),
            CardPortfolio(
              imageAsset: ImagesAssets.github,
              title: 'GitHub',
              url: UrlConstant.urlGitHub,
            ),
          ],
        ),
    );
  }

  Widget _buildAccountWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: Sizes.width(context) / 3.2,
          width: Sizes.width(context) / 3.2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.5, color: ColorPalettes.lightAccent),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(ImagesAssets.profileAboutMe),
            ),
          ),
        ),
        SizedBox(height: Sizes.dp16(context)),
        Text("Aldy Ramadhan", style: TextStyle(fontSize: Sizes.dp24(context))),
        Text("Mobile Developer",
            style: TextStyle(color: ColorPalettes.lightAccent, fontSize: Sizes.dp18(context)
            )
        )
      ],
    );
  }
}