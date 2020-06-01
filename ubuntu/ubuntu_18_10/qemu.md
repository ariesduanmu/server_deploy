sudo apt install -y qemu qemu-utils cloud-utils 
wget https://releases.linaro.org/components/kernel/uefi-linaro/15.12/release/qemu64/QEMU_EFI.fd
wget https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-arm64-uefi1.img

sudo sudo apt-add-repository ppa:gns3/qemu
sudo apt update
sudo apt install qemu-system-aarch64

#cloud-config
 
users:
  - name: <your_username>
    ssh-authorized-keys:
      - ssh-rsa AAAAB3NzaC1y....
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    groups: sudo
    shell: /bin/bash
    
#cloud-config
password: asdfqwer
chpasswd: { expire: False }
ssh_pwauth: True

qemu-system-aarch64 -m 1024 -smp 2 -cpu cortex-a57 -M virt -nographic \
  -pflash flash0.img \
  -pflash flash1.img \
  -drive if=none,file=ubuntu-16.04-server-cloudimg-arm64-uefi1.img,id=hd0 \
  -device virtio-blk-device,drive=hd0 \
  -drive if=none,id=cloud,file=cloud.img \
  -device virtio-blk-device,drive=cloud \
  -netdev user,id=user0 -device virtio-net-device,netdev=user0 \
  -nic user,hostfwd=tcp::5022-:22
