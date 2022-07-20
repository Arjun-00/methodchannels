package com.example.methodchannels
import android.os.Bundle
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import org.json.JSONObject

class MainActivity: FlutterActivity() {
    private  val CHANNEL = "com.flutter.epic/epic";

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine){
        //super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor , CHANNEL).setMethodCallHandler { methodCall, result ->
            if (methodCall.method == "printy") {

                var textData = methodCall.arguments

                result.success("HELLO FROM THE KOTLIN")
                var obj = JSONObject(textData.toString())
                Log.i("MyTag",obj.getString("OS"))

            }
        }
    }

//    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
//        GeneratedPluginRegistrant.registerWith(flutterEngine);
//
//    }
}
