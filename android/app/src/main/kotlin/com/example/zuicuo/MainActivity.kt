package com.example.zuicuo

import android.util.Log
import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
  private var launchChannel:MethodChannel? = null
    private var type = ""
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
      flutterEngine.getPlugins().add(FlutterShortcutPlugin());
      GeneratedPluginRegistrant.registerWith(flutterEngine);
        launchChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger,"flutter_shortcut_plugin")

      val intent = getIntent()
      val msg:String? = intent.getStringExtra("type")
      if(msg != null) {
        type = msg;
      }
    }
    override fun onResume() {
      super.onResume()
      launchChannel?.invokeMethod("launchType",type)
    }
}
