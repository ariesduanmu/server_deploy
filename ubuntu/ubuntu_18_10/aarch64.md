`apt install qemu-user`

from `https://releases.linaro.org/components/toolchain/binaries/latest-7/aarch64-linux-gnu/` download "gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gun.tar.xz"

unzip: `tar -xvf gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gun.tar.xz`

cd in directory `bin` there is a gdb exe file

download 

`/lib/ld-linux-aarch64.so.1`

`https://ughe.github.io/data/2018/ld-linux-aarch64.so.1`

`/lib64/libc.so.6`

`https://ughe.github.io/data/2018/libc.so.6`

`qemu-aarch64 /home/ludian/RE/handy`