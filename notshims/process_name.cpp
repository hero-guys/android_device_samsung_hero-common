/*
 * Copyright (C) 2017 The Haxynox Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#define LOG_TAG "hx_porc"
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <pthread.h>
#include <utils/Log.h>
#include <hardware/power.h>
#include <hardware/hardware.h>

static const char* process_name = "unknown";

extern "C" const char*
get_process_name(void) {
  return process_name;
}

void libEvtLoading(void) {
    ALOGI("fake process name lib loaded +-Haxynox-+");
}

void libEvtUnloading(void) {
    ALOGI("Fake process name lib shuting down. Goodbye...");
} 

