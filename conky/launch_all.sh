#!/bin/bash
sleep 10
conky -dq -c ~/.conky/processes_rc
conky -dq -c ~/.conky/memory_rc
conky -dq -c ~/.conky/filesystem_rc
conky -dq -c ~/.conky/network_rc
conky -dq -c ~/.conky/temperature_rc
