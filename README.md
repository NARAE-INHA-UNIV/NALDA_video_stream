# NALDA_video_stream

## 환경
+ Qt 6.2 Qt quick application (C++ + Qml)

+ QtMultiMedia 모듈 

## (실사용 전) 개선해야할지도 모르는 항목들
Qt를 통한 영상송출 프로그램 구현은 Qt버전에 따라, 또 Gui로 Qml을 사용하느냐 QWidget을 사용하느냐에 따라 구성하는 방법이 상이하다.

Qt6은 영상송출을 편리하기 위해 QtMultiMedia 모듈이 존재한다.

하지만 사용하는 PC의 운영체제에 따라 QtMultiMedia 모듈의 백엔드 기술이 다르고, 직접 Qt 공식 Document(https://doc.qt.io/archives/qt-5.15/qtmultimedia-index.html) 에서도 이에 따른 효과를 설명하고 있다. 


![image](https://github.com/user-attachments/assets/55094e6b-de4c-47cd-8937-16ffefa55eea)


즉 Qt Multimedia는 대부분의 OS에서 FFmpeg를 내부적으로 사용하지만, 플랫폼에 따라 성능, 코덱, 가속 기능 차이가 있으므로 안정적인 구동을 위한 직접 테스트가 필수일 것이다.

수신(GCS)측에서는 환경변수 설정으로 백엔드를 FFmpeg, GStreamer 중 선택할 수 있다.

+ 참고: FFmpeg , Gstreamer

![image](https://github.com/user-attachments/assets/fc96030d-1c7a-46b6-9d0d-b8a6adc5ff27)



## 시행착오
아무래도 Gstreamer측에서 2014년 이후로 Qt와의 Binding에 관한 업데이트가 없는 걸로 봐서는,

Qt에 Cmake(또는 qmake)로 직접 Gstreamer Plugin들을 설정하여 GStreamer 코딩을 하는 것 보다

그냥 Qt측에서 제공하는 QtMultiMedia를 잘 활용하여 코딩하는 것이 편리함과 정보, 에러 발생 빈도 등 모든 차원에서 훨씬 좋았다. 

또 Qt 6.2부터는 QML에서 기존의 MediaPlayer, VideoOutput 컴포넌트 둘을 통합하여 Video 컴포넌트로 단순화하였는데, 이게 사용하기 더 쉬웠다. 

