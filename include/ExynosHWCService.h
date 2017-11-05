#ifndef ANDROID_EXYNOS_HWC_SERVICE_H_
#define ANDROID_EXYNOS_HWC_SERVICE_H_

#include <utils/Errors.h>
#include <utils/RefBase.h>
#include <stdint.h>
#include <sys/types.h>
#include <cutils/log.h>
#include <binder/IInterface.h>
#include <binder/IServiceManager.h>
#include <utils/Singleton.h>
#include <utils/StrongPointer.h>

typedef struct exynos5_hwc_composer_device_1_t ExynosHWCCtx;

namespace android {

class IExynosHWCService : public IInterface {
public:

    DECLARE_META_INTERFACE(ExynosHWCService);

    virtual int addVirtualDisplayDevice() = 0;
    virtual int destroyVirtualDisplayDevice() = 0;

    /*
     * setWFDMode() function sets the WFD operation Mode.
     * It enables / disables the WFD.
     */
    virtual int setWFDMode(unsigned int mode) = 0;
    virtual int setWFDOutputResolution(unsigned int width, unsigned int height,
                                  unsigned int disp_w, unsigned int disp_h) = 0;
    virtual int setVDSGlesFormat(int format) = 0;

    /*
     * setExtraFBMode() function Enables / disables the extra FB usage.
     */
    virtual int setExtraFBMode(unsigned int mode) = 0;
    virtual int setCameraMode(unsigned int mode) = 0;
    virtual int setForceMirrorMode(unsigned int mode) = 0;

    /*
     * setVideoPlayStatus() function sets the Video playback status.
     * It is used to inform the HWC about the video playback seek and
     * pause status.
     */
    virtual int setVideoPlayStatus(unsigned int mode) = 0;
    virtual int setExternalDisplayPause(bool onoff) = 0;
    virtual int setDispOrientation(unsigned int transform) = 0;
    virtual int setProtectionMode(unsigned int mode) = 0;
    virtual int setExternalDispLayerNum(unsigned int num) = 0;
    virtual int setForceGPU(unsigned int on) = 0;
    virtual int setExternalUITransform(unsigned int transform) = 0;
    virtual int getExternalUITransform(void) = 0;
    virtual int setWFDOutputTransform(unsigned int transform) = 0;
    virtual int getWFDOutputTransform(void) = 0;
    virtual void setHdmiResolution(int resolution, int s3dMode) = 0;
    virtual void setHdmiCableStatus(int status) = 0;
    virtual void setHdmiHdcp(int status) = 0;
    virtual void setHdmiAudioChannel(uint32_t channels) = 0;
    virtual void setHdmiSubtitles(bool use) = 0;
    virtual void setPresentationMode(bool use) = 0;
    virtual void setWFDSleepCtrl(bool black) = 0;

    virtual int  getWFDMode() = 0;
    virtual void getWFDOutputResolution(unsigned int *width, unsigned int *height) = 0;
    virtual int getWFDOutputInfo(int *fd1, int *fd2, struct wfd_layer_t *wfd_info) = 0;
    virtual int getPresentationMode(void) = 0;
    virtual void getHdmiResolution(uint32_t *width, uint32_t *height) = 0;
    virtual uint32_t getHdmiCableStatus() = 0;
    virtual uint32_t getHdmiAudioChannel() = 0;
    virtual void setHWCCtl(int ctrl, int val) = 0;
    virtual void setBootFinished(void) = 0;

    virtual void notifyPSRExit() = 0;
    virtual void setHWCDebug(int debug) = 0;
};

/* Native Interface */
class BnExynosHWCService : public BnInterface<IExynosHWCService> {
public:
    virtual status_t    onTransact( uint32_t code,
                                    const Parcel& data,
                                    Parcel* reply,
                                    uint32_t flags = 0);

};

class ExynosHWCService
    : public BnExynosHWCService,  Singleton<ExynosHWCService> {

public:
    static ExynosHWCService* getExynosHWCService();
    ~ExynosHWCService();

    virtual int addVirtualDisplayDevice();
    virtual int destroyVirtualDisplayDevice();

    virtual int setWFDMode(unsigned int mode);
    virtual int setWFDOutputResolution(unsigned int width, unsigned int height,
                                      unsigned int disp_w, unsigned int disp_h);
    virtual int setVDSGlesFormat(int format);
    virtual int setExtraFBMode(unsigned int mode);
    virtual int setCameraMode(unsigned int mode);
    virtual int setForceMirrorMode(unsigned int mode);
    virtual int setVideoPlayStatus(unsigned int mode);
    virtual int setExternalDisplayPause(bool onoff);
    virtual int setDispOrientation(unsigned int transform);
    virtual int setProtectionMode(unsigned int mode);
    virtual int setExternalDispLayerNum(unsigned int num);
    virtual int setForceGPU(unsigned int on);
    virtual int setExternalUITransform(unsigned int transform);
    virtual int getExternalUITransform(void);
    virtual int setWFDOutputTransform(unsigned int transform);
    virtual int getWFDOutputTransform(void);

    virtual void setHdmiResolution(int resolution, int s3dMode);
    virtual void setHdmiCableStatus(int status);
    virtual void setHdmiHdcp(int status);
    virtual void setHdmiAudioChannel(uint32_t channels);
    virtual void setHdmiSubtitles(bool use);
    virtual void setPresentationMode(bool use);
    virtual void setWFDSleepCtrl(bool black);

    virtual int getWFDMode();
    virtual void getWFDOutputResolution(unsigned int *width, unsigned int *height);
    virtual int getWFDOutputInfo(int *fd1, int *fd2, struct wfd_layer_t *wfd_info);
    virtual int getPresentationMode(void);
    virtual void getHdmiResolution(uint32_t *width, uint32_t *height);
    virtual uint32_t getHdmiCableStatus();
    virtual uint32_t getHdmiAudioChannel();
    virtual void setHWCCtl(int ctrl, int val);
    virtual void setHWCDebug(int debug);
    virtual void setExynosHWCCtx(ExynosHWCCtx *);
    virtual void setBootFinished(void);
    void setBootFinishedCallback(void (*callback)(exynos5_hwc_composer_device_1_t *));
    void setPSRExitCallback(void (*callback)(exynos5_hwc_composer_device_1_t *));

    virtual void notifyPSRExit();

private:
    friend class Singleton<ExynosHWCService>;
    ExynosHWCService();
    int createServiceLocked();
    ExynosHWCService *mHWCService;
    Mutex mLock;
    ExynosHWCCtx *mHWCCtx;
    void (*bootFinishedCallback)(exynos5_hwc_composer_device_1_t *);
    void (*doPSRExit)(ExynosHWCCtx *ctx);
};

}
#endif
