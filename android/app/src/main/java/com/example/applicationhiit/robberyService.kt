package com.example.applicationhiit

import android.app.Service
import android.content.Intent
import android.os.IBinder
import android.util.Log
import com.google.firebase.firestore.ktx.firestore
import com.google.firebase.ktx.Firebase
import io.flutter.plugins.firebase.auth.Constants.TAG

class robberyService : Service() {

    override fun onBind(intent: Intent): IBinder {
        TODO("Return the communication channel to the service.")
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        val db = Firebase.firestore
        val docRef = db.collection("cars").document("omEJeuM9UdUdol3hcNw9")
        docRef.addSnapshotListener { snapshot, e ->
            if (e != null) {
                Log.w(TAG, "Listen failed.", e)
                return@addSnapshotListener
            }

            if (snapshot != null && snapshot.exists()) {
                Log.d(TAG, "Current data: ${snapshot.data}")
               // if(snapshot.d)
            } else {
                Log.d(TAG, "Current data: null")
            }
        }
        return START_STICKY
    }

    override fun onDestroy() {
        super.onDestroy()
    }
}