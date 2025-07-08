import QtQuick
import QtMultimedia

Window {
    width: 1280
    height: 720
    visible: true
    title: "실시간 드론 영상"

    // 배경을 검은색으로 설정
    color: "black"

    // Qt 6.2 이상에서 권장하는 Video 컴포넌트
    Video {
        id: videoPlayer
        //id 지정의 이유 : 이렇게 id를 부여하면, 다른 QML 컴포넌트나 코드에서 myVideoPlayer.play(), myVideoPlayer.stop()처럼 이 Video 아이템을 제어할 수 있게 됨

        anchors.fill: parent

        // 여기에 라즈베리 파이에서 송출하는 RTSP 스트림 주소를 입력해야함
        source: "rtsp://192.168.1.10:8554/stream"

        // 로딩이 완료되면 자동으로 재생 시작
        autoPlay: true
    }
}


