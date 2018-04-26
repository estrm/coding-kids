# Intro 介绍

`classify_ck_to_seven_emotion_group.sh` is a tool to help classify **extended-cohn-kanade-images-databases** to seven basic different emotion very quickly.

The number of different emotion images sequence with emotion_labels are as follows:

| emotion | anger | contempt | disgust | fear | happy | sadness | surprise |
| :------ | :---- | -------- | ------- | ---- | ----- | ------- | -------- |
| number  | 45    | 18       | 59      | 25   | 69    | 28      | 83       |

The sum is 327.

# Features 特性

* Cross-platform: works on Linux/Unix, Windows
* Tiny static and quick
* Very easy to use

# Usage 用法

1. At first

   You should download the **extended cohn kanade images databases** from

   CMU's official site  http://www.consortium.ri.cmu.edu/ckagree/ .

2. And then

   Put `classify_ck_to_seven_emotion_group.sh` to **extended-cohn-kanade-images** directory. You can see its structure of directory tree is like:

   ```tree
   ├─classify_ck_to_seven_emotion_group.sh
   ├─cohn-kanade-images
   ├─Emotion_labels
   ├─FACS_labels
   └─Landmarks
   ```

3. The last

   Just run the shell, and you will see classified image sequences in folder **ck**.

   ```bash
   sh classify_ck_to_seven_emotion_group.sh
   ```

# Contact 联系

Email: guguant(you know)yahoo(dot)com
