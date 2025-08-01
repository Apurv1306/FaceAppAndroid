package com.example.faceapp;

import android.os.Bundle;
import android.webkit.WebView;
import androidx.appcompat.app.AppCompatActivity;

import com.chaquo.python.Kwarg;
import com.chaquo.python.Python;
import com.chaquo.python.android.AndroidPlatform;

public class MainActivity extends AppCompatActivity {
    private WebView webView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        if (!Python.isStarted()) {
            Python.start(new AndroidPlatform(this));
        }
        Python py = Python.getInstance();
        new Thread(() -> {
            py.getModule("python-app") // your python file name without .py
              .callAttr("app")
              .callAttr("run",
                Kwarg.of("host", "0.0.0.0"),
                Kwarg.of("port", 5000),
                Kwarg.of("debug", false));
        }).start();

        setContentView(R.layout.activity_main);

        webView = findViewById(R.id.webview);
        webView.getSettings().setJavaScriptEnabled(true);
        webView.loadUrl("http://127.0.0.1:5000/");
    }
}
