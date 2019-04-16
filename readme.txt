
Build into android rootfs image.

Step 1: Install codec library.

	tar xzvf fsl_aacp_dec.tar.gz
	cp -r fsl_aacp_dec/ ~/myandroid/$(FSL_RESTRICTED_CODEC_PATH)/fsl-restricted-codec/
	cd ~/myandroid
	touch $(FSL_RESTRICTED_CODEC_PATH)/fsl-restricted-codec/fsl_aacp_dec/archXX/*
	source build/envsetup.sh
	lunch // and select build name from menu
	make

