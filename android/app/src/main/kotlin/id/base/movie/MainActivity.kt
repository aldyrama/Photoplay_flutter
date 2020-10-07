package id.base.movie

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService

class MainActivity: FlutterActivity(), PluginRegistry.PluginRegistrantCallback {

    private val channel = R.string.channel
    private val clientKey = R.string.clientKey_sb
    private val merchantServerUrl = R.string.merchantServerUrl

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        FlutterFirebaseMessagingService.setPluginRegistrant(this);
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
    }

    override fun registerWith(registry: PluginRegistry?) {
        io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin.registerWith(registry?.registrarFor("io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin"));
    }
}
