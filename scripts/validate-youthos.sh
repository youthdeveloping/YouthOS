#!/bin/sh
# - by ChatGPT AI
# Static preflight checks for the YouthOS live-build source tree.
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT"

fail() { echo "[FAIL] $*" >&2; exit 1; }
pass() { echo "[ OK ] $*"; }

required_files="
auto/config
config/package-lists/youthos.list.chroot
config/includes.chroot/usr/local/bin/youthos-open-folder
config/includes.chroot/usr/local/bin/youthos-welcome
config/includes.chroot/usr/local/bin/youthos-control-center
config/includes.chroot/usr/local/bin/youthos-update
config/includes.chroot/usr/local/bin/youthos-app-center
config/includes.chroot/usr/local/bin/youthos-lock
config/includes.chroot/usr/local/bin/youthos-system-info
config/includes.chroot/usr/share/youthos/welcome.txt
config/includes.chroot/etc/skel/Desktop/youthos-home.desktop
config/includes.chroot/etc/skel/Desktop/youthos-documents.desktop
config/includes.chroot/etc/skel/Desktop/youthos-downloads.desktop
config/includes.chroot/etc/skel/Desktop/youthos-projects.desktop
config/includes.chroot/etc/skel/Desktop/youthos-welcome.desktop
config/includes.chroot/etc/skel/Desktop/youthos-wallpaper.desktop
config/includes.chroot/etc/skel/Desktop/youthos-settings.desktop
config/includes.chroot/etc/skel/Desktop/youthos-app-center.desktop
config/includes.chroot/etc/skel/Desktop/youthos-update.desktop
config/includes.chroot/etc/skel/Desktop/youthos-lock.desktop
config/includes.chroot/etc/skel/Desktop/youthos-system-info.desktop
"
for file in $required_files; do
  [ -f "$file" ] || fail "필수 파일 없음: $file"
done
pass "필수 YouthOS 파일 확인"

packages="thunar mousepad xfdesktop4 xfce4-settings xfce4-terminal gvfs udisks2 firefox-esr python3 git network-manager network-manager-gnome yad pavucontrol blueman policykit-1 synaptic"
for package in $packages; do
  grep -Eq "^[[:space:]]*${package}([[:space:]]|$)" config/package-lists/youthos.list.chroot || fail "패키지 목록 누락: $package"
done
pass "핵심 패키지 목록 확인"

find auto config/hooks/live config/includes.chroot/usr/local/bin -type f -exec sh -n {} \; || fail "셸 스크립트 문법 오류"
pass "셸 스크립트 문법 확인"

if command -v desktop-file-validate >/dev/null 2>&1; then
  find config/includes.chroot/etc/skel/Desktop config/includes.chroot/usr/share/applications -name '*.desktop' -type f -print0 |
    xargs -0 -r desktop-file-validate
  pass "데스크톱 바로가기 형식 확인"
else
  echo "[WARN] desktop-file-validate 미설치: 바로가기 형식 검사는 건너뜀"
fi

grep -q 'YouthOS에 오신 것을 환영합니다' config/includes.chroot/usr/share/youthos/welcome.txt || fail "환영 문서 내용 확인 실패"
[ -s config/includes.chroot/usr/share/backgrounds/youthos/wallpaper.png ] || fail "배경화면 파일 없음"
pass "환영 문서 및 배경화면 확인"

echo "YouthOS 정적 사전 검사 통과"
