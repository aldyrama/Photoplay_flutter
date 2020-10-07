//
// import 'package:uni_links/uni_links.dart';
//
// enum UniLinksType { string, uri }
//
// class DeeplinkService{
//   UniLinksType _type = UniLinksType.string;
//
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     if (_type == UniLinksType.string) {
//       await initPlatformStateForStringUniLinks();
//     } else {
//       await initPlatformStateForUriUniLinks();
//     }
//   }
//
//   /// An implementation using the [Uri] convenience helpers
//   Future<void> initPlatformStateForUriUniLinks() async {
//     // Attach a listener to the Uri links stream
//     _sub = getUriLinksStream().listen((Uri uri) {
//       if (!mounted) return;
//       setState(() {
//         _latestUri = uri;
//         _latestLink = uri?.toString() ?? 'Unknown';
//       });
//     }, onError: (Object err) {
//       if (!mounted) return;
//       setState(() {
//         _latestUri = null;
//         _latestLink = 'Failed to get latest link: $err.';
//       });
//     });
//
//     // Attach a second listener to the stream
//     getUriLinksStream().listen((Uri uri) {
//       print('got uri: ${uri?.path} ${uri?.queryParametersAll}');
//     }, onError: (Object err) {
//       print('got err: $err');
//     });
//
//     // Get the latest Uri
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       _initialUri = await getInitialUri();
//       print('initial uri: ${_initialUri?.path}'
//           ' ${_initialUri?.queryParametersAll}');
//       _initialLink = _initialUri?.toString();
//     } on PlatformException {
//       _initialUri = null;
//       _initialLink = 'Failed to get initial uri.';
//     } on FormatException {
//       _initialUri = null;
//       _initialLink = 'Bad parse the initial link as Uri.';
//     }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//
//     setState(() {
//       _latestUri = _initialUri;
//       _latestLink = _initialLink;
//     });
//   }
//
// }