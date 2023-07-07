package com.example.applicationhiit

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val channel = "lightacademy/getinfos"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler {
                call, result ->
            if(call.method == "listenForRobbery"){
                Intent(this,robberyService::class.java).also {
                    intent->startService(intent)
                }
            }
            else{
                result.notImplemented()
            }
        }
    }
}
