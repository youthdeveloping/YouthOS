# YouthOS 기능 구현 현황

- by ChatGPT AI

이 문서는 저장소에 실제로 포함된 기능과 아직 실기기 검증이 필요한 기능을 구분한다.

| 영역 | 저장소 구현 | 검증 상태 |
|---|---|---|
| 디자인/브랜딩 | 로고, 배경화면, LightDM 배경, XFCE 기본 배경 | VM 화면 확인 필요 |
| 로그인/잠금 | LightDM GTK Greeter 설정, XFCE 화면 잠금 실행기 | 로그인/잠금 실동작 확인 필요 |
| 파일 관리자 | Thunar, GVFS, UDisks2, 기본 폴더 바로가기 | 파일 작업 및 외장장치 테스트 필요 |
| 제어판 | YouthOS 설정 센터에서 XFCE 설정으로 연결 | 각 설정 도구 실행 테스트 필요 |
| 네트워크/Wi-Fi | NetworkManager 및 nm-connection-editor | 무선 장치/드라이버별 테스트 필요 |
| 사운드/블루투스/디스플레이 | pavucontrol, Blueman, XFCE 디스플레이 설정 | 하드웨어별 테스트 필요 |
| 개발 도구 | Python, Thonny, Node.js/npm, Git, GitHub CLI, VS Code/Wrangler hooks | 앱 실행 및 인증은 사용자 환경에서 확인 필요 |
| 앱 관리 | Synaptic 실행기 | 패키지 설치/제거 및 권한 테스트 필요 |
| 시스템 업데이트 | 사용자 확인 후 apt update/upgrade 실행 | 업데이트/복구 테스트 필요 |
| 계정/권한 | 사용자 생성, sudo 그룹 부여, 계정 삭제(홈 폴더 보존) UI | 다중 사용자·권한 테스트 필요 |
| 설치 프로그램 | Calamares 및 YouthOS 브랜딩 | 설치 완료/부팅 검증 필요 |
| 호환성 | 정적 검사 및 테스트 체크리스트 | VM·실기기 테스트 미완료 |
| ISO 배포 | GitHub Actions 빌드 아티팩트 | 빌드 성공 및 배포 경로 확인 필요 |

"구현"은 실행 파일·패키지·설정이 저장소에 들어갔다는 뜻이며, 실제 기기에서 검증됐다는 뜻은 아니다.
