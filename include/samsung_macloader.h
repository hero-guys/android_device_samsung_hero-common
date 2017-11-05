/*
 * Copyright (C) 2017 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#ifndef SAMSUNG_MACLOADER_H
#define SAMSUNG_MACLOADER_H

/*
 * Board specific nodes
 *
 * If your kernel exposes these controls in another place, you can either
 * symlink to the locations given here, or override this header in your
 * device tree.
 */

/* NVRAM calibration, NULL if calibration unneeded */
#define WIFI_DRIVER_NVRAM_PATH "/etc/wifi/nvram_net.txt"

/* NVRAM calibration parameters */
#define WIFI_DRIVER_NVRAM_PATH_PARAM "/sys/module/dhd/parameters/nvram_path"

/* Physical address (MAC) */
#define MACADDR_PATH "/efs/wifi/.mac.info"

/* Consumer identification number (CID) */
#define CID_PATH "/data/.cid.info"

#endif // SAMSUNG_MACLOADER_H
