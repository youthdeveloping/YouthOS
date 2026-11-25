# YouthOS 시스템 구조

- by ChatGPT AI

## 기반

- Debian 13 (trixie)
- live-build로 라이브 ISO 구성
- XFCE 데스크톱
- Calamares 설치 프로그램
- 한국어 로케일 및 fcitx5-hangul

## 저장소 구조

- `auto/`: live-build 설정
- `config/package-lists/`: ISO에 설치할 패키지
- `config/hooks/live/`: 빌드 중 chroot 내부에서 실행할 구성 스크립트
- `config/includes.chroot/`: 라이브 시스템의 루트 파일 시스템에 복사할 파일
- `branding/`: 로고, 부팅 이미지
- `.github/workflows/`: ISO 빌드와 웹 체험판 배포 자동화
- `web/`: 실제 OS가 아닌 브라우저 기반 시각 체험판

## 새 사용자 파일

`config/includes.chroot/etc/skel/`은 새 계정의 홈 디렉터리에 복사됩니다. 따라서 바탕화면 바로가기와 기본 문서·예제 프로젝트를 이 경로에 둡니다.

## 기능 구분

- 실제 OS 기능은 `config/`, `auto/`, `branding/`에 구현합니다.
- `web/`은 실제 디스크·커널·패키지를 실행하지 않는 별도 시뮬레이션입니다.
- GitHub 및 Cloudflare 인증정보는 ISO에 저장하지 않습니다. 사용자가 설치 후 공식 로그인 절차를 거칩니다.

## 품질 기준

소스 정적 검사 → ISO 빌드 → 가상 머신 라이브 부팅 → 가상 머신 설치 → 실기기 호환성 테스트 순서로 검증합니다. 앞 단계 통과를 뒤 단계의 성공으로 간주하지 않습니다.
