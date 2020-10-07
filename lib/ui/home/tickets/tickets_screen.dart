import 'package:BaseApp/ui/dashboard/dashboard.dart';
import 'package:flutter/scheduler.dart';

class TicketsScreen extends StatefulWidget {
  final bool active;

  const TicketsScreen({Key key, this.active = false}) : super(key: key);

  @override
  _TicketsState createState() => _TicketsState();
}

class _TicketsState extends State<TicketsScreen> with AutomaticKeepAliveClientMixin{

  @override
  void initState() {
    super.initState();
  }

  void _doRefresh(){
    print("page refresh");
  }

  @override
  void didUpdateWidget(TicketsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(widget.active) _doRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppConstant.tickets),
        centerTitle: true,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}