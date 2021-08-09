package com.example.zuicuo

import android.content.Context
import android.content.Intent
import android.util.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.*
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import com.example.zuicuo.MainActivity

class FlutterShortcutPlugin:FlutterPlugin, MethodCallHandler {
  private var channel:MethodChannel? = null
  private var context:Context? = null
  companion object {

    var channelName = "flutter_shortcut_plugin"
    fun registerWith(registry:PluginRegistry.Registrar) {
            var flutterPlugin = FlutterShortcutPlugin()
            flutterPlugin.channel = MethodChannel(registry.messenger(), channelName)
            flutterPlugin.context = registry.context()
            flutterPlugin.channel?.setMethodCallHandler(flutterPlugin)
    }
  }

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, channelName)
        context = binding.applicationContext
        channel!!.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel?.setMethodCallHandler(null)
        channel = null;
    }

  override fun onMethodCall(call:MethodCall,result:MethodChannel.Result){
    if(call.method == "createIconLauncher") {
      Log.e("FlutterShortcutPlugin",call.method)
      createIconLauncher()
      result.success("Android")
    }else {
      result.notImplemented()
    }
  }
  private fun createIconLauncher() {
    Log.e("FlutterShortcutPlugin","start create")


    val launcherIntent = Intent(Intent.ACTION_MAIN)
    launcherIntent.setClass(context, MainActivity::class.java)
    launcherIntent.putExtra("type","abc")
    launcherIntent.addCategory(Intent.CATEGORY_LAUNCHER)
    

    val icon = Intent.ShortcutIconResource.fromContext(context, R.mipmap.ic_launcher)

    val ACTION_ADD_SHORTCUT = "com.android.launcher.action.INSTALL_SHORTCUT"
    val addShortcutIntent = Intent(ACTION_ADD_SHORTCUT)
    addShortcutIntent.putExtra("duplicate", false)
    addShortcutIntent.putExtra(Intent.EXTRA_SHORTCUT_NAME, "launcher")
    addShortcutIntent.putExtra(Intent.EXTRA_SHORTCUT_ICON_RESOURCE, icon)
    addShortcutIntent.putExtra(Intent.EXTRA_SHORTCUT_INTENT, launcherIntent)
    context?.sendBroadcast(addShortcutIntent)

    val items = listOf(
      "com.android.launcher.action.INSTALL_SHORTCUT",
      "com.android.launcher2.action.INSTALL_SHORTCUT",
      "com.android.launcher3.action.INSTALL_SHORTCUT",
      "com.meizu.flyme.launcher.action.INSTALL_SHORTCUT",
      "com.vivo.launcher.action.INSTALL_SHORTCUT",
      "com.oppo.launcher.action.INSTALL_SHORTCUT",
      "com.lenovo.launcher.action.INSTALL_SHORTCUT",
      "com.htc.launcher.action.INSTALL_SHORTCUT",
      "com.qiku.launcher.action.INSTALL_SHORTCUT",
      "com.qihoo360.launcher.action.INSTALL_SHORTCUT",
      "com.lge.launcher.action.INSTALL_SHORTCUT",
      "net.qihoo.launcher.action.INSTALL_SHORTCUT",
      "net.qihoo.launcher.action.INSTALL_SHORTCUT",
      "com.fede.launcher.action.INSTALL_SHORTCUT",
      "com.sec.android.app.twlauncher.INSTALL_SHORTCUT",
      "com.tencent.qqlauncher.action.INSTALL_SHORTCUT",
      "org.adwfreak.launcher.action.INSTALL_SHORTCUT",
      "com.ebproductions.android.launcher.action.INSTALL_SHORTCUT",
      "com.nd.android.launcher.action.INSTALL_SHORTCUT",
      "com.yulong.android.launcher.action.INSTALL_SHORTCUT",
      "com.android.mylauncher.action.INSTALL_SHORTCUT",
      "com.ztemt.launcher.action.INSTALL_SHORTCUT",
      "cn.nubia.launcher.action.INSTALL_SHORTCUT",
      "org.adw.launcher_donut.action.INSTALL_SHORTCUT",
      "com.zte.mifavor.launcher.action.INSTALL_SHORTCUT",
      "com.yulong.android.launcherL.action.INSTALL_SHORTCUT",
      "com.bbk.launcher.action.INSTALL_SHORTCUT",
      "com.bbk.launcher2.action.INSTALL_SHORTCUT",
      "com.google.android.launcher.action.INSTALL_SHORTCUT",
      "com.yulong.android.launcher3.action.INSTALL_SHORTCUT",
      "org.adw.launcher.action.INSTALL_SHORTCUT",
      "com.huawei.android.launcher.action.INSTALL_SHORTCUT",
      "com.huawei.launcher3.action.INSTALL_SHORTCUT"
      );

      for(item in items) {
        addShortcutIntent.action = item
        context?.sendBroadcast(addShortcutIntent)
      }

    Log.e("FlutterShortcutPlugin","end create")
  }
  
}