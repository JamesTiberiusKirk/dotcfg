# !/bin/sh
TMP_PATH=/var/tmp
TMPL_PATH=/usr/share/doc/nvidia-driver-460/

echo "options nvidia NVreg_PreserveVideoMemoryAllocations=1 NVreg_TemporaryFilePath=${TMP_PATH}" | sudo tee /etc/modprobe.d/nvidia-power-management.conf 

sudo install --mode 644 "${TMPL_PATH}/nvidia-suspend.service" /etc/systemd/system
sudo install --mode 644 "${TMPL_PATH}/nvidia-hibernate.service" /etc/systemd/system
sudo install --mode 644 "${TMPL_PATH}/nvidia-resume.service" /etc/systemd/system
sudo install "${TMPL_PATH}/nvidia" /lib/systemd/system-sleep
sudo install "${TMPL_PATH}/nvidia-sleep.sh" /usr/bin

sudo systemctl enable nvidia-suspend.service
sudo systemctl enable nvidia-hibernate.service
sudo systemctl enable nvidia-resume.service
