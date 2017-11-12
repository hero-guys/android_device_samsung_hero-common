/*
 * Copyright (C) 2017 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <telephony/ril.h>

#ifndef SAMSUNG_AUDIO_H
#define SAMSUNG_AUDIO_H

#define MIXER_CARD 0
#define SOUND_CARD 0

/* Playback */
#define SOUND_DEEP_BUFFER_DEVICE 3
#define SOUND_PLAYBACK_DEVICE 6
#define SOUND_PLAYBACK_SCO_DEVICE 2

/* Capture */
#define SOUND_CAPTURE_DEVICE 0
#define SOUND_CAPTURE_SCO_DEVICE 2

/* Voice calls */
#define SOUND_PLAYBACK_VOICE_DEVICE 1
#define SOUND_CAPTURE_VOICE_DEVICE 1

/* Wideband AMR callback */
#ifndef RIL_UNSOL_SNDMGR_WB_AMR_REPORT
#ifdef RIL_UNSOL_WB_AMR_STATE
#define RIL_UNSOL_SNDMGR_WB_AMR_REPORT RIL_UNSOL_WB_AMR_STATE
#else
#define RIL_UNSOL_SNDMGR_WB_AMR_REPORT 0
#endif
#endif

/* Unusupported
#define SOUND_CAPTURE_LOOPBACK_AEC_DEVICE 1
#define SOUND_CAPTURE_HOTWORD_DEVICE 0
*/


#endif // SAMSUNG_AUDIO_H
