package com.pycify.status_saver

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES

import io.flutter.embedding.android.FlutterActivity
import androidx.annotation.NonNull;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import android.net.Uri
import android.os.storage.StorageManager

import android.app.Activity


class MainActivity: FlutterActivity() {
  private val CHANNEL = "samples.flutter.dev/battery"

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
      call, result ->
      if (call.method == "permission") {
        getFolderPermission()

      } else {
        result.notImplemented()
      }
    }
  }
    private fun getFolderPermission(){
        val storageManager=application.getSystemService(Context.STORAGE_SERVICE) as StorageManager
        val intent=storageManager.primaryStorageVolume.createOpenDocumentTreeIntent()
        val targetDirectory= Uri.parse("Android/media").toString()
        var uri=intent.getParcelableExtra<Uri>( "android.provider.extra.INITIAL_URI")as Uri
        var scheme=uri.toString()
        scheme=scheme.replace( "/root/", "/tree/")
        scheme+="%3A$targetDirectory"
        uri=Uri.parse(scheme)
        intent.putExtra( "android.provider.extra.INITIAL_URI", uri)
        intent.putExtra("android.provider.extra.SHOW_ADVANCED",true)

        startActivityForResult(intent, 1234)
    }

    @Deprecated("Deprecated in Java")
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (resultCode == RESULT_OK){
            val treeUri = data?.data
            // tvPath.text  = treeUri.toString()
            if (treeUri != null){
                contentResolver.takePersistableUriPermission(treeUri,Intent.FLAG_GRANT_READ_URI_PERMISSION)
                // val fileDoc = DocumentFile.fromTreeUri(applicationContext,treeUri)

            }
        }
    }

}