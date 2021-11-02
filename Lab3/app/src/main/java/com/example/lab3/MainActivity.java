package com.example.lab3;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.view.View;
import android.widget.Toast;

/*
* ScriptEngineManager manager = new ScriptEngineManager();
* ScriptEngine engine = manager.getEngineByName("js");
* System.out.println(engine.eval("4*5"));
* */

public class MainActivity extends AppCompatActivity {

    TextView result;

    String op1;
    String op2;

    boolean isSecondNum = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        result = findViewById(R.id.result);
    }

    public void numberEvent(View view) {
        String number = result.getText().toString();

        Button b = (Button) view;

        number += b.getText().toString();

        if (isSecondNum) {
            op2 = number;
        } else {
            op1 = number;
        }

        result.setText(number);

//        Toast.makeText(getApplicationContext(), b.getText().toString(), Toast.LENGTH_SHORT).show();


    }
}