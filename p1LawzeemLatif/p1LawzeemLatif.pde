import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import controlP5.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import controlP5.*;
import processing.sound.*;

ControlP5 cp5;
Textlabel timerLabel;
Textlabel powerLabel;
Textlabel soundLabel;

int time = 0;
int powerSetting = 0;
boolean start = false;
boolean sound = false;
Minim newMinim;
AudioPlayer music;

void setup(){
  // Minim library is used to play sound files
  newMinim = new Minim(this);
  //Set the size of the program according to gif specifications
  size(1000, 500);
  background(0, 255, 0);
  cp5 = new ControlP5(this);
  //Setting up the labels and buttons for the microwave
  timerLabel = cp5.addTextlabel("label").setText("0000").setPosition(800,0).setSize(50,25).setColorValue(#ffffff).setFont(createFont("Georgia",20));
  cp5.addButton("Power").setValue(12).setPosition(700, 50).setSize(100, 50).setFont(createFont("Georgia",20)).setColorBackground(#B33B00);
  powerLabel = cp5.addTextlabel("power").setText("Low").setPosition(800,50).setSize(50,50).setColorValue(#00ffff).setFont(createFont("Georgia",20));
  cp5.addButton("Sound").setValue(13).setPosition(850, 50).setSize(100, 50).setFont(createFont("Georgia",20)).setColorBackground(#6A0080);
  soundLabel = cp5.addTextlabel("sound").setText("Off").setPosition(950,50).setSize(50,50).setColorValue(#AF002A).setFont(createFont("Georgia",20));
  cp5.addButton("1").setValue(1).setPosition(700, 100).setSize(100, 50).setFont(createFont("Georgia",20));
  cp5.addButton("2").setValue(2).setPosition(800, 100).setSize(100, 50).setFont(createFont("Georgia",20));
  cp5.addButton("3").setValue(3).setPosition(900, 100).setSize(100, 50).setFont(createFont("Georgia",20));
  cp5.addButton("4").setValue(4).setPosition(700, 150).setSize(100, 50).setFont(createFont("Georgia",20));
  cp5.addButton("5").setValue(5).setPosition(800, 150).setSize(100, 50).setFont(createFont("Georgia",20));
  cp5.addButton("6").setValue(6).setPosition(900, 150).setSize(100, 50).setFont(createFont("Georgia",20));
  cp5.addButton("7").setValue(7).setPosition(700, 200).setSize(100, 50).setFont(createFont("Georgia",20));
  cp5.addButton("8").setValue(8).setPosition(800, 200).setSize(100, 50).setFont(createFont("Georgia",20));
  cp5.addButton("9").setValue(9).setPosition(900, 200).setSize(100, 50).setFont(createFont("Georgia",20));
  cp5.addButton("0").setValue(0).setPosition(700, 250).setSize(300, 50).setFont(createFont("Georgia",20));
  cp5.addButton("Start").setValue(10).setPosition(700, 300).setSize(150, 100).setFont(createFont("Georgia",20)).setColorBackground(#3B7A57);
  cp5.addButton("Stop/Clear").setValue(11).setPosition(850, 300).setSize(150, 100).setFont(createFont("Georgia",20)).setColorBackground(#D3212D);
  cp5.addButton("Open").setValue(14).setPosition(700, 400).setSize(300, 100).setFont(createFont("Georgia",20)).setColorBackground(#FFBF00);
}

// Draw function
void draw(){
  background(0);
  fill(#33001A);
  rect(700,0,300,50);
  fill(#003333);
  rect(0,0,700,500);
  
  // This sets the microwave color to yellow or white to visualize if the device is on or off
  if(start){
    fill(0xffffff00);
  }else{
    fill(#ffffff);
  }
  rect(50,50,600,400);
}

public void Start(){
  println("Start");
}
// Event controller that takes button values and plays sounds, updates timer or toggles settings
void controlEvent(CallbackEvent event) {
  if (event.getAction() == ControlP5.ACTION_CLICK) {
    float value = event.getController().getValue();
    if(value == 0){
      timer(int(value));
      if(!start){
        playSound(int(value));
      }
    }else if(value == 1){
      timer(int(value));
      if(!start){
        playSound(int(value));
      }
    }else if(value == 2){
      timer(int(value));
      if(!start){
        playSound(int(value));
      }
    }else if(value == 3){
      timer(int(value));
      if(!start){
        playSound(int(value));
      }
    }else if(value == 4){
      timer(int(value));
      if(!start){
        playSound(int(value));
      }
    }else if(value == 5){
      timer(int(value));
      if(!start){
        playSound(int(value));
      }
    }else if(value == 6){
      timer(int(value));
      if(!start){
        playSound(int(value));
      }
    }else if(value == 7){
      timer(int(value));
      if(!start){
        playSound(int(value));
      }
    }else if(value == 8){
      timer(int(value));
      if(!start){
        playSound(int(value));
      }
    }else if(value == 9){
      timer(int(value));
      if(!start){
        playSound(int(value));
      }
    }else if(value == 10){
      println("Started");
      if(!start){
        playSound(int(value));
        start = true;
        //while(start){
        //  start = countdown(time);
        //}
      }
    }else if(value == 12){
      // Power settings here, goes between 0 for low, 1 for medium and 2 for high
      // Depending on setting, it changes label and color to visualize
      if(powerSetting == 0){
        powerLabel.setText("Medium");
        powerLabel.setColorValue(#FFBF00);
        if(sound){
          music = newMinim.loadFile("Medium_Power.mp3");
          music.play();
        }
        powerSetting = 1;
      }else if(powerSetting == 1){
        powerLabel.setText("High");
        powerLabel.setColorValue(#E32636);
        if(sound){
          music = newMinim.loadFile("High_Power.mp3");
          music.play();
        }
        powerSetting = 2;
      }else{
        powerLabel.setText("Low");
        powerLabel.setColorValue(#00ffff);
        if(sound){
          music = newMinim.loadFile("Low_Power.mp3");
          music.play();
        }
        powerSetting = 0;
      }
    }else if(value == 13){
      // Toggle for sound
      if(!start){
        if(!sound){
          music = newMinim.loadFile("Sound_On.mp3");
          music.play();
          soundLabel.setText("On");
          soundLabel.setColorValue(#84DE02);
          sound = true;
        }else{
          music = newMinim.loadFile("Sound_Off.mp3");
          music.play();
          soundLabel.setText("Off");
          soundLabel.setColorValue(#AF002A);
          sound = false;
        }
      }
      else{
      }
    }else if(value == 14){
      if(sound){
        music = newMinim.loadFile("Open.mp3");
        music.play();
        time = 0;
        start = false;
        UpdateTimer();
      }
    }
    else{
      // Stop and clear function
      println("Stopped and Cleared");
      time = 0;
      start = false;
      playSound(int(value));
      UpdateTimer();
    }
  }
}
// Timer function, only 4 digits allowed, if length is more than 4 then the first digit is removed and next number moves up
public void timer(int input){
  int length = String.valueOf(time).length();
  println("length = "+length);
  if(length == 4 && !start){
    println("Here : "+(String.valueOf(time).charAt(0) - '0'));
    int toMinus = String.valueOf(time).charAt(0) - '0';
    time = time - (toMinus * 1000);
    println("Time to minus : "+toMinus);
    println("Time after minus : "+time);
  }
  if(!start){
    time = (time*10)+input;
  }
  UpdateTimer();
  println(time);
}
// Function to update timer label
public void UpdateTimer(){
  timerLabel.setText(String.valueOf(time));
}
// Created a countdown function that ran a loop based on timer, however, it was too fast and visualization didn't occur so removed it
//public boolean countdown(int time){
//  println("Entered countdown!");
//  println("Time : "+time);
//  int min = 0;
//  int sec = 0;
//  int length = String.valueOf(time).length();
//  if(length == 1){
//    sec = String.valueOf(time).charAt(0) - '0';
//  }else if (length == 2){
//    sec = ((String.valueOf(time).charAt(0) - '0')*10)+(String.valueOf(time).charAt(1) - '0');
//  }else if (length == 3){
//     min = String.valueOf(time).charAt(0) - '0';
//     sec = ((String.valueOf(time).charAt(1) - '0')*10)+(String.valueOf(time).charAt(2) - '0');
//  }else{
//     min = ((String.valueOf(time).charAt(0) - '0')*10)+(String.valueOf(time).charAt(1) - '0');
//     sec = ((String.valueOf(time).charAt(2) - '0')*10)+(String.valueOf(time).charAt(3) - '0');
//  }
//  println("min : "+min+" sec : "+sec); 
//  for(int i = min; i > 0; i--){
//     for(int j = sec; j > 0; j--){
//       sec = sec - 1;
//       time = int(String.valueOf(min)+(String.valueOf(sec)));
//       UpdateTimer();
//     }
//     min = min - 1;
//     time = int(String.valueOf(min)+(String.valueOf(sec)));
//     UpdateTimer();
//  }
//  println("Finished");
//  return false;
//}
// A function to play the numbers, created a seperate function to reduce code clutter
public void playSound(int value){
  if(sound){
    String[] soundList = new String[12];
    soundList[0] = "0.mp3";
    soundList[1] = "1.mp3";
    soundList[2] = "2.mp3";
    soundList[3] = "3.mp3";
    soundList[4] = "4.mp3";
    soundList[5] = "5.mp3";
    soundList[6] = "6.mp3";
    soundList[7] = "7.mp3";
    soundList[8] = "8.mp3";
    soundList[9] = "9.mp3";
    soundList[10] = "Start.mp3";
    soundList[11] = "Stop.mp3";
    music = newMinim.loadFile(soundList[value]);
    music.play();
    //music.pause();
  }
}
