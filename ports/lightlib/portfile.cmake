vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO NikSimDev/lightlib
    REF v0.1.4
    SHA512 cde4708a579a0e9c5565c6db333f9c44d6a28ba4c36e1b26f2d63927e42df6067bd5068332338b43f34aa305a0c0cc7f9af74ef5a395959856da114dfaf9ce8e
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/Light"
    GENERATOR "Visual Studio 18 2026"
    OPTIONS
        -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH share/lightlib)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")