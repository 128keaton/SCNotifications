include $(THEOS)/makefiles/common.mk
export ARCHS=arm64
TWEAK_NAME = SCNotifications
SCNotifications_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 Snapchat"
