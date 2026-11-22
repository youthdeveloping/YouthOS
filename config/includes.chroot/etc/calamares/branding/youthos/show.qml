// - by Claude Ai
// YouthOS 설치 중 보여 주는 슬라이드쇼
import QtQuick 2.0
import calamares.slideshow 1.0

Presentation {
    id: presentation

    Timer {
        interval: 6000
        running: true
        repeat: true
        onTriggered: presentation.goToNextSlide()
    }

    Slide {
        Rectangle { anchors.fill: parent; color: "#0f172a" }
        Text {
            anchors.centerIn: parent
            width: parent.width * 0.8
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            color: "#e2e8f0"
            font.pixelSize: 22
            text: "<h1 style='color:#38bdf8'>YouthOS에 오신 것을 환영합니다</h1>" +
                  "<p>청소년 개발자를 위한 코딩 학습 및 개발 환경입니다.</p>"
        }
    }

    Slide {
        Rectangle { anchors.fill: parent; color: "#0f172a" }
        Text {
            anchors.centerIn: parent
            width: parent.width * 0.8
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            color: "#e2e8f0"
            font.pixelSize: 22
            text: "<h1 style='color:#38bdf8'>코딩 입문부터 실전까지</h1>" +
                  "<p>Thonny, Python, Node.js, VS Code가 기본으로 설치되어 있습니다.</p>"
        }
    }

    Slide {
        Rectangle { anchors.fill: parent; color: "#0f172a" }
        Text {
            anchors.centerIn: parent
            width: parent.width * 0.8
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            color: "#e2e8f0"
            font.pixelSize: 22
            text: "<h1 style='color:#38bdf8'>GitHub와 Cloudflare</h1>" +
                  "<p>코드를 저장하고, 만든 웹사이트를 직접 배포해 보세요.</p>"
        }
    }

    Slide {
        Rectangle { anchors.fill: parent; color: "#0f172a" }
        Text {
            anchors.centerIn: parent
            width: parent.width * 0.8
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            color: "#e2e8f0"
            font.pixelSize: 22
            text: "<h1 style='color:#38bdf8'>함께 만들어 가요</h1>" +
                  "<p>youthdeveloping.github.io에서 우리 팀의 소식을 확인하세요.</p>"
        }
    }
}
