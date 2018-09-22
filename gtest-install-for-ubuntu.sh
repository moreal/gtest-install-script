function isInstalledPackage
{
    apt list --installed | grep $1 > /dev/null 2>&1;
}

if ! isInstalledPackage cmake ; then
    sudo apt install cmake
fi

if ! isInstalledPackage libgtest-dev ; then
    sudo apt install libgtest-dev
fi

cd /usr/src/gtest
sudo cmake CMakeList.txt
sudo make
sudo cp libgtest.* /usr/lib
sudo cp libgtest_main.* /usr/lib