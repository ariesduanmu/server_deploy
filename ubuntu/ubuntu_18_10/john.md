* `git clone https://github.com/magnumripper/JohnTheRipper.git`
* `cd src`
* `sudo ./configure –disable-openmp`
* `make -s clean && make -sj4`
* `mv ../run/john ../run/john-non-omp`
* `sudo ./configure CPPFLAGS='-DOMP_FALLBACK -DOMP_FALLBACK_BINARY="\"john-non-omp\""'`
* `make -s clean && make -sj4`
* `sudo make shell-completion`
* `cd ../run`
* `./john`
* `export PATH="~/JohnTheRipper/run/:$PATH"`